using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FoodBridge.Models
{
    public class DeliveryStatusHistory
    {
        [Key]
        public int Id { get; set; }

        public int DeliveryId { get; set; }

        [ForeignKey("DeliveryId")]
        public FoodDelivery? Delivery { get; set; }

        [Required]
        public string FromStatus { get; set; } = string.Empty;

        [Required]
        public string ToStatus { get; set; } = string.Empty;

        [Required]
        public string ChangedByUserId { get; set; } = string.Empty;

        [Required]
        public string ChangedByUserRole { get; set; } = string.Empty;

        public DateTime ChangedAt { get; set; } = DateTime.UtcNow;

        public string? Notes { get; set; }

        public DeliveryStatusHistory()
        {
        }

        public DeliveryStatusHistory(int deliveryId, string fromStatus, string toStatus, string changedByUserId, string changedByUserRole, string? notes = null)
        {
            DeliveryId = deliveryId;
            FromStatus = fromStatus;
            ToStatus = toStatus;
            ChangedByUserId = changedByUserId;
            ChangedByUserRole = changedByUserRole;
            ChangedAt = DateTime.UtcNow;
            Notes = notes;
        }
    }
}
