using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FoodBridge.DATA;
using FoodBridge.DTOs;
using FoodBridge.Models;
using Microsoft.EntityFrameworkCore;

namespace FoodBridge.services
{
    public class DeliveryService
    {
        private readonly FoodBridgeDB _context;

        public DeliveryService(FoodBridgeDB context)
        {
            _context = context;
        }

        public async Task<List<DeliveryJobDTO>> GetAvailableDeliveriesAsync()
        {
            var deliveries = await _context.FoodDeliveries
                .Where(d => d.Status == "AwaitingTransporter" && string.IsNullOrEmpty(d.TransporterId))
                .OrderByDescending(d => d.CreatedAt)
                .ToListAsync();

            return await HydrateDeliveriesAsync(deliveries);
        }

        public async Task<List<DeliveryJobDTO>> GetTransporterDeliveriesAsync(string transporterEmail)
        {
            var deliveries = await _context.FoodDeliveries
                .Where(d => d.TransporterId == transporterEmail)
                .OrderByDescending(d => d.CreatedAt)
                .ToListAsync();

            return await HydrateDeliveriesAsync(deliveries);
        }

        public async Task<List<DeliveryJobDTO>> GetDonorDeliveriesAsync(string donorEmail)
        {
            var deliveries = await _context.FoodDeliveries
                .Where(d => d.DonorId == donorEmail)
                .OrderByDescending(d => d.CreatedAt)
                .ToListAsync();

            return await HydrateDeliveriesAsync(deliveries);
        }

        public async Task<List<DeliveryJobDTO>> GetReceiverDeliveriesAsync(string receiverEmail)
        {
            var deliveries = await _context.FoodDeliveries
                .Where(d => d.ReceiverId == receiverEmail)
                .OrderByDescending(d => d.CreatedAt)
                .ToListAsync();

            return await HydrateDeliveriesAsync(deliveries);
        }

        public async Task<DeliveryJobDTO?> GetDeliveryByIdAsync(int deliveryId)
        {
            var delivery = await _context.FoodDeliveries
                .FirstOrDefaultAsync(d => d.Id == deliveryId);

            if (delivery == null) return null;

            var list = await HydrateDeliveriesAsync(new List<FoodDelivery> { delivery });
            return list.FirstOrDefault();
        }

        public async Task<(bool Success, string Message, DeliveryJobDTO? Delivery)> AcceptDeliveryAsync(int deliveryId, string transporterEmail)
        {
            var delivery = await _context.FoodDeliveries
                .FirstOrDefaultAsync(d => d.Id == deliveryId);

            if (delivery == null)
            {
                return (false, "Delivery not found.", null);
            }

            // Concurrency guard: double-check current state
            if (delivery.Status != "AwaitingTransporter" || !string.IsNullOrEmpty(delivery.TransporterId))
            {
                return (false, "This delivery has already been assigned to another transporter.", null);
            }

            var transporter = await _context.Users.FindAsync(transporterEmail);
            if (transporter == null || !string.Equals(transporter.role, "Transporter", StringComparison.OrdinalIgnoreCase))
            {
                return (false, "Invalid transporter user.", null);
            }

            var oldStatus = delivery.Status;
            delivery.TransporterId = transporterEmail;
            delivery.Status = "Accepted";
            delivery.AssignedAt = DateTime.UtcNow;
            delivery.AcceptedAt = DateTime.UtcNow;

            _context.DeliveryStatusHistories.Add(new DeliveryStatusHistory(
                delivery.Id,
                oldStatus,
                delivery.Status,
                transporterEmail,
                "Transporter",
                $"Delivery accepted by transporter {transporter.Username} ({transporterEmail})."
            ));

            await _context.SaveChangesAsync();

            var dto = await GetDeliveryByIdAsync(delivery.Id);
            return (true, "Delivery accepted successfully.", dto);
        }

