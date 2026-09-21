using FoodBridge.DATA;
using FoodBridge.DTOs;
using FoodBridge.Models;
using FoodBridge.services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
namespace FoodBridge.Controllers;
[Route("NGOs")]
[Authorize(Roles = "Receiver")]
public class NGOsController:ControllerBase
{
    private readonly FoodBridgeDB context;
    public NGOsController(FoodBridgeDB context){
        this.context = context;
    }
    [HttpGet("display")]
    public async Task<ActionResult<List<NeededFoodDTO>>> Display()
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        List<NeededFoodDTO> foodDtos = new List<NeededFoodDTO>();
        var list = await Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ToListAsync(
            context.NeededFoods.Where(x => x.emailID == email)
        );
        foreach (NeededFood n in list)
        {
            foodDtos.Add(new NeededFoodDTO(
                n.id,
                n.emailID,
                n.quntity,
                n.requestDateTime,
                n.status,
                n.location,
                n.city,
                n.state,
                n.perfectLocation
            ));
        }
        return Ok(foodDtos);
    }
    [HttpPost]
    public async Task<ActionResult<string>> AddNeededFood([FromBody] NeededFoodDTO food)
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        User u = await context.Users.FindAsync(email);
        if(u==null){
            return "user not found";
        }
        NeededFood nf = new NeededFood(email, u, food.quntity, food.requestDateTime, food.location, food.city, food.state, food.perfectLocation);
        context.NeededFoods.Add(nf);
        await context.SaveChangesAsync();
        return "Added";
    }

}