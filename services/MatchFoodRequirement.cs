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
public class MatchFoodRequirement{
    private readonly FoodBridgeDB context;
    public MatchFoodRequirement(FoodBridgeDB context){
        this.context = context;
    }
    public async Task Matched(NeededFood nf){
        Console.WriteLine("matched");
        var foods = await context.Foods
            .Where(x => x.status == "pending" && x.city == nf.city && x.state == nf.state)
            .ToListAsync();
        int min = 999;
        Food? minWast = null;
        foreach (Food food in foods) {
            if (food.donationDateTime.HasValue && nf.requestDateTime.HasValue &&
                (food.donationDateTime.Value - nf.requestDateTime.Value).Duration().TotalHours <= 2)
            {
                int m = food.quntity - nf.quntity;
                if (m >= 0 && min > m) {
                    minWast = food;
                    min = m;
                }
            }
        }
        if (minWast != null) {
            await CreateMatchAndDelivery(minWast, nf);
        }
    }

    public async Task MatchAvailableFood(Food food)
    {
        if (food.status != "pending") return;

        var neededList = await context.NeededFoods
            .Where(x => x.status == "pending" && x.city == food.city && x.state == food.state)
            .ToListAsync();

        int min = 999;
        NeededFood? bestNf = null;
        foreach (var nf in neededList)
        {
            if (food.donationDateTime.HasValue && nf.requestDateTime.HasValue &&
                (food.donationDateTime.Value - nf.requestDateTime.Value).Duration().TotalHours <= 2)
            {
                int m = food.quntity - nf.quntity;
                if (m >= 0 && min > m)
                {
                    bestNf = nf;
                    min = m;
                }
            }
        }

        if (bestNf != null)
        {
            await CreateMatchAndDelivery(food, bestNf);
        }
    }

    private async Task CreateMatchAndDelivery(Food minWast, NeededFood nf)
    {
        var matchedFood = new MatchedFood(
            minWast.id,
            minWast.emailID,
            minWast.quntity,
            minWast.donationDateTime,
            minWast.city,
            minWast.state,
            minWast.perfectLocation,
            nf.id,
            nf.emailID,
            nf.requestDateTime,
            nf.quntity,
            nf.perfectLocation);

        context.MatchedFoods.Add(matchedFood);
        nf.status = "Allocated";
        minWast.status = "Allocated";
        await context.SaveChangesAsync();

        var delivery = new FoodDelivery(matchedFood.id, minWast.emailID, nf.emailID);
        context.FoodDeliveries.Add(delivery);
        await context.SaveChangesAsync();

        context.DeliveryStatusHistories.Add(new DeliveryStatusHistory(
            delivery.Id,
            "Allocated",
            "AwaitingTransporter",
            "System",
            "System",
            $"Automated match: {minWast.quntity} servings of '{minWast.FoodName}' allocated to requirement #{nf.id}."
        ));
        await context.SaveChangesAsync();
    }
}