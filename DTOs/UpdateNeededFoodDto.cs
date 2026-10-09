namespace FoodBridge.DTOs;

/// <summary>
/// DTO for Receiver/NGO to update their own food request.
/// Protected fields (emailID, status, etc.) are intentionally excluded.
/// </summary>
public class UpdateNeededFoodDto
{
    public int? quntity { get; set; }
    public DateTime? requestDateTime { get; set; }
    public string? city { get; set; }
    public string? state { get; set; }
    public string? perfectLocation { get; set; }
    public string? location { get; set; }
    public double? DeliveryLatitude { get; set; }
    public double? DeliveryLongitude { get; set; }
}
