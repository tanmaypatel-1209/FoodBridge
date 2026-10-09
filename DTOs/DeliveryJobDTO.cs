using System;
using System.Collections.Generic;

namespace FoodBridge.DTOs
{
    public class DeliveryStatusHistoryDTO
    {
        public int Id { get; set; }
        public int DeliveryId { get; set; }
        public string FromStatus { get; set; } = string.Empty;
        public string ToStatus { get; set; } = string.Empty;
        public string ChangedByUserId { get; set; } = string.Empty;
        public string ChangedByUserRole { get; set; } = string.Empty;
        public DateTime ChangedAt { get; set; }
        public string? Notes { get; set; }
    }

    public class DeliveryJobDTO
    {
        public int DeliveryId { get; set; }
        public int Id { get => DeliveryId; set => DeliveryId = value; }
        public int MatchedFoodId { get; set; }
        public string Status { get; set; } = string.Empty;

        // Donor details
        public string DonorId { get; set; } = string.Empty;
        public string DonorName { get; set; } = string.Empty;
        public string PickupLocation { get; set; } = string.Empty;
        public string PickupCity { get; set; } = string.Empty;
        public string PickupState { get; set; } = string.Empty;
        public double? PickupLatitude { get; set; }
        public double? PickupLongitude { get; set; }

        // Receiver details
        public string ReceiverId { get; set; } = string.Empty;
        public string ReceiverName { get; set; } = string.Empty;
        public string DeliveryLocation { get; set; } = string.Empty;
        public string DeliveryCity { get; set; } = string.Empty;
        public string DeliveryState { get; set; } = string.Empty;
        public double? DeliveryLatitude { get; set; }
        public double? DeliveryLongitude { get; set; }

        // Food details
        public int FoodId { get; set; }
        public string FoodName { get; set; } = string.Empty;
        public string[] Items { get; set; } = Array.Empty<string>();
        public int Quantity { get; set; }
        public DateTime? DonationDateTime { get; set; }
        public DateTime? RequestDateTime { get; set; }

        // Transporter details
        public string? TransporterId { get; set; }
        public string? TransporterName { get; set; }

        // Timestamps
        public DateTime CreatedAt { get; set; }
        public DateTime? AssignedAt { get; set; }
        public DateTime? AcceptedAt { get; set; }
        public DateTime? PickupArrivedAt { get; set; }
        public DateTime? PickupConfirmedAt { get; set; }
        public DateTime? PickedUpAt { get; set; }
        public DateTime? InTransitAt { get; set; }
        public DateTime? ReceiverArrivedAt { get; set; }
        public DateTime? DeliveredAt { get; set; }
        public DateTime? CancelledAt { get; set; }
        public string? CancellationReason { get; set; }
        public string? HandoverNotes { get; set; }
        public string? DeliveryNotes { get; set; }

        // Audit Trail
        public List<DeliveryStatusHistoryDTO> History { get; set; } = new List<DeliveryStatusHistoryDTO>();
    }

    public class ConfirmHandoverDTO
    {
        public string? Notes { get; set; }
    }

    public class ConfirmReceivedDTO
    {
        public string? Notes { get; set; }
    }
}
