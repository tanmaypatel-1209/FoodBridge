namespace FoodBridge.DTOs;

public class UserDTO
{
    public string Username { get; set; }
    public string EmailID { get; set; }
    public string password { get; set; }
    public string role { get; set; }

    public UserDTO(string username, string emailID, string password, string role)
    {
        this.Username = username;
        this.EmailID = emailID;
        this.password = password;
        this.role = role;
    }
}