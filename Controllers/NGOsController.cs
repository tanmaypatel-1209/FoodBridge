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
[Route("NGOs")]
[Authorize(Roles = "Receiver")]
public class NGOsController:ControllerBase
{
    private readonly FoodBridgeDB context;
    private readonly MatchFoodRequirement match;
    private readonly wastfood wf;
    public NGOsController(FoodBridgeDB context,MatchFoodRequirement match,wastfood wf){
        this.context = context;
        this.match = match;
        this.wf = wf;
    }
    [HttpGet("display")]
    [HttpGet("display/pending")]
    public async Task<ActionResult<List<NeededFoodDTO>>> Display()
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        if (!string.IsNullOrEmpty(email))
        {
            await wf.foodWast(email, "NGOs");
        }
        List<NeededFoodDTO> foodDtos = new List<NeededFoodDTO>();
        var list = await Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ToListAsync(
            context.NeededFoods.Where(x => x.emailID == email && x.status == "pending")
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

    [HttpGet("display/Allocated")]
    public async Task<ActionResult<List<MatchedDTO>>> DisplayAllocated()
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        List<MatchedDTO> MatchedDtos = new List<MatchedDTO>();
        var list = await Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ToListAsync(
            context.NeededFoods.Where(x => x.emailID == email && x.status == "Allocated")
        );
        foreach (NeededFood n in list)
        {
            var Matched = await context.MatchedFoods.FirstOrDefaultAsync(x => x.NFID == n.id);
            if (Matched != null)
            {
                var f = await context.Foods.FirstOrDefaultAsync(x => x.id == Matched.FID);
                if (f != null)
                {
                    FoodDTO fd = new FoodDTO(f.id, f.emailID, f.quntity, f.FoodName, f.items, f.donationDateTime, f.status, f.location, f.city, f.state, f.perfectLocation);
                    MatchedDtos.Add(new MatchedDTO(
                        fd,
                        new NeededFoodDTO(n.id,
                            n.emailID,
                            n.quntity,
                            n.requestDateTime,
                            n.status,
                            n.location,
                            n.city,
                            n.state,
                            n.perfectLocation)
                    ));
                }
            }
        }
        return Ok(MatchedDtos);
    }

    [HttpGet("display/NotMatched")]
    public async Task<ActionResult<List<NeededFoodDTO>>> DisplayNotMatched()
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        List<NeededFoodDTO> foodDtos = new List<NeededFoodDTO>();
        var list = await Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ToListAsync(
            context.NeededFoods.Where(x => x.emailID == email && x.status == "NotMatched")
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

    [HttpGet("display/done")]
    public async Task<ActionResult<List<NeededFoodDTO>>> DisplayDone()
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        List<NeededFoodDTO> foodDtos = new List<NeededFoodDTO>();
        var list = await Microsoft.EntityFrameworkCore.EntityFrameworkQueryableExtensions.ToListAsync(
            context.NeededFoods.Where(x => x.emailID == email && x.status == "done")
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
        await match.Matched(nf);
        return "Added";
    }

    

}