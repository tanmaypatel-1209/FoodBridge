using System;
using System.ComponentModel.DataAnnotations;

namespace FoodBridge.DTOs
{
    // ──────────────────────────────────────────────────────────────────────────
    // Transporter location update
    // ──────────────────────────────────────────────────────────────────────────

    /// <summary>
    /// Payload for PUT /Transporter/location
    /// The Transporter ID is taken from JWT — never from this body.
    /// </summary>
    public class UpdateTransporterLocationDTO
    {
        /// <summary>Valid range: -90 to +90</summary>
        [Required]
        [Range(-90.0, 90.0, ErrorMessage = "Latitude must be between -90 and +90.")]
        public double Latitude { get; set; }

        /// <summary>Valid range: -180 to +180</summary>
        [Required]
        [Range(-180.0, 180.0, ErrorMessage = "Longitude must be between -180 and +180.")]
        public double Longitude { get; set; }

        /// <summary>Optional availability status: Available | Busy | Offline</summary>
        public string? AvailabilityStatus { get; set; }
    }

    // ──────────────────────────────────────────────────────────────────────────
    // Nearby transporter matching response
    // ──────────────────────────────────────────────────────────────────────────

    /// <summary>
    /// Single transporter entry in the nearby-transporter response.
    /// Exposes only non-sensitive information (no exact GPS coordinates).
    /// </summary>
    public class NearbyTransporterDTO
    {
        public string TransporterId { get; set; } = string.Empty;
        public string TransporterName { get; set; } = string.Empty;

        /// <summary>
        /// Approximate straight-line distance from Transporter to Donor pickup.
        /// Calculated via Haversine — display as "~X km" not exact road distance.
        /// </summary>
        public double DistanceToPickupKm { get; set; }

        public string AvailabilityStatus { get; set; } = string.Empty;

        /// <summary>How long ago the Transporter's location was last updated.</summary>
        public string? LastLocationUpdate { get; set; }
    }

    /// <summary>
    /// Response returned by GET /TransporterMatching/nearby/{deliveryId}
    /// </summary>
    public class NearbyTransportersResponseDTO
    {
        public int DeliveryId { get; set; }
        public string PickupLocation { get; set; } = string.Empty;
        public string ReceiverLocation { get; set; } = string.Empty;
        public string SearchRadiusKm { get; set; } = string.Empty;
        public int TransportersFound { get; set; }
        public System.Collections.Generic.List<NearbyTransporterDTO> Transporters { get; set; } = new();
    }

    // ──────────────────────────────────────────────────────────────────────────
    // Nearby delivery (Transporter dashboard)
    // ──────────────────────────────────────────────────────────────────────────

    /// <summary>
    /// Delivery enriched with distance info, used in the Transporter dashboard
    /// to show available deliveries sorted nearest-first.
    /// </summary>
    public class NearbyDeliveryDTO
    {
        // Core delivery info
        public int DeliveryId { get; set; }
        public int MatchedFoodId { get; set; }
        public string Status { get; set; } = string.Empty;

        // Donor / pickup
        public string DonorId { get; set; } = string.Empty;
        public string DonorName { get; set; } = string.Empty;
        public string PickupLocation { get; set; } = string.Empty;
        public string PickupCity { get; set; } = string.Empty;
        public string PickupState { get; set; } = string.Empty;

        // Receiver / delivery
        public string ReceiverId { get; set; } = string.Empty;
        public string ReceiverName { get; set; } = string.Empty;
        public string DeliveryLocation { get; set; } = string.Empty;
        public string DeliveryCity { get; set; } = string.Empty;
        public string DeliveryState { get; set; } = string.Empty;

        // Food
        public int FoodId { get; set; }
        public string FoodName { get; set; } = string.Empty;
        public string[] Items { get; set; } = Array.Empty<string>();
        public int Quantity { get; set; }
        public DateTime? DonationDateTime { get; set; }

        // Distance info (Haversine approximations)
        /// <summary>Approx. straight-line distance: Transporter → Donor pickup</summary>
        public double? DistanceToPickupKm { get; set; }

        /// <summary>Approx. straight-line distance: Donor pickup → Receiver</summary>
        public double? PickupToReceiverKm { get; set; }

        /// <summary>Estimated total route: Transporter → Donor → Receiver (approximation)</summary>
        public double? EstimatedTotalRouteKm { get; set; }

        /// <summary>Indicates whether distance data is available for this delivery.</summary>
        public bool HasDistanceInfo { get; set; }

        // Timestamps
        public DateTime CreatedAt { get; set; }
    }

    // ──────────────────────────────────────────────────────────────────────────
    // Transporter availability status update
    // ──────────────────────────────────────────────────────────────────────────

    /// <summary>
    /// Payload for PUT /Transporter/availability
    /// </summary>
    public class UpdateAvailabilityDTO
    {
        /// <summary>One of: Available | Busy | Offline</summary>
        [Required]
        public string AvailabilityStatus { get; set; } = string.Empty;
    }
}
