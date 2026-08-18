using FoodBridge.DATA;
using FoodBridge.DTOs;
using FoodBridge.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace FoodBridge.Controllers;
[Route("signup")]
public class signUP:ControllerBase
{
    private static User Huser = new User();
    private readonly FoodBridgeDB context;
    public signUP(FoodBridgeDB context)
    {
        this.context = context;
    }
    [HttpPost]
    public async Task<string> SignUp([FromBody] UserDTO userDto)
    {
        User u = await context.Users.FindAsync(userDto.EmailID);
        if (u != null)
        {
            return "user already exists";
        }

        string passHash = new PasswordHasher<User>().HashPassword(Huser, userDto.password);
        User user = new User(userDto.Username,userDto.EmailID,passHash,userDto.role);
        context.Users.Add(user);
        await context.SaveChangesAsync();
        return "success";
    }
}