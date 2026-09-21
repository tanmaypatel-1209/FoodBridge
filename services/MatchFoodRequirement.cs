using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using FoodBridge.DTOs;
using Microsoft.IdentityModel.Tokens;
using Microsoft.AspNetCore.Mvc;
using FoodBridge.Models;
using FoodBridge.Data;
using Microsoft.EntityFrameworkCore;
namespace FoodBridge.services;
public class MatchFoodRequirement{
        private readonly FoodBridgeDB context;
        public MatchFoodRequirement(FoodBridgeDB context){
            this.context = context;
        }
        public async void Matched(NeededFood nf){
            var foods = await context.food
            .where(x=>(
                x.status=="pending" && 
                x.city.ToUpper()==nf.city.ToUpper() && 
                x.state.ToUpper()==nf.state.ToUpper() && 
                (x.donationDateTime-nf.requestDateTime).duration().TotalHours<=2
                ));
            int min=999;
            Food minWast;
            foreach(Food food in foods){
                int m = food.quntity-nf.quntity
                if(m>=0 && min>m){
                    minWast = food;
                    min = m;
                }
            };
            context.MatchedFoods.Add(new MatchedFood(
                minWast.emailID,
                minWast.quntity,
                minWast.donationDateTime,
                minWast.city,
                minWast.state,
                minWast.perfectLocation,
                nf.emailID,
                nf.requestDateTime,
                nf.quntity,
                nf.perfectLocation));
            await context.SaveChangesAsync();
            
        }

}