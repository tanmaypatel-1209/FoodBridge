using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FoodBridge.DATA;
using FoodBridge.DTOs;
using FoodBridge.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;

namespace FoodBridge.services
{
    /// <summary>
    /// Responsible for finding and ranking available Transporters by geographic
    /// distance from a given pickup point, and for sorting available deliveries
    /// nearest-first for the Transporter dashboard.
    ///
    /// Architecture:
    ///   Controller → TransporterMatchingService → IDistanceService → Database
    ///
    /// This service does NOT modify any delivery state. It is read-only.
    /// </summary>
    public class TransporterMatchingService
    {
        private readonly FoodBridgeDB _context;
        private readonly IDistanceService _distanceService;
        private readonly double _defaultRadiusKm;
        private readonly double _maximumRadiusKm;
        private readonly int _maxResults;
        private readonly int _locationStaleMinutes;

        // Active delivery statuses — Transporters with these deliveries are excluded
        private static readonly HashSet<string> ActiveDeliveryStatuses = new(StringComparer.OrdinalIgnoreCase)
        {
            "TransporterAssigned",
            "Accepted",
            "PickupPending",
            "PickedUp",
            "InTransit",
            "ReceiverArrived"
        };

        public TransporterMatchingService(
            FoodBridgeDB context,
            IDistanceService distanceService,
            IConfiguration configuration)
        {
            _context = context;
            _distanceService = distanceService;

            var section = configuration.GetSection("TransporterMatching");
            _defaultRadiusKm     = section.GetValue<double>("DefaultRadiusKm", 20);
            _maximumRadiusKm     = section.GetValue<double>("MaximumRadiusKm", 50);
            _maxResults          = section.GetValue<int>("MaxResults", 10);
            _locationStaleMinutes = section.GetValue<int>("LocationStaleThresholdMinutes", 30);
        }

        // ──────────────────────────────────────────────────────────────────────
        // 1. Find nearby Transporters for a given delivery
        // ──────────────────────────────────────────────────────────────────────

        /// <summary>
        /// Finds and ranks available Transporters nearest to the Donor pickup location.
        /// </summary>
        /// <param name="deliveryId">ID of the FoodDelivery to match for.</param>
        /// <param name="radiusKm">
        /// Search radius in km. If null, uses DefaultRadiusKm from config.
        /// Capped at MaximumRadiusKm.
        /// </param>
        public async Task<(bool Success, string? Error, NearbyTransportersResponseDTO? Result)>
            GetNearbyTransportersAsync(int deliveryId, double? radiusKm = null)
        {
            // ── Validate delivery ───────────────────────────────────────────
            var delivery = await _context.FoodDeliveries
                .FirstOrDefaultAsync(d => d.Id == deliveryId);

            if (delivery == null)
                return (false, "Delivery not found.", null);

            if (delivery.Status != "AwaitingTransporter" || !string.IsNullOrEmpty(delivery.TransporterId))
                return (false, "This delivery has already been assigned to a Transporter.", null);

            // ── Get Donor food + coordinates ────────────────────────────────
            var match = await _context.MatchedFoods
                .FirstOrDefaultAsync(m => m.id == delivery.MatchedFoodId);

            Food? food = null;
            NeededFood? neededFood = null;

            if (match != null)
            {
                food = await _context.Foods.FirstOrDefaultAsync(f => f.id == match.FID);
                neededFood = await _context.NeededFoods.FirstOrDefaultAsync(n => n.id == match.NFID);
            }

            if (food == null || food.PickupLatitude == null || food.PickupLongitude == null)
            {
                return (false, "Pickup location coordinates are unavailable. The Donor must provide coordinates.", null);
            }

            double pickupLat = food.PickupLatitude.Value;
            double pickupLon = food.PickupLongitude.Value;

            // ── Determine search radius ─────────────────────────────────────
            double radius = radiusKm.HasValue
                ? Math.Min(radiusKm.Value, _maximumRadiusKm)
                : _defaultRadiusKm;

            // ── Query available Transporters ────────────────────────────────
            var candidates = await _context.Users
                .Where(u => u.role == "Transporter"
                         && u.AvailabilityStatus == "Available"
                         && u.Latitude != null
                         && u.Longitude != null
                         && u.Latitude != 0.0
                         && u.Longitude != 0.0)
                .ToListAsync();

            // ── Exclude Transporters with stale location ────────────────────
            var freshnessThreshold = DateTime.UtcNow.AddMinutes(-_locationStaleMinutes);
            candidates = candidates
                .Where(t => t.LastLocationUpdatedAt.HasValue
                         && t.LastLocationUpdatedAt.Value >= freshnessThreshold)
                .ToList();

            if (!candidates.Any())
                return BuildEmptyResult(deliveryId, food, neededFood, radius,
                    "No Transporters with valid, recent location are currently available.");

            // ── Exclude Transporters with an active delivery ────────────────
            var busyTransporterIds = await GetBusyTransporterIdsAsync();
            candidates = candidates
                .Where(t => !busyTransporterIds.Contains(t.EmailID))
                .ToList();

            // ── Calculate distances and filter by radius ────────────────────
            var ranked = candidates
                .Select(t => new
                {
                    Transporter = t,
                    Distance = _distanceService.CalculateDistanceKm(
                        t.Latitude!.Value, t.Longitude!.Value,
                        pickupLat, pickupLon)
                })
                .Where(x => x.Distance <= radius)
                .OrderBy(x => x.Distance)
                .Take(_maxResults)
                .ToList();

            if (!ranked.Any())
                return BuildEmptyResult(deliveryId, food, neededFood, radius,
                    $"No available Transporters found within {radius} km of the pickup location.");

            // ── Build response ──────────────────────────────────────────────
            var dtos = ranked.Select(x => new NearbyTransporterDTO
            {
                TransporterId      = x.Transporter.EmailID,
                TransporterName    = x.Transporter.Username,
                DistanceToPickupKm = Math.Round(x.Distance, 2),
                AvailabilityStatus = x.Transporter.AvailabilityStatus,
                LastLocationUpdate = FormatLastUpdate(x.Transporter.LastLocationUpdatedAt)
            }).ToList();

            var pickupLabel    = food.perfectLocation ?? food.location ?? food.city ?? "Donor Location";
            var receiverLabel  = neededFood?.perfectLocation ?? neededFood?.location ?? neededFood?.city ?? "Receiver Location";

            return (true, null, new NearbyTransportersResponseDTO
            {
                DeliveryId        = deliveryId,
                PickupLocation    = pickupLabel,
                ReceiverLocation  = receiverLabel,
                SearchRadiusKm    = $"{radius} km",
                TransportersFound = dtos.Count,
                Transporters      = dtos
            });
        }

