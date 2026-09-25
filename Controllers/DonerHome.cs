using FoodBridge.DATA;
using FoodBridge.DTOs;
using FoodBridge.Models;
using FoodBridge.services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
namespace FoodBridge.Controllers;

[Route("DonerHome")]
[Authorize(Roles = "Donor")]
public class DonerHome : ControllerBase
{
    private readonly FoodBridgeDB context;
    private readonly wastfood wf;
    private readonly MatchFoodRequirement match;
    public DonerHome(FoodBridgeDB context, wastfood wf, MatchFoodRequirement match)
    {
        this.wf = wf;
        this.context = context;
        this.match = match;
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
        await match.MatchAvailableFood(food);
        return Ok("Food added");
    }
    [HttpGet("display")]
    [HttpGet("display/pending")]
    public async Task<ActionResult<List<FoodDTO>>> DisplayFood()
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        if (!string.IsNullOrEmpty(email))
        {
            await wf.foodWast(email, "Donar");
        }
        List<Food> food = await Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ToListAsync(
            context.Foods.Where(f => f.emailID == email && f.status == "pending")
        );
        List<FoodDTO> foodDtos = new List<FoodDTO>();
        foreach (Food f in food)
        {
            foodDtos.Add(new FoodDTO(f.id, f.emailID, f.quntity, f.FoodName, f.items, f.donationDateTime, f.status, f.location, f.city, f.state, f.perfectLocation));
        }
        return Ok(foodDtos);
    }

    [HttpGet("display/Allocated")]
    public async Task<ActionResult<List<MatchedDTO>>> DisplayFoodAllocated()
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        List<MatchedDTO> MatchedDtos = new List<MatchedDTO>();
        var list = await Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ToListAsync(
            context.Foods.Where(f => f.emailID == email && f.status == "Allocated")
        );
        foreach (Food f in list)
        {
            var Matched = await context.MatchedFoods.FirstOrDefaultAsync(x => x.FID == f.id);
            if (Matched != null)
            {
                var n = await context.NeededFoods.FirstOrDefaultAsync(x => x.id == Matched.NFID);
                if (n != null)
                {
                    FoodDTO fd = new FoodDTO(f.id, f.emailID, f.quntity, f.FoodName, f.items, f.donationDateTime, f.status, f.location, f.city, f.state, f.perfectLocation);
                    NeededFoodDTO nd = new NeededFoodDTO(n.id, n.emailID, n.quntity, n.requestDateTime, n.status, n.location, n.city, n.state, n.perfectLocation);
                    MatchedDtos.Add(new MatchedDTO(fd, nd));
                }
            }
        }
        return Ok(MatchedDtos);
    }
    [HttpGet("display/NotMatched")]
    public async Task<ActionResult<List<FoodDTO>>> DisplayFoodNotMatched()
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        List<Food> food = await Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ToListAsync(
            context.Foods.Where(f => f.emailID == email && f.status == "NotMatched")
        );
        List<FoodDTO> foodDtos = new List<FoodDTO>();
        foreach (Food f in food)
        {
            foodDtos.Add(new FoodDTO(f.id, f.emailID, f.quntity, f.FoodName, f.items, f.donationDateTime, f.status, f.location, f.city, f.state, f.perfectLocation));
        }
        return Ok(foodDtos);
    }
    [HttpGet("display/done")]
    public async Task<ActionResult<List<FoodDTO>>> DisplayFoodDonated()
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        List<Food> food = await Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ToListAsync(
            context.Foods.Where(f => f.emailID == email && f.status == "done")
        );
        List<FoodDTO> foodDtos = new List<FoodDTO>();
        foreach (Food f in food)
        {
            foodDtos.Add(new FoodDTO(f.id, f.emailID, f.quntity, f.FoodName, f.items, f.donationDateTime, f.status, f.location, f.city, f.state, f.perfectLocation));
        }
        return Ok(foodDtos);
    }
}
