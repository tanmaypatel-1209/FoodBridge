namespace FoodBridge.DTOs;

public class NeededFoodDTO
{
    public int id { get; set; }
    public string emailID { get; set; } = string.Empty;
    public int quntity { get; set; }
    public string FoodName { get; set; } = string.Empty;
    public string[] items { get; set; } = Array.Empty<string>();
    public DateTime? requestDateTime { get; set; }
    public string status { get; set; } = "pending";
    public string? location { get; set; }
    public string? city { get; set; }
    public string? state { get; set; }
    public string? perfectLocation { get; set; }

    public NeededFoodDTO()
    {
    }

    public NeededFoodDTO(string emailID, int quntity, DateTime? requestDateTime = null, string? location = null, string? city = null, string? state = null, string? perfectLocation = null)
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

    public NeededFoodDTO(int id, string emailID, int quntity, DateTime? requestDateTime = null, string status = "pending", string? location = null, string? city = null, string? state = null, string? perfectLocation = null)
    {
        this.id = id;
        this.emailID = emailID;
        this.quntity = quntity;
        this.requestDateTime = requestDateTime;
        this.status = string.IsNullOrWhiteSpace(status) ? "pending" : status;
        this.location = location;
        this.city = city;
        this.state = state;
        this.perfectLocation = perfectLocation;
    }
}
