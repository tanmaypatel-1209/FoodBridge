using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FoodBridge.DATA;
using FoodBridge.Models;
using Microsoft.EntityFrameworkCore;

namespace FoodBridge.services;

public class MatchFoodRequirement
{
    private readonly FoodBridgeDB context;
    private readonly DeliveryService deliveryService;

    public MatchFoodRequirement(FoodBridgeDB context, DeliveryService deliveryService)
    {
        this.context = context;
        this.deliveryService = deliveryService;
    }

    private static string NormalizeCity(string? city)
    {
        if (string.IsNullOrWhiteSpace(city)) return string.Empty;
        var trimmed = city.Trim().ToLowerInvariant();
        var firstPart = trimmed.Split(',')[0].Trim();
        return firstPart;
    }

    public async Task Matched(NeededFood nf)
    {
        Console.WriteLine($"[DIAGNOSTIC] Matching requirement for NeededFood Id: {nf.id}, Receiver: {nf.emailID}, City: '{nf.city}', Qty: {nf.quntity}, Time: {nf.requestDateTime}");

        // Load pending foods matching city
        var candidateFoods = await context.Foods
            .Where(x => x.status == "pending" && x.city != null && nf.city != null)
            .ToListAsync();

        candidateFoods = candidateFoods
            .Where(x => NormalizeCity(x.city) == NormalizeCity(nf.city)
                     && (string.IsNullOrWhiteSpace(x.state) || string.IsNullOrWhiteSpace(nf.state) || x.state.Trim().ToUpper() == nf.state.Trim().ToUpper()))
            .ToList();

        // Apply time filter in-memory (donation within 2 hours of request)
        var foods = candidateFoods
            .Where(x => x.donationDateTime.HasValue && nf.requestDateTime.HasValue
                     && Math.Abs((x.donationDateTime.Value - nf.requestDateTime.Value).TotalHours) <= 2)
            .ToList();

        int min = 999999;
        Food? minWast = null;
        foreach (Food food in foods)
        {
            int m = food.quntity - nf.quntity;
            if (m >= 0 && min > m)
            {
                minWast = food;
                min = m;
            }
        }

        if (minWast != null)
        {
            int matchedQty = nf.quntity;
            int remainingQty = minWast.quntity - matchedQty;

            Console.WriteLine($"[DIAGNOSTIC] Match found! Donor Food Id: {minWast.id} (Total: {minWast.quntity}), Receiver NeededFood Id: {nf.id} (Needed: {nf.quntity}). Matched: {matchedQty}, Remaining: {remainingQty}");

            // Handle partial quantity: if donor has more than needed, keep leftover as pending
            if (remainingQty > 0)
            {
                Food remainingFood = new Food(
                    minWast.emailID,
                    minWast.user,
                    remainingQty,
                    minWast.FoodName,
                    minWast.items,
                    minWast.donationDateTime,
                    "pending",
                    minWast.location,
                    minWast.city,
                    minWast.state,
                    minWast.perfectLocation
                );
                remainingFood.PickupLatitude = minWast.PickupLatitude;
                remainingFood.PickupLongitude = minWast.PickupLongitude;
                context.Foods.Add(remainingFood);
            }

            minWast.quntity = matchedQty;
            minWast.status = "Allocated";
            nf.status = "Allocated";

            Console.WriteLine($"[DIAGNOSTIC] Match status changed to ALLOCATED for Food {minWast.id} and NeededFood {nf.id}");

            var matchedFood = new MatchedFood(
                minWast.id,
                minWast.emailID,
                matchedQty,
                minWast.donationDateTime,
                minWast.city,
                minWast.state,
                minWast.perfectLocation,
                nf.id,
                nf.emailID,
                nf.requestDateTime,
                nf.quntity,
                nf.perfectLocation
            );
            context.MatchedFoods.Add(matchedFood);
            await context.SaveChangesAsync();

            Console.WriteLine($"[DIAGNOSTIC] Match created with MatchedFoodId: {matchedFood.id}");

            // Create FoodDelivery immediately server-side
            await deliveryService.CreateDeliveryForMatchAsync(matchedFood);
        }
        else
        {
            Console.WriteLine($"[DIAGNOSTIC] No eligible pending Food found for NeededFood Id: {nf.id}");
        }
    }

    public async Task Matched(Food food)
    {
        Console.WriteLine($"[DIAGNOSTIC] Matching food donation for Food Id: {food.id}, Donor: {food.emailID}, City: '{food.city}', Qty: {food.quntity}, Time: {food.donationDateTime}");

        // Load pending neededFoods matching city
        var candidateNfs = await context.NeededFoods
            .Where(x => x.status == "pending" && x.city != null && food.city != null)
            .ToListAsync();

        candidateNfs = candidateNfs
            .Where(x => NormalizeCity(x.city) == NormalizeCity(food.city)
                     && (string.IsNullOrWhiteSpace(x.state) || string.IsNullOrWhiteSpace(food.state) || x.state.Trim().ToUpper() == food.state.Trim().ToUpper()))
            .ToList();

        // Apply time filter in-memory
        var neededFoods = candidateNfs
            .Where(x => x.requestDateTime.HasValue && food.donationDateTime.HasValue
                     && Math.Abs((food.donationDateTime.Value - x.requestDateTime.Value).TotalHours) <= 2)
            .ToList();

        int min = 999999;
        NeededFood? bestNf = null;
        foreach (NeededFood nf in neededFoods)
        {
            int m = food.quntity - nf.quntity;
            if (m >= 0 && min > m)
            {
                bestNf = nf;
                min = m;
            }
        }

        if (bestNf != null)
        {
            int matchedQty = bestNf.quntity;
            int remainingQty = food.quntity - matchedQty;

            Console.WriteLine($"[DIAGNOSTIC] Match found! Donor Food Id: {food.id} (Total: {food.quntity}), Receiver NeededFood Id: {bestNf.id} (Needed: {bestNf.quntity}). Matched: {matchedQty}, Remaining: {remainingQty}");

            if (remainingQty > 0)
            {
                Food remainingFood = new Food(
                    food.emailID,
                    food.user,
                    remainingQty,
                    food.FoodName,
                    food.items,
                    food.donationDateTime,
                    "pending",
                    food.location,
                    food.city,
                    food.state,
                    food.perfectLocation
                );
                remainingFood.PickupLatitude = food.PickupLatitude;
                remainingFood.PickupLongitude = food.PickupLongitude;
                context.Foods.Add(remainingFood);
            }

            food.quntity = matchedQty;
            food.status = "Allocated";
            bestNf.status = "Allocated";

            Console.WriteLine($"[DIAGNOSTIC] Match status changed to ALLOCATED for Food {food.id} and NeededFood {bestNf.id}");

            var matchedFood = new MatchedFood(
                food.id,
                food.emailID,
                matchedQty,
                food.donationDateTime,
                food.city,
                food.state,
                food.perfectLocation,
                bestNf.id,
                bestNf.emailID,
                bestNf.requestDateTime,
                bestNf.quntity,
                bestNf.perfectLocation
            );
            context.MatchedFoods.Add(matchedFood);
            await context.SaveChangesAsync();

            Console.WriteLine($"[DIAGNOSTIC] Match created with MatchedFoodId: {matchedFood.id}");

            // Create FoodDelivery immediately server-side
            await deliveryService.CreateDeliveryForMatchAsync(matchedFood);
        }
        else
        {
            Console.WriteLine($"[DIAGNOSTIC] No eligible pending NeededFood found for Food Id: {food.id}");
        }
    }

    public async Task MatchAvailableFood(Food food)
    {
        await Matched(food);
    }
}