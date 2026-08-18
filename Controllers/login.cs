using FoodBridge.DATA;
using FoodBridge.DTOs;
using FoodBridge.Models;
using FoodBridge.services;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace FoodBridge.Controllers;
[Route("login")]
public class login:ControllerBase {
    private static User Huser = new User();
    private readonly FoodBridgeDB context;
    private readonly JWTCreate jwt;
    public login(FoodBridgeDB context, JWTCreate jwt)
    {
        this.jwt = jwt;
        this.context = context;
        
    }

    [HttpPost]
    public async Task<string> Login([FromBody]LoginUserDTO userDto)
    {
        User user = await context.Users.FindAsync(userDto.EmailID);
        if (user == null)
        {
            return "user not found";
        }
        else if (new PasswordHasher<User>().VerifyHashedPassword(Huser,user.password,userDto.password)==PasswordVerificationResult.Failed)
        {
            return "invalid password";
        }
        return jwt.createToken(new UserDTO(user.Username,user.EmailID,user.password,user.role));

    }
    
    
}