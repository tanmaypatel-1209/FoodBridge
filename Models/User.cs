using System.ComponentModel.DataAnnotations;

namespace FoodBridge.Models
{

    public class User
    {
        [Required] public string Username { get; set; }
        [Key] [EmailAddress] [Required] public string EmailID { get; set; }
        [Required] public string password { get; set; }
        [Required] public string role { get; set; }

        public User()
        {
        }

        public User(string username, string emailID, string password, string role)
        {
            this.Username = username;
            this.EmailID = emailID;
            this.password = password;
            this.role = role;
        }
    }
}