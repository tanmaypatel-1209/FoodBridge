using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using FoodBridge.DTOs;
using Microsoft.IdentityModel.Tokens;
using Microsoft.AspNetCore.Mvc;
using FoodBridge.Models;
using FoodBridge.DATA;
using Microsoft.EntityFrameworkCore;

namespace FoodBridge.services;

public class wastfood
{
    private readonly FoodBridgeDB context;
    private readonly Microsoft.AspNetCore.Http.IHttpContextAccessor? httpContextAccessor;

    public wastfood(FoodBridgeDB context, Microsoft.AspNetCore.Http.IHttpContextAccessor? httpContextAccessor = null)
    {
        this.context = context;
        this.httpContextAccessor = httpContextAccessor;
    }
    public async Task foodWast(string? email, string role){
        email ??= httpContextAccessor?.HttpContext?.User?.FindFirstValue(ClaimTypes.Email);
        if (string.IsNullOrEmpty(email)) return;
        DateTime now = DateTime.Now;
        if (role == "Donor")
        {
            var foods = await context.Foods
                .Where(x => x.emailID == email && (x.status == "pending" || x.status == "Allocated"))
                .ToListAsync();

            foreach (Food food in foods)
            {
                if (food.donationDateTime.HasValue && (now - food.donationDateTime.Value).TotalHours >= 1)
                {
                    food.status = "NotMatched";
                }
            }
        }
        else if (role == "NGOs")
        {
            var foods = await context.NeededFoods
                .Where(x => x.emailID == email && (x.status == "pending" || x.status == "Allocated"))
                .ToListAsync();

            foreach (NeededFood food in foods)
            {
                if (food.requestDateTime.HasValue && (now- food.requestDateTime.Value).TotalHours >= 1)
                {
                    food.status = "NotMatched";
                }
            }
        }

        await context.SaveChangesAsync();
    }
}