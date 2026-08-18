namespace FoodBridge.DTOs;

public class LoginUserDTO
{
    public string EmailID { get; set; }
    public string password { get; set; }

    public LoginUserDTO(string emailID, string password)
    {
        this.EmailID = emailID;
        this.password = password;
    }
}