        public async Task<(bool Success, string Message, DeliveryJobDTO? Delivery)> MarkPickupArrivedAsync(int deliveryId, string transporterEmail)
        {
            var delivery = await _context.FoodDeliveries
                .FirstOrDefaultAsync(d => d.Id == deliveryId);

            if (delivery == null) return (false, "Delivery not found.", null);

            if (delivery.TransporterId != transporterEmail)
            {
                return (false, "Unauthorized: You are not the assigned transporter for this delivery.", null);
            }

            if (delivery.Status != "Accepted" && delivery.Status != "TransporterAssigned")
            {
                return (false, $"Cannot mark pickup arrival when delivery status is '{delivery.Status}'.", null);
            }

            var oldStatus = delivery.Status;
            delivery.Status = "PickupPending";
            delivery.PickupArrivedAt = DateTime.UtcNow;

            _context.DeliveryStatusHistories.Add(new DeliveryStatusHistory(
                delivery.Id,
                oldStatus,
                delivery.Status,
                transporterEmail,
                "Transporter",
                "Transporter has arrived at the Donor pickup location."
            ));

            await _context.SaveChangesAsync();

            var dto = await GetDeliveryByIdAsync(delivery.Id);
            return (true, "Arrived at pickup location. Donor handover pending.", dto);
        }

        public async Task<(bool Success, string Message, DeliveryJobDTO? Delivery)> ConfirmDonorHandoverAsync(int deliveryId, string donorEmail, string? notes)
        {
            var delivery = await _context.FoodDeliveries
                .FirstOrDefaultAsync(d => d.Id == deliveryId);

            if (delivery == null) return (false, "Delivery not found.", null);

            if (delivery.DonorId != donorEmail)
            {
                return (false, "Unauthorized: You are not the donor for this delivery.", null);
            }

            if (delivery.Status != "PickupPending")
            {
                return (false, $"Cannot confirm handover. Transporter must arrive at pickup first (Current status: {delivery.Status}).", null);
            }

            if (string.IsNullOrEmpty(delivery.TransporterId))
            {
                return (false, "No transporter assigned to this delivery.", null);
            }

            var oldStatus = delivery.Status;
            delivery.Status = "PickedUp";
            delivery.PickupConfirmedAt = DateTime.UtcNow;
            delivery.PickedUpAt = DateTime.UtcNow;
            if (!string.IsNullOrWhiteSpace(notes))
            {
                delivery.HandoverNotes = notes;
            }

            _context.DeliveryStatusHistories.Add(new DeliveryStatusHistory(
                delivery.Id,
                oldStatus,
                delivery.Status,
                donorEmail,
                "Donor",
                $"Donor verified and confirmed food handover to transporter {delivery.TransporterId}. {(string.IsNullOrWhiteSpace(notes) ? "" : "Notes: " + notes)}"
            ));

            await _context.SaveChangesAsync();

            var dto = await GetDeliveryByIdAsync(delivery.Id);
            return (true, "Food handover confirmed successfully.", dto);
        }

        public async Task<(bool Success, string Message, DeliveryJobDTO? Delivery)> StartTransitAsync(int deliveryId, string transporterEmail)
        {
            var delivery = await _context.FoodDeliveries
                .FirstOrDefaultAsync(d => d.Id == deliveryId);

            if (delivery == null) return (false, "Delivery not found.", null);

            if (delivery.TransporterId != transporterEmail)
            {
                return (false, "Unauthorized: You are not the assigned transporter for this delivery.", null);
            }

            if (delivery.Status != "PickedUp")
            {
                return (false, $"Cannot start transit. Food must be confirmed as handed over by Donor first (Current status: {delivery.Status}).", null);
            }

            var oldStatus = delivery.Status;
            delivery.Status = "InTransit";
            delivery.InTransitAt = DateTime.UtcNow;

            _context.DeliveryStatusHistories.Add(new DeliveryStatusHistory(
                delivery.Id,
                oldStatus,
                delivery.Status,
                transporterEmail,
                "Transporter",
                "Transporter has departed pickup location and is in transit to Receiver."
            ));

            await _context.SaveChangesAsync();

            var dto = await GetDeliveryByIdAsync(delivery.Id);
            return (true, "Delivery marked In Transit.", dto);
        }

