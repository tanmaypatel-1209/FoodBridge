using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FoodBridge.Models
{
    public class NeededFood
    {
        [Key]
        public int id { get; set; }
        [ForeignKey("user")]
        [EmailAddress]
        public string emailID { get; set; }
        public User user { get; set; }
        public int quntity { get; set; }
        public DateTime? requestDateTime { get; set; }
        public string status { get; set; } = "pending";
        public string? location { get; set; }
        public string? city { get; set; }
        public string? state { get; set; }
        public string? perfectLocation { get; set; }

        public NeededFood()
        {
        }

        public NeededFood(string emailID, int quntity, DateTime? requestDateTime = null, string? location = null, string? city = null, string? state = null, string? perfectLocation = null)
        {
            this.emailID = emailID;
            this.quntity = quntity;
            this.requestDateTime = requestDateTime ?? DateTime.Now;
            this.status = "pending";
            this.location = location;
            this.city = city;
            this.state = state;
            this.perfectLocation = perfectLocation;
        }

        public NeededFood(string emailID, User? user, int quntity, DateTime? requestDateTime = null, string? location = null, string? city = null, string? state = null, string? perfectLocation = null)
        {
            this.emailID = emailID;
            this.user = user!;
            this.quntity = quntity;
            this.requestDateTime = requestDateTime ?? DateTime.Now;
            this.status = "pending";
            this.location = location;
            this.city = city;
            this.state = state;
            this.perfectLocation = perfectLocation;
        }

        public NeededFood(string emailID, User? user, int quntity, DateTime? requestDateTime = null, string status = "pending", string? location = null, string? city = null, string? state = null, string? perfectLocation = null)
        {
            this.emailID = emailID;
            this.user = user!;
            this.quntity = quntity;
            this.requestDateTime = requestDateTime ?? DateTime.Now;
            this.status = string.IsNullOrWhiteSpace(status) ? "pending" : status;
            this.location = location;
            this.city = city;
            this.state = state;
            this.perfectLocation = perfectLocation;
        }
    }
}
