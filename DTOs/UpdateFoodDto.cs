namespace FoodBridge.DTOs;

/// <summary>
/// DTO for Donor to update their own food donation.
/// Protected fields (emailID, status, etc.) are intentionally excluded.
/// </summary>
public class UpdateFoodDto
{
    public string? FoodName { get; set; }
    public int? quntity { get; set; }
    public string[]? items { get; set; }
    public DateTime? donationDateTime { get; set; }
    public string? city { get; set; }
    public string? state { get; set; }
    public string? perfectLocation { get; set; }
    public string? location { get; set; }
    public double? PickupLatitude { get; set; }
    public double? PickupLongitude { get; set; }
}
