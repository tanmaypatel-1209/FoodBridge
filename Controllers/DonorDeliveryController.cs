using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using FoodBridge.DTOs;
using FoodBridge.services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace FoodBridge.Controllers
{
    [Route("Donor/deliveries")]
    [Authorize(Roles = "Donor")]
    [ApiController]
    public class DonorDeliveryController : ControllerBase
    {
        private readonly DeliveryService _deliveryService;

        public DonorDeliveryController(DeliveryService deliveryService)
        {
            _deliveryService = deliveryService;
        }

        private string? GetCurrentEmail()
        {
            return User.FindFirstValue(ClaimTypes.Email) 
                ?? User.FindFirstValue("http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress")
                ?? User.FindFirstValue(ClaimTypes.NameIdentifier);
        }

        [HttpGet]
        public async Task<ActionResult<List<DeliveryJobDTO>>> GetDonorDeliveries()
        {
            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email)) return Unauthorized("Invalid user identity.");

            var deliveries = await _deliveryService.GetDonorDeliveriesAsync(email);
            return Ok(deliveries);
        }

        [HttpGet("{id}")]
        public async Task<ActionResult<DeliveryJobDTO>> GetDeliveryById(int id)
        {
            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email)) return Unauthorized("Invalid user identity.");

            var delivery = await _deliveryService.GetDeliveryByIdAsync(id);
            if (delivery == null) return NotFound("Delivery not found.");

            if (delivery.DonorId != email)
            {
                return Forbid("You do not have access to this delivery.");
            }

            return Ok(delivery);
        }

        [HttpPost("{id}/confirm-handover")]
        public async Task<ActionResult<object>> ConfirmHandover(int id, [FromBody] ConfirmHandoverDTO? dto)
        {
            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email)) return Unauthorized("Invalid user identity.");

            var result = await _deliveryService.ConfirmDonorHandoverAsync(id, email, dto?.Notes);
            if (!result.Success)
            {
                return BadRequest(new { message = result.Message });
            }

            return Ok(new { message = result.Message, delivery = result.Delivery });
        }
    }
}
