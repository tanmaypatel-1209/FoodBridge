using FoodBridge.DATA;
using FoodBridge.DTOs;
using FoodBridge.Models;
using FoodBridge.services;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace FoodBridge.Controllers;

[Route("login")]
public class login : ControllerBase
{
    private static readonly User Huser = new User();
    private readonly FoodBridgeDB context;
    private readonly JWTCreate jwt;

    public login(FoodBridgeDB context, JWTCreate jwt)
    {
        this.jwt = jwt;
        this.context = context;
    }

    [HttpPost]
    public async Task<ActionResult<string>> Login([FromBody] LoginUserDTO userDto)
    {
        User? user = await context.Users.FindAsync(userDto.EmailID);
        if (user == null)
        {
            return "user not found";
        }
        else if (new PasswordHasher<User>().VerifyHashedPassword(Huser, user.password, userDto.password) == PasswordVerificationResult.Failed)
        {
            return "invalid password";
        }

        string token = jwt.createToken(new UserDTO(user.Username, user.EmailID, user.password, user.role, user.city ?? ""));

        Response.Headers["Authorization"] = "Bearer " + token;

        return token;
    }
}