        // ──────────────────────────────────────────────────────────────────────
        // 2. Sort available deliveries by distance for the Transporter dashboard
        // ──────────────────────────────────────────────────────────────────────

        /// <summary>
        /// Returns available (AwaitingTransporter) deliveries sorted nearest-first
        /// based on the logged-in Transporter's current location.
        ///
        /// If the Transporter has no valid location, deliveries are returned sorted
        /// by creation date (newest first) without distance info.
        /// </summary>
        public async Task<List<NearbyDeliveryDTO>> GetNearbyDeliveriesForTransporterAsync(
            string transporterEmail)
        {
            // Get Transporter's current location
            var transporter = await _context.Users.FindAsync(transporterEmail);

            bool hasLocation = transporter != null
                            && transporter.Latitude.HasValue
                            && transporter.Longitude.HasValue
                            && transporter.Latitude.Value != 0.0
                            && transporter.Longitude.Value != 0.0;

            // Get all available deliveries
            var deliveries = await _context.FoodDeliveries
                .Where(d => d.Status == "AwaitingTransporter" && string.IsNullOrEmpty(d.TransporterId))
                .OrderByDescending(d => d.CreatedAt)
                .ToListAsync();

            if (!deliveries.Any())
                return new List<NearbyDeliveryDTO>();

            // Gather related data in bulk
            var matchIds = deliveries.Select(d => d.MatchedFoodId).Distinct().ToList();
            var matches = await _context.MatchedFoods.Where(m => matchIds.Contains(m.id)).ToListAsync();
            var foodIds = matches.Select(m => m.FID).Distinct().ToList();
            var neededFoodIds = matches.Select(m => m.NFID).Distinct().ToList();
            var foods = await _context.Foods.Where(f => foodIds.Contains(f.id)).ToListAsync();
            var neededFoods = await _context.NeededFoods.Where(n => neededFoodIds.Contains(n.id)).ToListAsync();

            var donorEmails = deliveries.Select(d => d.DonorId).Distinct().ToList();
            var receiverEmails = deliveries.Select(d => d.ReceiverId).Distinct().ToList();
            var allEmails = donorEmails.Concat(receiverEmails).Distinct().ToList();
            var users = await _context.Users.Where(u => allEmails.Contains(u.EmailID)).ToListAsync();

            var matchMap     = matches.ToDictionary(m => m.id);
            var foodMap      = foods.ToDictionary(f => f.id);
            var neededFoodMap = neededFoods.ToDictionary(n => n.id);
            var userMap      = users.ToDictionary(u => u.EmailID);

            var result = new List<NearbyDeliveryDTO>();

            foreach (var d in deliveries)
            {
                matchMap.TryGetValue(d.MatchedFoodId, out var match);
                Food? food = null;
                NeededFood? neededFood = null;
                if (match != null)
                {
                    foodMap.TryGetValue(match.FID, out food);
                    neededFoodMap.TryGetValue(match.NFID, out neededFood);
                }

                userMap.TryGetValue(d.DonorId, out var donorUser);
                userMap.TryGetValue(d.ReceiverId, out var receiverUser);

                // Calculate distances if all coordinates are present
                double? distanceToPickup = null;
                double? pickupToReceiver = null;
                double? estimatedTotal   = null;
                bool hasDistanceInfo     = false;

                if (hasLocation && food?.PickupLatitude != null && food.PickupLongitude != null)
                {
                    distanceToPickup = Math.Round(
                        _distanceService.CalculateDistanceKm(
                            transporter!.Latitude!.Value, transporter.Longitude!.Value,
                            food.PickupLatitude.Value, food.PickupLongitude.Value),
                        2);

                    hasDistanceInfo = true;

                    if (neededFood?.DeliveryLatitude != null && neededFood.DeliveryLongitude != null)
                    {
                        pickupToReceiver = Math.Round(
                            _distanceService.CalculateDistanceKm(
                                food.PickupLatitude.Value, food.PickupLongitude.Value,
                                neededFood.DeliveryLatitude.Value, neededFood.DeliveryLongitude.Value),
                            2);

                        estimatedTotal = Math.Round(distanceToPickup.Value + pickupToReceiver.Value, 2);
                    }
                }

                result.Add(new NearbyDeliveryDTO
                {
                    DeliveryId       = d.Id,
                    MatchedFoodId    = d.MatchedFoodId,
                    Status           = d.Status,
                    DonorId          = d.DonorId,
                    DonorName        = donorUser?.Username ?? d.DonorId,
                    PickupLocation   = food?.perfectLocation ?? food?.location ?? match?.fromperfectLocation ?? "Donor Location",
                    PickupCity       = food?.city ?? match?.city ?? donorUser?.city ?? "",
                    PickupState      = food?.state ?? match?.state ?? "",
                    ReceiverId       = d.ReceiverId,
                    ReceiverName     = receiverUser?.Username ?? d.ReceiverId,
                    DeliveryLocation = neededFood?.perfectLocation ?? neededFood?.location ?? match?.toperfectLocation ?? "Receiver Location",
                    DeliveryCity     = neededFood?.city ?? receiverUser?.city ?? match?.city ?? "",
                    DeliveryState    = neededFood?.state ?? match?.state ?? "",
                    FoodId           = food?.id ?? match?.FID ?? 0,
                    FoodName         = food?.FoodName ?? "Food Donation",
                    Items            = food?.items ?? Array.Empty<string>(),
                    Quantity         = match?.Providedquntity ?? food?.quntity ?? neededFood?.quntity ?? 0,
                    DonationDateTime = food?.donationDateTime ?? match?.donationDateTime,
                    DistanceToPickupKm      = distanceToPickup,
                    PickupToReceiverKm      = pickupToReceiver,
                    EstimatedTotalRouteKm   = estimatedTotal,
                    HasDistanceInfo         = hasDistanceInfo,
                    CreatedAt               = d.CreatedAt
                });
            }

            // Sort: nearest first (deliveries with distance info come first, then by creation date)
            return result
                .OrderBy(x => !x.HasDistanceInfo)            // deliveries with distance info first
                .ThenBy(x => x.DistanceToPickupKm ?? double.MaxValue) // nearest first
                .ThenByDescending(x => x.CreatedAt)          // newest first as tiebreaker
                .ToList();
        }