        public async Task<(bool Success, string Message, DeliveryJobDTO? Delivery)> MarkReceiverArrivedAsync(int deliveryId, string transporterEmail)
        {
            var delivery = await _context.FoodDeliveries
                .FirstOrDefaultAsync(d => d.Id == deliveryId);

            if (delivery == null) return (false, "Delivery not found.", null);

            if (delivery.TransporterId != transporterEmail)
            {
                return (false, "Unauthorized: You are not the assigned transporter for this delivery.", null);
            }

            if (delivery.Status != "InTransit")
            {
                return (false, $"Cannot mark receiver arrival when status is '{delivery.Status}'.", null);
            }

            var oldStatus = delivery.Status;
            delivery.Status = "ReceiverArrived";
            delivery.ReceiverArrivedAt = DateTime.UtcNow;

            _context.DeliveryStatusHistories.Add(new DeliveryStatusHistory(
                delivery.Id,
                oldStatus,
                delivery.Status,
                transporterEmail,
                "Transporter",
                "Transporter has arrived at Receiver destination."
            ));

            await _context.SaveChangesAsync();

            var dto = await GetDeliveryByIdAsync(delivery.Id);
            return (true, "Arrived at Receiver location. Waiting for Receiver confirmation.", dto);
        }

        public async Task<(bool Success, string Message, DeliveryJobDTO? Delivery)> ConfirmReceiverReceiptAsync(int deliveryId, string receiverEmail, string? notes)
        {
            var delivery = await _context.FoodDeliveries
                .FirstOrDefaultAsync(d => d.Id == deliveryId);

            if (delivery == null) return (false, "Delivery not found.", null);

            if (delivery.ReceiverId != receiverEmail)
            {
                return (false, "Unauthorized: You are not the receiver for this delivery.", null);
            }

            if (delivery.Status != "ReceiverArrived")
            {
                return (false, $"Cannot confirm delivery receipt until Transporter arrives at receiver (Current status: {delivery.Status}).", null);
            }

            var oldStatus = delivery.Status;
            delivery.Status = "Delivered";
            delivery.DeliveredAt = DateTime.UtcNow;
            if (!string.IsNullOrWhiteSpace(notes))
            {
                delivery.DeliveryNotes = notes;
            }

            // Also update associated Food and NeededFood status to 'done'
            var match = await _context.MatchedFoods.FirstOrDefaultAsync(m => m.id == delivery.MatchedFoodId);
            if (match != null)
            {
                var food = await _context.Foods.FirstOrDefaultAsync(f => f.id == match.FID);
                if (food != null)
                {
                    food.status = "done";
                }

                var neededFood = await _context.NeededFoods.FirstOrDefaultAsync(n => n.id == match.NFID);
                if (neededFood != null)
                {
                    neededFood.status = "done";
                }
            }

            _context.DeliveryStatusHistories.Add(new DeliveryStatusHistory(
                delivery.Id,
                oldStatus,
                delivery.Status,
                receiverEmail,
                "Receiver",
                $"Receiver confirmed safe arrival and receipt of food donation. {(string.IsNullOrWhiteSpace(notes) ? "" : "Notes: " + notes)}"
            ));

            await _context.SaveChangesAsync();

            var dto = await GetDeliveryByIdAsync(delivery.Id);
            return (true, "Food receipt confirmed. Delivery completed successfully!", dto);
        }

