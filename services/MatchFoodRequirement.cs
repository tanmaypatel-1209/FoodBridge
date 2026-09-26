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
            .Where(x=>(
                x.status=="pending" && 
                x.city.ToUpper()==nf.city.ToUpper() && 
                x.state.ToUpper()==nf.state.ToUpper() && 
                (x.donationDateTime-nf.requestDateTime).Duration().TotalHours<=2
                ));
            int min=999;
            Food minWast;
        foreach(Food food in foods){
                int m = food.quntity - nf.quntity;
            if(m >= 0 && min > m){
                    minWast = food;
                    min = m;
                }
            }
        if(min>=20){
            context.Foods.Remov(minWast);
            Food fd = new Food(minWast.emailID,minWast.user,minWast.quntity-min,minWast.FoodName,minWast.items,minWast.donationDateTime,minWast.city,minWast.state,minWast.perfectLocation);
            context.Foods.add(fd);
            Food fd1 = new Food(minWast.emailID,minWast.user,min,minWast.FoodName,minWast.items,minWast.donationDateTime,minWast.city,minWast.state,minWast.perfectLocation);
            context.Foods.add(fd1);     
            await context.SaveChangesAsync();
            minWast = fd1;
        }
        if (minWast != null) {
            context.MatchedFoods.Add(new MatchedFood(
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
                nf.perfectLocation));
            nf.status="Allocated";
            minWast.status="Allocated";
        await context.SaveChangesAsync();
        }
    }

    public async Task Matched(Food food){
        Console.WriteLine("matched");
        var neededFoods = await context.NeededFoods
            .Where(x=>(
                x.status=="pending" && 
                x.city.ToUpper()==food.city.ToUpper() && 
                x.state.ToUpper()==food.state.ToUpper() && 
                (food.donationDateTime-x.requestDateTime).Duration().TotalHours<=2
                ));
        int min=999;
        NeededFood bestNf;
        foreach(NeededFood nf in neededFoods){
            int m = food.quntity - nf.quntity;
            if(m >= 0 && min > m){
                bestNf = nf;
                min = m;
            }
        }
        if(min>=20){
            context.Foods.Remov(food);
            Food fd = new Food(food.emailID,food.user,food.quntity-min,food.FoodName,food.items,food.donationDateTime,food.city,food.state,food.perfectLocation);
            context.Foods.add(fd);
            Food fd1 = new Food(food.emailID,food.user,min,food.FoodName,food.items,food.donationDateTime,food.city,food.state,food.perfectLocation);
            context.Foods.add(fd1);     
            await context.SaveChangesAsync();
            food = fd1;
        }
        if (bestNf != null) {
            context.MatchedFoods.Add(new MatchedFood(
                food.id,
                food.emailID,
                food.quntity,
                food.donationDateTime,
                food.city,
                food.state,
                food.perfectLocation,
                bestNf.id,
                bestNf.emailID,
                bestNf.requestDateTime,
                bestNf.quntity,
                bestNf.perfectLocation));
            bestNf.status="Allocated";
            food.status="Allocated";
            await context.SaveChangesAsync();
        }
    }

    public async Task MatchAvailableFood(Food food){
        await Matched(food);
    }
}