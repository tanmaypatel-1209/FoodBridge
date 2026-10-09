using System;
using System.ComponentModel.DataAnnotations;

namespace FoodBridge.Models
{

    public class User
    {
        [Required] public string Username { get; set; }
        [Key] [EmailAddress] [Required] public string EmailID { get; set; }
        [Required] public string password { get; set; }
        [Required] public string role { get; set; }
        [Required] public string city { get; set; }

        // Transporter location fields
        public double? Latitude { get; set; }
        public double? Longitude { get; set; }

        /// <summary>
        /// Transporter availability status: Available | Busy | Offline
        /// </summary>
        public string AvailabilityStatus { get; set; } = "Offline";

        public DateTime? LastLocationUpdatedAt { get; set; }

        // Contact & Profile fields
        public string? PhoneNumber { get; set; }
        public string? Address { get; set; }
        public string? State { get; set; }
        public string? Pincode { get; set; }

        public User()
        {
        }

        public User(string username, string emailID, string password, string role, string city = "")
        {
            this.Username = username;
            this.EmailID = emailID;
            this.password = password;
            this.role = role;
            this.city = city;
        }
    }
}