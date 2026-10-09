using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using FoodBridge.DATA;
using FoodBridge.DTOs;
using FoodBridge.services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System;

namespace FoodBridge.Controllers
{
    [Route("Transporter")]
    [Authorize(Roles = "Transporter")]
    [ApiController]
    public class TransporterController : ControllerBase
    {
        private readonly DeliveryService _deliveryService;
        private readonly TransporterMatchingService _matchingService;
        private readonly FoodBridgeDB _context;

        private static readonly System.Collections.Generic.HashSet<string> ValidStatuses =
            new(System.StringComparer.OrdinalIgnoreCase)
            {
                "Available", "Busy", "Offline"
            };

        public TransporterController(
            DeliveryService deliveryService,
            TransporterMatchingService matchingService,
            FoodBridgeDB context)
        {
            _deliveryService = deliveryService;
            _matchingService = matchingService;
            _context = context;
        }

        private string? GetCurrentEmail()
        {
            return User.FindFirstValue(ClaimTypes.Email)
                ?? User.FindFirstValue("http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress")
                ?? User.FindFirstValue(ClaimTypes.NameIdentifier);
        }

        // ──────────────────────────────────────────────────────────────────────
        // Location & Availability Management
        // ──────────────────────────────────────────────────────────────────────

        /// <summary>
        /// PUT /Transporter/location
        ///
        /// Updates the authenticated Transporter's current GPS coordinates.
        /// Transporter ID is taken from JWT — never from the request body.
        ///
        /// Validates:
        ///   Latitude: -90 to +90
        ///   Longitude: -180 to +180
        /// </summary>
        [HttpPut("location")]
        public async Task<ActionResult<object>> UpdateLocation(
            [FromBody] UpdateTransporterLocationDTO dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email))
                return Unauthorized("Invalid user identity.");

            // Reject invalid / sentinel coordinates
            if (dto.Latitude == 0.0 && dto.Longitude == 0.0)
                return BadRequest(new { message = "Coordinates (0, 0) are not accepted as a valid location. Please provide your actual position." });

            var transporter = await _context.Users.FindAsync(email);
            if (transporter == null)
                return NotFound(new { message = "Transporter user not found." });

            transporter.Latitude = dto.Latitude;
            transporter.Longitude = dto.Longitude;
            transporter.LastLocationUpdatedAt = DateTime.UtcNow;

            // Allow updating availability status in the same call if provided
            if (!string.IsNullOrWhiteSpace(dto.AvailabilityStatus))
            {
                if (!ValidStatuses.Contains(dto.AvailabilityStatus))
                    return BadRequest(new { message = "Invalid AvailabilityStatus. Must be one of: Available, Busy, Offline." });

                transporter.AvailabilityStatus = dto.AvailabilityStatus;
            }

            await _context.SaveChangesAsync();

