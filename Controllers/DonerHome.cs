using FoodBridge.DATA;
using FoodBridge.DTOs;
using FoodBridge.Models;
using FoodBridge.services;
using Microsoft.AspNetCore.Authorization;
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

    // ── POST /DonerHome — Add new food donation ───────────────────────────────
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
        if (foodDto.PickupLatitude.HasValue && foodDto.PickupLongitude.HasValue)
        {
            food.PickupLatitude  = foodDto.PickupLatitude;
            food.PickupLongitude = foodDto.PickupLongitude;
        }
        await context.SaveChangesAsync();
        await match.MatchAvailableFood(food);
        return Ok("Food added");
    }

    // ── GET /DonerHome/{id} — Get single food entry (ownership-checked) ───────
    [HttpGet("{id:int}")]
    public async Task<ActionResult<FoodDTO>> GetFoodById(int id)
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        if (string.IsNullOrEmpty(email)) return Unauthorized();

        var food = await context.Foods.FirstOrDefaultAsync(f => f.id == id);
        if (food == null) return NotFound(new { message = "Food entry not found." });
        if (food.emailID != email) return StatusCode(403, new { message = "Forbidden: This food does not belong to you." });

        return Ok(new FoodDTO(food.id, food.emailID, food.quntity, food.FoodName, food.items,
            food.donationDateTime, food.status, food.location, food.city, food.state, food.perfectLocation));
    }

    // ── PUT /DonerHome/{id} — Edit a food donation ────────────────────────────
    [HttpPut("{id:int}")]
    public async Task<ActionResult<object>> UpdateFood(int id, [FromBody] UpdateFoodDto dto)
    {
        if (dto == null) return BadRequest(new { message = "Invalid request body." });

        var email = User.FindFirstValue(ClaimTypes.Email);
        if (string.IsNullOrEmpty(email)) return Unauthorized();

        // Re-fetch from DB — concurrency guard (never trust stale client state)
        var food = await context.Foods.FirstOrDefaultAsync(f => f.id == id);
        if (food == null) return NotFound(new { message = "Food entry not found." });

        // Backend ownership check — never trust client-supplied IDs
        if (food.emailID != email)
            return StatusCode(403, new { message = "Forbidden: You can only edit your own food donations." });

        var s = food.status?.ToLower() ?? "";

        if (s == "done")
            return BadRequest(new { message = "This food has already been delivered and cannot be edited. Historical records are preserved." });

        if (s == "cancelled")
            return BadRequest(new { message = "This food has been cancelled and cannot be edited." });

        // Re-check active delivery status from DB — concurrency guard
        var activeDelivery = await GetActiveDeliveryForFood(food.id);
        bool deliveryIsActive = activeDelivery != null &&
            (activeDelivery.Status == "PickedUp" || activeDelivery.Status == "InTransit" ||
             activeDelivery.Status == "ReceiverArrived" || activeDelivery.Status == "Delivered");

        if (deliveryIsActive)
            return BadRequest(new { message = $"This food cannot be edited because a delivery is currently '{activeDelivery!.Status}'. Editing is only allowed before the transporter picks up the food." });

        bool isAllocated = s == "allocated";

        // Quantity edit is blocked once allocated (to preserve match integrity)
        if (isAllocated && dto.quntity.HasValue && dto.quntity.Value != food.quntity)
            return BadRequest(new { message = "Unable to change quantity: this food has already been allocated to a receiver. Quantity editing is disabled to preserve the existing allocation." });

        // Quantity validation for non-allocated food
        if (!isAllocated && dto.quntity.HasValue)
        {
            if (dto.quntity.Value <= 0)
                return BadRequest(new { message = "Quantity must be greater than 0." });
            food.quntity = dto.quntity.Value;
        }

        // Apply safe field updates
        if (dto.FoodName != null) food.FoodName = dto.FoodName;
        if (dto.items != null) food.items = dto.items;
        if (dto.donationDateTime.HasValue && !isAllocated) food.donationDateTime = dto.donationDateTime.Value;
        if (dto.city != null) food.city = dto.city;
        if (dto.state != null) food.state = dto.state;
        if (dto.perfectLocation != null) food.perfectLocation = dto.perfectLocation;
        if (dto.location != null) food.location = dto.location;
        if (dto.PickupLatitude.HasValue) food.PickupLatitude = dto.PickupLatitude;
        if (dto.PickupLongitude.HasValue) food.PickupLongitude = dto.PickupLongitude;

        // Rebuild composite location field
        if (dto.location != null || dto.perfectLocation != null || dto.city != null || dto.state != null)
        {
            var parts = new List<string>();
            if (!string.IsNullOrWhiteSpace(food.perfectLocation)) parts.Add(food.perfectLocation);
            if (!string.IsNullOrWhiteSpace(food.city)) parts.Add(food.city);
            if (!string.IsNullOrWhiteSpace(food.state)) parts.Add(food.state);
            if (parts.Count > 0) food.location = string.Join(", ", parts);
        }

        await context.SaveChangesAsync();

        return Ok(new
        {
            message = "Food donation updated successfully.",
            food = new FoodDTO(food.id, food.emailID, food.quntity, food.FoodName, food.items,
                food.donationDateTime, food.status, food.location, food.city, food.state, food.perfectLocation)
        });
    }

    // ── DELETE /DonerHome/{id} — Delete / cancel a food donation ─────────────
    [HttpDelete("{id:int}")]
    public async Task<ActionResult<object>> DeleteFood(int id)
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        if (string.IsNullOrEmpty(email)) return Unauthorized();

        // Re-fetch from DB — concurrency guard
        var food = await context.Foods.FirstOrDefaultAsync(f => f.id == id);
        if (food == null) return NotFound(new { message = "Food entry not found." });

        // Backend ownership check
        if (food.emailID != email)
            return StatusCode(403, new { message = "Forbidden: You can only delete your own food donations." });

        var s = food.status?.ToLower() ?? "";

        if (s == "cancelled")
            return BadRequest(new { message = "This food has already been cancelled." });

        if (s == "done")
            return BadRequest(new { message = "This food has already been delivered and cannot be deleted. Historical records are preserved." });

        // Check for related FoodDelivery
        var delivery = await GetActiveDeliveryForFood(food.id);

        if (delivery != null)
        {
            var ds = delivery.Status?.ToLower() ?? "";

            if (ds == "pickedup" || ds == "intransit" || ds == "receiverarrived")
                return BadRequest(new { message = $"This food cannot be deleted: the transporter has already picked it up (Delivery status: {delivery.Status}). Cancellation is not possible at this stage." });

            if (ds == "delivered")
                return BadRequest(new { message = "This food has already been delivered and cannot be deleted. Historical records are preserved." });

            // Delivery exists at AwaitingTransporter, Accepted, or PickupPending — allow cancellation
            using var tx = await context.Database.BeginTransactionAsync();
            try
            {
                // 1. Cancel the FoodDelivery
                var oldDeliveryStatus = delivery.Status;
                delivery.Status = "Cancelled";
                delivery.CancelledAt = DateTime.UtcNow;
                delivery.CancellationReason = $"Cancelled by Donor ({email}) via dashboard.";

                context.DeliveryStatusHistories.Add(new DeliveryStatusHistory(
                    delivery.Id, oldDeliveryStatus, "Cancelled", email, "Donor",
                    $"Donor cancelled food donation (Food Id: {food.id})."));

                // 2. Free transporter if they accepted
                if (!string.IsNullOrEmpty(delivery.TransporterId))
                {
                    var transporter = await context.Users.FindAsync(delivery.TransporterId);
                    if (transporter != null && transporter.AvailabilityStatus == "Busy")
                    {
                        var otherActive = await context.FoodDeliveries.AnyAsync(d =>
                            d.Id != delivery.Id &&
                            d.TransporterId == delivery.TransporterId &&
                            d.Status != "Delivered" && d.Status != "Cancelled");
                        if (!otherActive)
                            transporter.AvailabilityStatus = "Available";
                    }
                }

                // 3. Cancel MatchedFood and restore NeededFood to pending
                var matchedFood = await context.MatchedFoods.FirstOrDefaultAsync(m => m.FID == food.id);
                if (matchedFood != null)
                {
                    var neededFood = await context.NeededFoods.FirstOrDefaultAsync(n => n.id == matchedFood.NFID);
                    if (neededFood != null && neededFood.status == "Allocated")
                        neededFood.status = "pending";
                    context.MatchedFoods.Remove(matchedFood);
                }

                // 4. Soft-delete food (preserve history)
                food.status = "Cancelled";

                await context.SaveChangesAsync();
                await tx.CommitAsync();

                return Ok(new { message = "Food donation cancelled successfully. The associated delivery has been cancelled and the receiver's request has been returned to pending for re-matching." });
            }
            catch
            {
                await tx.RollbackAsync();
                throw;
            }
        }

        // No active delivery
        if (s == "pending" || s == "notmatched")
        {
            var orphanMatch = await context.MatchedFoods.FirstOrDefaultAsync(m => m.FID == food.id);
            if (orphanMatch != null)
            {
                var neededFood = await context.NeededFoods.FirstOrDefaultAsync(n => n.id == orphanMatch.NFID);
                if (neededFood != null && neededFood.status == "Allocated")
                    neededFood.status = "pending";
                context.MatchedFoods.Remove(orphanMatch);
            }
            context.Foods.Remove(food);
            await context.SaveChangesAsync();
            return Ok(new { message = "Food donation deleted successfully." });
        }

        if (s == "allocated")
        {
            using var tx = await context.Database.BeginTransactionAsync();
            try
            {
                var matchedFood = await context.MatchedFoods.FirstOrDefaultAsync(m => m.FID == food.id);
                if (matchedFood != null)
                {
                    var neededFood = await context.NeededFoods.FirstOrDefaultAsync(n => n.id == matchedFood.NFID);
                    if (neededFood != null && neededFood.status == "Allocated")
                        neededFood.status = "pending";
                    context.MatchedFoods.Remove(matchedFood);
                }
                food.status = "Cancelled";
                await context.SaveChangesAsync();
                await tx.CommitAsync();
                return Ok(new { message = "Food donation cancelled. The receiver's request has been returned to pending for re-matching." });
            }
            catch
            {
                await tx.RollbackAsync();
                throw;
            }
        }

        return BadRequest(new { message = $"Cannot delete food with status '{food.status}'." });
    }

    // Helper: find an active (non-cancelled) FoodDelivery linked to a given food via MatchedFood
    private async Task<FoodDelivery?> GetActiveDeliveryForFood(int foodId)
    {
        return await context.FoodDeliveries
            .Include(d => d.MatchedFood)
            .Where(d => d.MatchedFood != null && d.MatchedFood.FID == foodId && d.Status != "Cancelled")
            .OrderByDescending(d => d.CreatedAt)
            .FirstOrDefaultAsync();
    }

    // ── GET /DonerHome/display — Pending ─────────────────────────────────────
    [HttpGet("display")]
    [HttpGet("display/pending")]
    public async Task<ActionResult<List<FoodDTO>>> DisplayFood()
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        if (!string.IsNullOrEmpty(email))
        {
            await wf.foodWast(email, "Donor");
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
