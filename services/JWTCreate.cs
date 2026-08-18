using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using FoodBridge.DTOs;
using Microsoft.IdentityModel.Tokens;

namespace FoodBridge.services;

public class JWTCreate
{
    private readonly IConfiguration configuration;
    public JWTCreate(IConfiguration configuration)
    {
        this.configuration = configuration;
    }
    public string createToken(UserDTO userDto)
    {
        var claims = new List<Claim>
        {
            new Claim(ClaimTypes.Email, userDto.EmailID),
            new Claim(ClaimTypes.Role, userDto.role)
        };
        var key = new SymmetricSecurityKey(
            Encoding.UTF8.GetBytes(
                configuration["Jwt:Key"]!
            )
        );
        var credentials = new SigningCredentials(
            key,
            SecurityAlgorithms.HmacSha256
        );
        var expirationMinutes =
            int.Parse(
                configuration["Jwt:ExpirationMinutes"]!
            );
        var token = new JwtSecurityToken(
            issuer: configuration["Jwt:Issuer"],
            audience: configuration["Jwt:Audience"],
            claims: claims,
            expires: DateTime.UtcNow.AddMinutes(expirationMinutes),
            signingCredentials: credentials
        );
        return new JwtSecurityTokenHandler().WriteToken(token);

    }
}