        private async Task<List<DeliveryJobDTO>> HydrateDeliveriesAsync(List<FoodDelivery> deliveries)
        {
            if (deliveries == null || deliveries.Count == 0)
            {
                return new List<DeliveryJobDTO>();
            }

            var deliveryIds = deliveries.Select(d => d.Id).ToList();
            var matchIds = deliveries.Select(d => d.MatchedFoodId).ToList();
            var donorEmails = deliveries.Select(d => d.DonorId).Distinct().ToList();
            var receiverEmails = deliveries.Select(d => d.ReceiverId).Distinct().ToList();
            var transporterEmails = deliveries.Where(d => !string.IsNullOrEmpty(d.TransporterId)).Select(d => d.TransporterId!).Distinct().ToList();
            var allUserEmails = donorEmails.Concat(receiverEmails).Concat(transporterEmails).Distinct().ToList();

            var matches = await _context.MatchedFoods.Where(m => matchIds.Contains(m.id)).ToListAsync();
            var foodIds = matches.Select(m => m.FID).Distinct().ToList();
            var neededFoodIds = matches.Select(m => m.NFID).Distinct().ToList();

            var foods = await _context.Foods.Where(f => foodIds.Contains(f.id)).ToListAsync();
            var neededFoods = await _context.NeededFoods.Where(n => neededFoodIds.Contains(n.id)).ToListAsync();
            var users = await _context.Users.Where(u => allUserEmails.Contains(u.EmailID)).ToListAsync();
            var histories = await _context.DeliveryStatusHistories
                .Where(h => deliveryIds.Contains(h.DeliveryId))
                .OrderBy(h => h.ChangedAt)
                .ToListAsync();

            var matchMap = matches.ToDictionary(m => m.id);
            var foodMap = foods.ToDictionary(f => f.id);
            var neededFoodMap = neededFoods.ToDictionary(n => n.id);
            var userMap = users.ToDictionary(u => u.EmailID);
            var historyGroup = histories.GroupBy(h => h.DeliveryId).ToDictionary(g => g.Key, g => g.ToList());

            var dtos = new List<DeliveryJobDTO>();

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
                User? transporterUser = null;
                if (!string.IsNullOrEmpty(d.TransporterId))
                {
                    userMap.TryGetValue(d.TransporterId, out transporterUser);
                }

                historyGroup.TryGetValue(d.Id, out var deliveryHistories);

                var dto = new DeliveryJobDTO
                {
                    DeliveryId = d.Id,
                    MatchedFoodId = d.MatchedFoodId,
                    Status = d.Status,

                    DonorId = d.DonorId,
                    DonorName = donorUser?.Username ?? d.DonorId,
                    PickupLocation = food?.perfectLocation ?? food?.location ?? match?.fromperfectLocation ?? "Donor Location",
                    PickupCity = food?.city ?? match?.city ?? donorUser?.city ?? "",
                    PickupState = food?.state ?? match?.state ?? "",

                    ReceiverId = d.ReceiverId,
                    ReceiverName = receiverUser?.Username ?? d.ReceiverId,
                    DeliveryLocation = neededFood?.perfectLocation ?? neededFood?.location ?? match?.toperfectLocation ?? "Receiver Location",
                    DeliveryCity = neededFood?.city ?? receiverUser?.city ?? match?.city ?? "",
                    DeliveryState = neededFood?.state ?? match?.state ?? "",

                    FoodId = food?.id ?? match?.FID ?? 0,
                    FoodName = food?.FoodName ?? "Food Donation",
                    Items = food?.items ?? Array.Empty<string>(),
                    Quantity = match?.Providedquntity ?? food?.quntity ?? neededFood?.quntity ?? 0,
                    DonationDateTime = food?.donationDateTime ?? match?.donationDateTime,
                    RequestDateTime = neededFood?.requestDateTime ?? match?.requestDateTime,

                    TransporterId = d.TransporterId,
                    TransporterName = transporterUser?.Username ?? d.TransporterId,

                    CreatedAt = d.CreatedAt,
                    AssignedAt = d.AssignedAt,
                    AcceptedAt = d.AcceptedAt,
                    PickupArrivedAt = d.PickupArrivedAt,
                    PickupConfirmedAt = d.PickupConfirmedAt,
                    PickedUpAt = d.PickedUpAt,
                    InTransitAt = d.InTransitAt,
                    ReceiverArrivedAt = d.ReceiverArrivedAt,
                    DeliveredAt = d.DeliveredAt,
                    CancelledAt = d.CancelledAt,
                    CancellationReason = d.CancellationReason,
                    HandoverNotes = d.HandoverNotes,
                    DeliveryNotes = d.DeliveryNotes,

                    History = deliveryHistories?.Select(h => new DeliveryStatusHistoryDTO
                    {
                        Id = h.Id,
                        DeliveryId = h.DeliveryId,
                        FromStatus = h.FromStatus,
                        ToStatus = h.ToStatus,
                        ChangedByUserId = h.ChangedByUserId,
                        ChangedByUserRole = h.ChangedByUserRole,
                        ChangedAt = h.ChangedAt,
                        Notes = h.Notes
                    }).ToList() ?? new List<DeliveryStatusHistoryDTO>()
                };

                dtos.Add(dto);
            }

            return dtos;
        }
    }
}
