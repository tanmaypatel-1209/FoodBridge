using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FoodBridge.Models
{
    public class Food
    {
        [Key]
        public int id { get; set; }

        [ForeignKey("user")]
        [EmailAddress]
        public string emailID { get; set; }

        public User user { get; set; }

        public int quntity { get; set; }

        public string FoodName { get; set; }

        public string[] items { get; set; }

        public DateTime? donationDateTime { get; set; }

        public string status { get; set; } = "pending";

        public string? location { get; set; }

        public string? city { get; set; }

        public string? state { get; set; }

        public string? perfectLocation { get; set; }

        public Food()
        {
        }

        public Food(string emailID, int quntity, string foodName, string[] items, DateTime? donationDateTime = null, string status = "pending", string? location = null, string? city = null, string? state = null, string? perfectLocation = null)
        {
            this.emailID = emailID;
            this.quntity = quntity;
            this.FoodName = foodName;
            this.items = items;
            this.donationDateTime = donationDateTime;
            this.status = string.IsNullOrWhiteSpace(status) ? "pending" : status;
            this.location = location;
            this.city = city;
            this.state = state;
            this.perfectLocation = perfectLocation;
        }

        public Food(string emailID, User? user, int quntity, string foodName, string[] items, DateTime? donationDateTime = null, string status = "pending", string? location = null, string? city = null, string? state = null, string? perfectLocation = null)
        {
            this.emailID = emailID;
            this.user = user!;
            this.quntity = quntity;
            this.FoodName = foodName;
            this.items = items;
            this.donationDateTime = donationDateTime;
            this.status = string.IsNullOrWhiteSpace(status) ? "pending" : status;
            this.location = location;
            this.city = city;
            this.state = state;
            this.perfectLocation = perfectLocation;
        }
    }
}

