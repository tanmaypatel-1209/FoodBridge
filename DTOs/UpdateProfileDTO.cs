using System.ComponentModel.DataAnnotations;

namespace FoodBridge.DTOs
{
    public class UpdateProfileDTO
    {
        [Required(ErrorMessage = "Full Name is required.")]
        [StringLength(100, MinimumLength = 2, ErrorMessage = "Full Name must be between 2 and 100 characters.")]
        public string Name { get; set; } = string.Empty;

        [RegularExpression(@"^$|^\+?[0-9\s\-()]{7,18}$", ErrorMessage = "Please enter a valid phone number (7 to 18 digits/characters).")]
        [StringLength(20, ErrorMessage = "Phone number cannot exceed 20 characters.")]
        public string? Phone { get; set; }

        [StringLength(250, ErrorMessage = "Address cannot exceed 250 characters.")]
        public string? Address { get; set; }

        [Required(ErrorMessage = "City is required.")]
        [StringLength(60, MinimumLength = 2, ErrorMessage = "City must be between 2 and 60 characters.")]
        public string City { get; set; } = string.Empty;

        [StringLength(60, ErrorMessage = "State cannot exceed 60 characters.")]
        public string? State { get; set; }

        [RegularExpression(@"^$|^[0-9a-zA-Z\s\-]{3,10}$", ErrorMessage = "Please enter a valid postal pincode (3 to 10 characters).")]
        [StringLength(10, ErrorMessage = "Pincode cannot exceed 10 characters.")]
        public string? Pincode { get; set; }

        // Transporter-specific optional fields
        [Range(-90.0, 90.0, ErrorMessage = "Latitude must be between -90 and +90 degrees.")]
        public double? Latitude { get; set; }

        [Range(-180.0, 180.0, ErrorMessage = "Longitude must be between -180 and +180 degrees.")]
        public double? Longitude { get; set; }

        public string? AvailabilityStatus { get; set; }
    }
}
