using FoodBridge.DATA;
using FoodBridge.DTOs;
using FoodBridge.Models;
using FoodBridge.services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Security.Claims;
namespace FoodBridge.Controllers;

[Route("NGOs")]
[Authorize(Roles = "Receiver")]
public class NGOsController : ControllerBase
{
    private readonly FoodBridgeDB context;
    private readonly MatchFoodRequirement match;
    private readonly wastfood wf;

    public NGOsController(FoodBridgeDB context, MatchFoodRequirement match, wastfood wf)
    {
        this.context = context;
        this.match = match;
        this.wf = wf;
    }

    // ── GET /NGOs/display — Pending ───────────────────────────────────────────
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
            foodDtos.Add(new NeededFoodDTO(n.id, n.emailID, n.quntity, n.requestDateTime, n.status, n.location, n.city, n.state, n.perfectLocation));
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
                        new NeededFoodDTO(n.id, n.emailID, n.quntity, n.requestDateTime, n.status, n.location, n.city, n.state, n.perfectLocation)
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
            foodDtos.Add(new NeededFoodDTO(n.id, n.emailID, n.quntity, n.requestDateTime, n.status, n.location, n.city, n.state, n.perfectLocation));
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
            foodDtos.Add(new NeededFoodDTO(n.id, n.emailID, n.quntity, n.requestDateTime, n.status, n.location, n.city, n.state, n.perfectLocation));
        }
        return Ok(foodDtos);
    }

    // ── POST /NGOs — Add new food request ────────────────────────────────────
    [HttpPost]
    public async Task<ActionResult<string>> AddNeededFood([FromBody] NeededFoodDTO food)
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        User u = await context.Users.FindAsync(email);
        if (u == null) return "user not found";

        NeededFood nf = new NeededFood(email, u, food.quntity, food.requestDateTime, food.location, food.city, food.state, food.perfectLocation);
        if (food.DeliveryLatitude.HasValue && food.DeliveryLongitude.HasValue)
        {
            nf.DeliveryLatitude  = food.DeliveryLatitude;
            nf.DeliveryLongitude = food.DeliveryLongitude;
        }
        context.NeededFoods.Add(nf);
        await context.SaveChangesAsync();
        await match.Matched(nf);
        return "Added";
    }

    // ── GET /NGOs/{id} — Get single request (ownership-checked) ─────────────
    [HttpGet("{id:int}")]
    public async Task<ActionResult<NeededFoodDTO>> GetRequestById(int id)
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        if (string.IsNullOrEmpty(email)) return Unauthorized();

        var nf = await context.NeededFoods.FirstOrDefaultAsync(n => n.id == id);
        if (nf == null) return NotFound(new { message = "Food request not found." });
        if (nf.emailID != email)
            return StatusCode(403, new { message = "Forbidden: This request does not belong to you." });

        return Ok(new NeededFoodDTO(nf.id, nf.emailID, nf.quntity, nf.requestDateTime, nf.status, nf.location, nf.city, nf.state, nf.perfectLocation));
    }

    // ── PUT /NGOs/{id} — Edit a food request ─────────────────────────────────
    [HttpPut("{id:int}")]
    public async Task<ActionResult<object>> UpdateRequest(int id, [FromBody] UpdateNeededFoodDto dto)
    {
        if (dto == null) return BadRequest(new { message = "Invalid request body." });

        var email = User.FindFirstValue(ClaimTypes.Email);
        if (string.IsNullOrEmpty(email)) return Unauthorized();

        // Re-fetch from DB — concurrency guard
        var nf = await context.NeededFoods.FirstOrDefaultAsync(n => n.id == id);
        if (nf == null) return NotFound(new { message = "Food request not found." });

        // Backend ownership check
        if (nf.emailID != email)
            return StatusCode(403, new { message = "Forbidden: You can only edit your own food requests." });

        var s = nf.status?.ToLower() ?? "";

        if (s == "done")
            return BadRequest(new { message = "This request has already been completed and cannot be edited. Historical records are preserved." });

        if (s == "cancelled")
            return BadRequest(new { message = "This request has been cancelled and cannot be edited." });

        // Check for active delivery
        var activeDelivery = await GetActiveDeliveryForRequest(nf.id);
        bool deliveryIsActive = activeDelivery != null &&
            (activeDelivery.Status == "PickedUp" || activeDelivery.Status == "InTransit" ||
             activeDelivery.Status == "ReceiverArrived" || activeDelivery.Status == "Delivered");

        if (deliveryIsActive)
            return BadRequest(new { message = $"This request cannot be edited: the food is currently '{activeDelivery!.Status}'. Editing is disabled once a transporter is in transit." });

        bool isAllocated = s == "allocated";

        // Quantity edit blocked once allocated
        if (isAllocated && dto.quntity.HasValue && dto.quntity.Value != nf.quntity)
            return BadRequest(new { message = "Unable to change quantity: this request has already been allocated to a donor. Quantity editing is disabled to preserve the existing allocation." });

        // Quantity validation for non-allocated
        if (!isAllocated && dto.quntity.HasValue)
        {
            if (dto.quntity.Value <= 0)
                return BadRequest(new { message = "Quantity must be greater than 0." });
            nf.quntity = dto.quntity.Value;
        }

        // Apply safe field updates
        if (dto.requestDateTime.HasValue && !isAllocated) nf.requestDateTime = dto.requestDateTime.Value;
        if (dto.city != null) nf.city = dto.city;
        if (dto.state != null) nf.state = dto.state;
        if (dto.perfectLocation != null) nf.perfectLocation = dto.perfectLocation;
        if (dto.location != null) nf.location = dto.location;
        if (dto.DeliveryLatitude.HasValue) nf.DeliveryLatitude = dto.DeliveryLatitude;
        if (dto.DeliveryLongitude.HasValue) nf.DeliveryLongitude = dto.DeliveryLongitude;

        // Rebuild composite location field
        if (dto.location != null || dto.perfectLocation != null || dto.city != null || dto.state != null)
        {
            var parts = new List<string>();
            if (!string.IsNullOrWhiteSpace(nf.perfectLocation)) parts.Add(nf.perfectLocation);
            if (!string.IsNullOrWhiteSpace(nf.city)) parts.Add(nf.city);
            if (!string.IsNullOrWhiteSpace(nf.state)) parts.Add(nf.state);
            if (parts.Count > 0) nf.location = string.Join(", ", parts);
        }

        await context.SaveChangesAsync();

        return Ok(new
        {
            message = "Food request updated successfully.",
            request = new NeededFoodDTO(nf.id, nf.emailID, nf.quntity, nf.requestDateTime, nf.status, nf.location, nf.city, nf.state, nf.perfectLocation)
        });
    }

    // ── DELETE /NGOs/{id} — Delete / cancel a food request ───────────────────
    [HttpDelete("{id:int}")]
    public async Task<ActionResult<object>> DeleteRequest(int id)
    {
        var email = User.FindFirstValue(ClaimTypes.Email);
        if (string.IsNullOrEmpty(email)) return Unauthorized();

        // Re-fetch from DB — concurrency guard
        var nf = await context.NeededFoods.FirstOrDefaultAsync(n => n.id == id);
        if (nf == null) return NotFound(new { message = "Food request not found." });

        // Backend ownership check
        if (nf.emailID != email)
            return StatusCode(403, new { message = "Forbidden: You can only delete your own food requests." });

        var s = nf.status?.ToLower() ?? "";

        if (s == "cancelled")
            return BadRequest(new { message = "This request has already been cancelled." });

        if (s == "done")
            return BadRequest(new { message = "This request has already been completed and cannot be deleted. Historical records are preserved." });

        // Check for active delivery
        var delivery = await GetActiveDeliveryForRequest(nf.id);

        if (delivery != null)
        {
            var ds = delivery.Status?.ToLower() ?? "";

            if (ds == "pickedup" || ds == "intransit" || ds == "receiverarrived")
                return BadRequest(new { message = $"This request cannot be deleted: the transporter has already picked up the food (Delivery status: {delivery.Status})." });

            if (ds == "delivered")
                return BadRequest(new { message = "The associated delivery has already been completed. Historical records are preserved." });

            // AwaitingTransporter, Accepted, or PickupPending — allow cancellation
            using var tx = await context.Database.BeginTransactionAsync();
            try
            {
                // 1. Cancel the FoodDelivery
                var oldDeliveryStatus = delivery.Status;
                delivery.Status = "Cancelled";
                delivery.CancelledAt = DateTime.UtcNow;
                delivery.CancellationReason = $"Cancelled by Receiver ({email}) via dashboard.";

                context.DeliveryStatusHistories.Add(new DeliveryStatusHistory(
                    delivery.Id, oldDeliveryStatus, "Cancelled", email, "Receiver",
                    $"Receiver cancelled food request (NeededFood Id: {nf.id})."));

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

                // 3. Cancel MatchedFood and restore donor Food to pending
                var matchedFood = await context.MatchedFoods.FirstOrDefaultAsync(m => m.NFID == nf.id);
                if (matchedFood != null)
                {
                    var donorFood = await context.Foods.FirstOrDefaultAsync(f => f.id == matchedFood.FID);
                    if (donorFood != null && donorFood.status == "Allocated")
                        donorFood.status = "pending";
                    context.MatchedFoods.Remove(matchedFood);
                }

                // 4. Soft-delete (mark as Cancelled)
                nf.status = "Cancelled";

                await context.SaveChangesAsync();
                await tx.CommitAsync();

                return Ok(new { message = "Food request cancelled successfully. The associated delivery has been cancelled and the donor's food has been returned to pending for re-matching." });
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
            var orphanMatch = await context.MatchedFoods.FirstOrDefaultAsync(m => m.NFID == nf.id);
            if (orphanMatch != null)
            {
                var donorFood = await context.Foods.FirstOrDefaultAsync(f => f.id == orphanMatch.FID);
                if (donorFood != null && donorFood.status == "Allocated")
                    donorFood.status = "pending";
                context.MatchedFoods.Remove(orphanMatch);
            }
            context.NeededFoods.Remove(nf);
            await context.SaveChangesAsync();
            return Ok(new { message = "Food request deleted successfully." });
        }

        if (s == "allocated")
        {
            using var tx = await context.Database.BeginTransactionAsync();
            try
            {
                var matchedFood = await context.MatchedFoods.FirstOrDefaultAsync(m => m.NFID == nf.id);
                if (matchedFood != null)
                {
                    var donorFood = await context.Foods.FirstOrDefaultAsync(f => f.id == matchedFood.FID);
                    if (donorFood != null && donorFood.status == "Allocated")
                        donorFood.status = "pending";
                    context.MatchedFoods.Remove(matchedFood);
                }
                nf.status = "Cancelled";
                await context.SaveChangesAsync();
                await tx.CommitAsync();
                return Ok(new { message = "Food request cancelled. The matched donor food has been returned to pending for re-matching." });
            }
            catch
            {
                await tx.RollbackAsync();
                throw;
            }
        }

        return BadRequest(new { message = $"Cannot delete request with status '{nf.status}'." });
    }

    // Helper: find an active (non-cancelled) FoodDelivery linked to a given NeededFood
    private async Task<FoodDelivery?> GetActiveDeliveryForRequest(int neededFoodId)
    {
        return await context.FoodDeliveries
            .Include(d => d.MatchedFood)
            .Where(d => d.MatchedFood != null && d.MatchedFood.NFID == neededFoodId && d.Status != "Cancelled")
            .OrderByDescending(d => d.CreatedAt)
            .FirstOrDefaultAsync();
    }
}