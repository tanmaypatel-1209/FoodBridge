namespace FoodBridge.DTOs;

public class UserDTO
{
    public string Username { get; set; } = string.Empty;
    public string EmailID { get; set; } = string.Empty;
    public string password { get; set; } = string.Empty;
    public string role { get; set; } = string.Empty;
    public string city { get; set; } = string.Empty;

    public UserDTO()
    {
    }

    public UserDTO(string username, string emailID, string password, string role, string city = "")
    {
        this.Username = username;
        this.EmailID = emailID;
        this.password = password;
        this.role = role;
        this.city = city;
    }
}