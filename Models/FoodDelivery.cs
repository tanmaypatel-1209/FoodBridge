using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FoodBridge.Models
{
    public class FoodDelivery
    {
        [Key]
        public int Id { get; set; }

        public int MatchedFoodId { get; set; }

        [ForeignKey("MatchedFoodId")]
        public MatchedFood? MatchedFood { get; set; }

        [Required]
        [EmailAddress]
        public string DonorId { get; set; } = string.Empty;

        [ForeignKey("DonorId")]
        public User? Donor { get; set; }

        [Required]
        [EmailAddress]
        public string ReceiverId { get; set; } = string.Empty;

        [ForeignKey("ReceiverId")]
        public User? Receiver { get; set; }

        [EmailAddress]
        public string? TransporterId { get; set; }

        [ForeignKey("TransporterId")]
        public User? Transporter { get; set; }

        [Required]
        public string Status { get; set; } = "AwaitingTransporter";

        [NotMapped]
        public int Quantity
        {
            get
            {
                if (MatchedFood != null)
                {
                    return MatchedFood.Neededquntity > 0 && MatchedFood.Providedquntity > 0
                        ? Math.Min(MatchedFood.Providedquntity, MatchedFood.Neededquntity)
                        : (MatchedFood.Neededquntity > 0 ? MatchedFood.Neededquntity : MatchedFood.Providedquntity);
                }
                return 0;
            }
        }

        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
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

        public FoodDelivery()
        {
        }

        public FoodDelivery(int matchedFoodId, string donorId, string receiverId)
        {
            MatchedFoodId = matchedFoodId;
            DonorId = donorId;
            ReceiverId = receiverId;
            Status = "AwaitingTransporter";
            CreatedAt = DateTime.UtcNow;
        }
    }
}
