using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FoodBridge.Models
{
    public class MatchedFood{
        [Key]
        public int id { get; set; }
        [EmailAddress]
        public string DonorId { get; set; }
        public int Providedquntity { get; set; }
        public DateTime? donationDateTime { get; set; }
        public string? city { get; set; }
        public string? state { get; set; }
        public string? fromperfectLocation { get; set; }
        [EmailAddress]
        public string ReceiverId { get; set; }
        public DateTime? requestDateTime { get; set; }
        public int Neededquntity { get; set; }
        public string? toperfectLocation { get; set; }

    }
}