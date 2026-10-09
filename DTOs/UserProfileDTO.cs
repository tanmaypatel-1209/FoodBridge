using System;

namespace FoodBridge.DTOs
{
    public class UserProfileDTO
    {
        public string Name { get; set; } = string.Empty;
        public string Email { get; set; } = string.Empty;
        public string Role { get; set; } = string.Empty;
        public string? Phone { get; set; }
        public string? Address { get; set; }
        public string City { get; set; } = string.Empty;
        public string? State { get; set; }
        public string? Pincode { get; set; }

        // Transporter-specific fields
        public double? Latitude { get; set; }
        public double? Longitude { get; set; }
        public string? AvailabilityStatus { get; set; }
        public DateTime? LastLocationUpdatedAt { get; set; }
        public bool HasActiveDelivery { get; set; }
        public string? ActiveDeliveryStatus { get; set; }

        // Role-specific stats / counts
        public int TotalDonationsCount { get; set; }
        public int TotalRequestsCount { get; set; }
        public int CompletedDeliveriesCount { get; set; }

        // Reissued JWT token if updated
        public string? Token { get; set; }

        public UserProfileDTO()
        {
        }
    }
}