            return Ok(new
            {
                message = "Location updated successfully.",
                latitude = transporter.Latitude,
                longitude = transporter.Longitude,
                availabilityStatus = transporter.AvailabilityStatus,
                lastLocationUpdatedAt = transporter.LastLocationUpdatedAt
            });
        }

        /// <summary>
        /// PUT /Transporter/availability
        ///
        /// Updates the authenticated Transporter's availability status.
        /// Allowed values: Available | Busy | Offline
        /// </summary>
        [HttpPut("availability")]
        public async Task<ActionResult<object>> UpdateAvailability(
            [FromBody] UpdateAvailabilityDTO dto)
        {
            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            if (!ValidStatuses.Contains(dto.AvailabilityStatus))
                return BadRequest(new { message = "Invalid AvailabilityStatus. Must be one of: Available, Busy, Offline." });

            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email))
                return Unauthorized("Invalid user identity.");

            var transporter = await _context.Users.FindAsync(email);
            if (transporter == null)
                return NotFound(new { message = "Transporter user not found." });

            transporter.AvailabilityStatus = dto.AvailabilityStatus;
            await _context.SaveChangesAsync();

            return Ok(new
            {
                message = $"Availability status updated to '{dto.AvailabilityStatus}'.",
                availabilityStatus = transporter.AvailabilityStatus
            });
        }

        /// <summary>
        /// GET /Transporter/profile
        ///
        /// Returns the authenticated Transporter's profile including current
        /// availability status and when their location was last updated.
        /// Exact coordinates are returned here (the Transporter reading their own data).
        /// </summary>
        [HttpGet("profile")]
        public async Task<ActionResult<object>> GetProfile()
        {
            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email))
                return Unauthorized("Invalid user identity.");

            var transporter = await _context.Users.FindAsync(email);
            if (transporter == null)
                return NotFound(new { message = "Transporter user not found." });

            return Ok(new
            {
                email = transporter.EmailID,
                name = transporter.Username,
                city = transporter.city,
                availabilityStatus = transporter.AvailabilityStatus,
                hasLocation = transporter.Latitude.HasValue && transporter.Longitude.HasValue,
                latitude = transporter.Latitude,
                longitude = transporter.Longitude,
                lastLocationUpdatedAt = transporter.LastLocationUpdatedAt
            });
        }

        // ──────────────────────────────────────────────────────────────────────
        // Delivery Listings
        // ──────────────────────────────────────────────────────────────────────

        /// <summary>
        /// GET /Transporter/available
        ///
        /// Returns all available deliveries (AwaitingTransporter), ordered by
        /// creation date. Use /nearby instead for distance-sorted results.
        /// </summary>
        [HttpGet("available")]
        public async Task<ActionResult<List<DeliveryJobDTO>>> GetAvailableDeliveries([FromQuery] string? city = null)
        {
            var email = GetCurrentEmail();
            var deliveries = await _deliveryService.GetAvailableDeliveriesAsync(city, email);
            return Ok(deliveries);
        }

        /// <summary>
        /// GET /Transporter/nearby
        ///
        /// Returns available deliveries sorted nearest-first based on the
        /// authenticated Transporter's current location.
        ///
        /// If the Transporter has no valid location stored, deliveries are
        /// returned sorted by creation date (newest first) without distances.
        ///
        /// This is the recommended endpoint for the Transporter dashboard.
        /// </summary>
        [HttpGet("nearby")]
        public async Task<ActionResult<List<NearbyDeliveryDTO>>> GetNearbyDeliveries()
        {
            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email))
                return Unauthorized("Invalid user identity.");

            var deliveries = await _matchingService.GetNearbyDeliveriesForTransporterAsync(email);
            return Ok(deliveries);
        }

        /// <summary>
        /// GET /Transporter/my-deliveries
        /// Returns deliveries assigned to the authenticated Transporter.
        /// </summary>
        [HttpGet("my-deliveries")]
        public async Task<ActionResult<List<DeliveryJobDTO>>> GetMyDeliveries()
        {
            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email)) return Unauthorized("Invalid user identity.");

            var deliveries = await _deliveryService.GetTransporterDeliveriesAsync(email);
            return Ok(deliveries);
        }

        /// <summary>
        /// GET /Transporter/deliveries/{id}
        /// Returns a specific delivery by ID.
        /// </summary>
        [HttpGet("deliveries/{id}")]
        public async Task<ActionResult<DeliveryJobDTO>> GetDeliveryById(int id)
        {
            var delivery = await _deliveryService.GetDeliveryByIdAsync(id);
            if (delivery == null) return NotFound("Delivery not found.");

            return Ok(delivery);
        }

        // ──────────────────────────────────────────────────────────────────────
        // Delivery Workflow Actions
        // ──────────────────────────────────────────────────────────────────────

        /// <summary>
        /// POST /Transporter/deliveries/{id}/accept
        ///
        /// Accepts an available delivery. Enforces concurrency guard —
        /// if another Transporter accepted first, returns 409 Conflict.
        /// </summary>
        [HttpPost("deliveries/{id}/accept")]
        public async Task<ActionResult<object>> AcceptDelivery(int id)
        {
            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email)) return Unauthorized("Invalid user identity.");

            var result = await _deliveryService.AcceptDeliveryAsync(id, email);
            if (!result.Success)
            {
                if (result.Message.Contains("already been assigned") || result.Message.Contains("already been accepted"))
                    return Conflict(new { message = result.Message });

                return BadRequest(new { message = result.Message });
            }

            return Ok(new { message = result.Message, delivery = result.Delivery });
        }

        /// <summary>
        /// POST /Transporter/deliveries/{id}/arrived-pickup
        /// Marks that the Transporter has arrived at the Donor pickup location.
        /// </summary>
        [HttpPost("deliveries/{id}/arrived-pickup")]
        public async Task<ActionResult<object>> MarkArrivedPickup(int id)
        {
            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email)) return Unauthorized("Invalid user identity.");

            var result = await _deliveryService.MarkPickupArrivedAsync(id, email);
            if (!result.Success)
                return BadRequest(new { message = result.Message });

            return Ok(new { message = result.Message, delivery = result.Delivery });
        }

        /// <summary>
        /// POST /Transporter/deliveries/{id}/start
        /// Marks the delivery as InTransit after Donor has confirmed food handover.
        /// </summary>
        [HttpPost("deliveries/{id}/start")]
        public async Task<ActionResult<object>> StartTransit(int id)
        {
            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email)) return Unauthorized("Invalid user identity.");

            var result = await _deliveryService.StartTransitAsync(id, email);
            if (!result.Success)
                return BadRequest(new { message = result.Message });

            return Ok(new { message = result.Message, delivery = result.Delivery });
        }

        /// <summary>
        /// POST /Transporter/deliveries/{id}/arrived-receiver
        /// Marks that the Transporter has arrived at the Receiver's location.
        /// </summary>
        [HttpPost("deliveries/{id}/arrived-receiver")]
        public async Task<ActionResult<object>> MarkArrivedReceiver(int id)
        {
            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email)) return Unauthorized("Invalid user identity.");

            var result = await _deliveryService.MarkReceiverArrivedAsync(id, email);
            if (!result.Success)
                return BadRequest(new { message = result.Message });

            return Ok(new { message = result.Message, delivery = result.Delivery });
        }
    }
}