        // ──────────────────────────────────────────────────────────────────────
        // Private helpers
        // ──────────────────────────────────────────────────────────────────────

        /// <summary>Returns the set of Transporter email IDs who have an active delivery.</summary>
        private async Task<HashSet<string>> GetBusyTransporterIdsAsync()
        {
            var busyEmails = await _context.FoodDeliveries
                .Where(d => !string.IsNullOrEmpty(d.TransporterId)
                         && ActiveDeliveryStatuses.Contains(d.Status))
                .Select(d => d.TransporterId!)
                .Distinct()
                .ToListAsync();

            return new HashSet<string>(busyEmails, StringComparer.OrdinalIgnoreCase);
        }

        private static string FormatLastUpdate(DateTime? dt)
        {
            if (!dt.HasValue) return "Unknown";
            var diff = DateTime.UtcNow - dt.Value;
            if (diff.TotalMinutes < 1) return "Just now";
            if (diff.TotalMinutes < 60) return $"{(int)diff.TotalMinutes} min ago";
            if (diff.TotalHours < 24) return $"{(int)diff.TotalHours} hr ago";
            return $"{(int)diff.TotalDays} day(s) ago";
        }

        private static (bool, string, NearbyTransportersResponseDTO?) BuildEmptyResult(
            int deliveryId, Food food, NeededFood? neededFood, double radius, string error)
        {
            return (false, error, null);
        }
    }
}
