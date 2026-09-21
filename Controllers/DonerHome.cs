using FoodBridge.DATA;
using FoodBridge.DTOs;
using FoodBridge.Models;
using FoodBridge.services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
namespace FoodBridge.Controllers;

[Route("DonerHome")]
[Authorize(Roles = "Donor")]
public class DonerHome : ControllerBase
{
    private readonly FoodBridgeDB context;

    public DonerHome(FoodBridgeDB context)
    {
        this.context = context;
    }

    [HttpPost]
    public async Task<ActionResult<string>> AddFood([FromBody] Food foodDto)
    {
        if (null == foodDto)
        {
            return Ok("Error in sending data");
        }

        User? user = await context.Users.FindAsync(foodDto.emailID);
        if (user == null)
        {
            return Ok("user not found");
        }

        // If composed location is not explicitly provided, build it from the 3 parts
        string? loc = foodDto.location;
        if (string.IsNullOrWhiteSpace(loc))
        {
            var parts = new List<string>();
            if (!string.IsNullOrWhiteSpace(foodDto.perfectLocation)) parts.Add(foodDto.perfectLocation);
            if (!string.IsNullOrWhiteSpace(foodDto.city)) parts.Add(foodDto.city);
            if (!string.IsNullOrWhiteSpace(foodDto.state)) parts.Add(foodDto.state);
            loc = parts.Count > 0 ? string.Join(", ", parts) : null;
        }

        Food food = new Food(
            foodDto.emailID, 
            user, 
            foodDto.quntity, 
            foodDto.FoodName, 
            foodDto.items, 
            foodDto.donationDateTime ?? DateTime.Now,
            string.IsNullOrWhiteSpace(foodDto.status) ? "pending" : foodDto.status,
            loc,
            foodDto.city,
            foodDto.state,
            foodDto.perfectLocation
        );
        context.Foods.Add(food);
        await context.SaveChangesAsync();
        return Ok("Food added");
    }
    [HttpGet("display")]
    public async Task<ActionResult<List<FoodDTO>>> DisplayFood()
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        List<Food> food = await Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ToListAsync(
            context.Foods.Where(f => f.emailID == email)
        );
        List<FoodDTO> foodDtos = new List<FoodDTO>();
        foreach (Food f in food)
        {
            foodDtos.Add(new FoodDTO(f.id, f.emailID, f.quntity, f.FoodName, f.items, f.donationDateTime, f.status, f.location, f.city, f.state, f.perfectLocation));
        }
        return Ok(foodDtos);
    }
}
