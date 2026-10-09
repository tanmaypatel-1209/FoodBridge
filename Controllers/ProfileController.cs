


using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using FoodBridge.DATA;
using FoodBridge.DTOs;
using FoodBridge.Models;
using FoodBridge.services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace FoodBridge.Controllers
{
    [Route("profile")]
    [Route("api/profile")]
    [Authorize]
    [ApiController]
    public class ProfileController : ControllerBase
    {
        private readonly FoodBridgeDB _context;
        private readonly JWTCreate _jwt;

        private static readonly HashSet<string> ValidTransporterStatuses =
            new(StringComparer.OrdinalIgnoreCase) { "Available", "Busy", "Offline" };

        public ProfileController(FoodBridgeDB context, JWTCreate jwt)
        {
            _context = context;
            _jwt = jwt;
        }

        private string? GetCurrentEmail()
        {
            return User.FindFirstValue(ClaimTypes.Email)
                ?? User.FindFirstValue("http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress")
                ?? User.FindFirstValue(ClaimTypes.NameIdentifier);
        }

        /// <summary>
        /// GET /profile/me or GET /api/profile/me
        /// Returns the authenticated user's profile details.
        /// Never returns sensitive password data or internal IDs.
        /// </summary>
        [HttpGet("me")]
        public async Task<ActionResult<UserProfileDTO>> GetCurrentProfile()
        {
            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email))
                return Unauthorized(new { message = "Invalid identity claims. Please sign in again." });

            var user = await _context.Users.FindAsync(email);
            if (user == null)
                return NotFound(new { message = "User profile not found." });

            var profileDto = new UserProfileDTO
            {
                Name = user.Username,
                Email = user.EmailID,
                Role = user.role,
                Phone = user.PhoneNumber,
                Address = user.Address,
                City = user.city,
                State = user.State,
                Pincode = user.Pincode,
                Latitude = user.Latitude,
                Longitude = user.Longitude,
                AvailabilityStatus = user.AvailabilityStatus,
                LastLocationUpdatedAt = user.LastLocationUpdatedAt
            };

            var userRole = (user.role ?? "").Trim().ToLowerInvariant();

            // Populate role-specific context data
            if (userRole == "donor")
            {
                profileDto.TotalDonationsCount = await _context.Foods
                    .CountAsync(f => f.emailID == email);
            }
            else if (userRole == "receiver" || userRole == "ngo")
            {
                profileDto.TotalRequestsCount = await _context.NeededFoods
                    .CountAsync(n => n.emailID == email);
            }
            else if (userRole == "transporter")
            {
                profileDto.CompletedDeliveriesCount = await _context.FoodDeliveries
                    .CountAsync(d => d.TransporterId == email && d.Status == "Delivered");

                var activeTrip = await _context.FoodDeliveries.FirstOrDefaultAsync(d =>
                    d.TransporterId == email &&
                    (d.Status == "Accepted" || d.Status == "PickupPending" || d.Status == "PickedUp" ||
                     d.Status == "InTransit" || d.Status == "ReceiverArrived"));

                profileDto.HasActiveDelivery = activeTrip != null;
                profileDto.ActiveDeliveryStatus = activeTrip?.Status;
            }

            return Ok(profileDto);
        }

        /// <summary>
        /// PUT /profile/me or PUT /api/profile/me
        /// Updates the authenticated user's profile information.
        /// Strictly validates editable fields.
        /// Guaranteed security: Email and Role are immutable and never modified from profile.
        /// </summary>
        [HttpPut("me")]
        public async Task<ActionResult<UserProfileDTO>> UpdateCurrentProfile([FromBody] UpdateProfileDTO dto)
        {
            if (dto == null)
                return BadRequest(new { message = "Invalid profile payload." });

            if (!ModelState.IsValid)
                return BadRequest(ModelState);

            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email))
                return Unauthorized(new { message = "Invalid identity claims. Please sign in again." });

            var user = await _context.Users.FindAsync(email);
            if (user == null)
                return NotFound(new { message = "User profile not found." });

            // 1. Strict Name validation
            var trimmedName = dto.Name?.Trim() ?? string.Empty;
            if (string.IsNullOrWhiteSpace(trimmedName) || trimmedName.Length < 2)
                return BadRequest(new { message = "Full Name is required and must be at least 2 characters." });
            if (trimmedName.Length > 100)
                return BadRequest(new { message = "Full Name cannot exceed 100 characters." });

            // 2. Strict City validation
            var trimmedCity = dto.City?.Trim() ?? string.Empty;
            if (string.IsNullOrWhiteSpace(trimmedCity) || trimmedCity.Length < 2)
                return BadRequest(new { message = "City is required and must be at least 2 characters." });
            if (trimmedCity.Length > 60)
                return BadRequest(new { message = "City cannot exceed 60 characters." });

            // 3. Optional Phone validation
            string? sanitizedPhone = null;
            if (!string.IsNullOrWhiteSpace(dto.Phone))
            {
                sanitizedPhone = dto.Phone.Trim();
                if (sanitizedPhone.Length < 7 || sanitizedPhone.Length > 18)
                    return BadRequest(new { message = "Phone number must be between 7 and 18 digits/characters." });
            }

            // 4. Optional Address & State & Pincode limits
            string? sanitizedAddress = string.IsNullOrWhiteSpace(dto.Address) ? null : dto.Address.Trim();
            if (sanitizedAddress != null && sanitizedAddress.Length > 250)
                return BadRequest(new { message = "Address cannot exceed 250 characters." });

            string? sanitizedState = string.IsNullOrWhiteSpace(dto.State) ? null : dto.State.Trim();
            if (sanitizedState != null && sanitizedState.Length > 60)
                return BadRequest(new { message = "State cannot exceed 60 characters." });

            string? sanitizedPincode = string.IsNullOrWhiteSpace(dto.Pincode) ? null : dto.Pincode.Trim();
            if (sanitizedPincode != null && (sanitizedPincode.Length < 3 || sanitizedPincode.Length > 10))
                return BadRequest(new { message = "Pincode must be between 3 and 10 characters." });

            // 5. Transporter-specific availability & location safeguards
            var userRole = (user.role ?? "").Trim().ToLowerInvariant();
            if (userRole == "transporter")
            {
                // Availability update
                if (!string.IsNullOrWhiteSpace(dto.AvailabilityStatus))
                {
                    var status = dto.AvailabilityStatus.Trim();
                    if (!ValidTransporterStatuses.Contains(status))
                    {
                        return BadRequest(new { message = "Invalid AvailabilityStatus. Allowed values: Available, Busy, Offline." });
                    }

                    // Check if Transporter has an active delivery before switching to "Available"
                    if (status.Equals("Available", StringComparison.OrdinalIgnoreCase))
                    {
                        var hasActiveTrip = await _context.FoodDeliveries.AnyAsync(d =>
                            d.TransporterId == email &&
                            (d.Status == "Accepted" || d.Status == "PickupPending" || d.Status == "PickedUp" ||
                             d.Status == "InTransit" || d.Status == "ReceiverArrived"));

                        if (hasActiveTrip)
                        {
                            return BadRequest(new
                            {
                                message = "Cannot set status to 'Available' while an active delivery trip is in progress. Please complete the trip first."
                            });
                        }
                    }

                    user.AvailabilityStatus = status;
                }

                // Coordinates update
                if (dto.Latitude.HasValue && dto.Longitude.HasValue)
                {
                    // Avoid sentinel (0,0)
                    if (dto.Latitude.Value == 0.0 && dto.Longitude.Value == 0.0)
                    {
                        return BadRequest(new { message = "Coordinates (0, 0) are not accepted as valid GPS location." });
                    }

                    user.Latitude = dto.Latitude.Value;
                    user.Longitude = dto.Longitude.Value;
                    user.LastLocationUpdatedAt = DateTime.UtcNow;
                }
            }

            // 6. Apply validated updates to User model
            user.Username = trimmedName;
            user.city = trimmedCity;
            user.PhoneNumber = sanitizedPhone;
            user.Address = sanitizedAddress;
            user.State = sanitizedState;
            user.Pincode = sanitizedPincode;

            // Note: user.EmailID, user.password, user.role are strictly untouched!
            await _context.SaveChangesAsync();

            // 7. Re-issue fresh JWT token with updated username/city
            string refreshedToken = _jwt.createToken(new UserDTO(
                user.Username,
                user.EmailID,
                user.password,
                user.role ?? string.Empty,
                user.city ?? string.Empty
            ));

            var result = new UserProfileDTO
            {
                Name = user.Username,
                Email = user.EmailID,
                Role = user.role ?? string.Empty,
                Phone = user.PhoneNumber,
                Address = user.Address,
                City = user.city,
                State = user.State,
                Pincode = user.Pincode,
                Latitude = user.Latitude,
                Longitude = user.Longitude,
                AvailabilityStatus = user.AvailabilityStatus,
                LastLocationUpdatedAt = user.LastLocationUpdatedAt,
                Token = refreshedToken
            };

            return Ok(result);
        }
    }
}
