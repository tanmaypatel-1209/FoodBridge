using System.Collections.Generic;
using System.Security.Claims;
using System.Threading.Tasks;
using FoodBridge.DTOs;
using FoodBridge.services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace FoodBridge.Controllers
{
    [Route("Transporter")]
    [Authorize(Roles = "Transporter")]
    [ApiController]
    public class TransporterController : ControllerBase
    {
        private readonly DeliveryService _deliveryService;

        public TransporterController(DeliveryService deliveryService)
        {
            _deliveryService = deliveryService;
        }

        private string? GetCurrentEmail()
        {
            return User.FindFirstValue(ClaimTypes.Email) 
                ?? User.FindFirstValue("http://schemas.xmlsoap.org/ws/2005/05/identity/claims/emailaddress")
                ?? User.FindFirstValue(ClaimTypes.NameIdentifier);
        }

        [HttpGet("available")]
        public async Task<ActionResult<List<DeliveryJobDTO>>> GetAvailableDeliveries()
        {
            var deliveries = await _deliveryService.GetAvailableDeliveriesAsync();
            return Ok(deliveries);
        }

        [HttpGet("my-deliveries")]
        public async Task<ActionResult<List<DeliveryJobDTO>>> GetMyDeliveries()
        {
            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email)) return Unauthorized("Invalid user identity.");

            var deliveries = await _deliveryService.GetTransporterDeliveriesAsync(email);
            return Ok(deliveries);
        }

        [HttpGet("deliveries/{id}")]
        public async Task<ActionResult<DeliveryJobDTO>> GetDeliveryById(int id)
        {
            var delivery = await _deliveryService.GetDeliveryByIdAsync(id);
            if (delivery == null) return NotFound("Delivery not found.");

            return Ok(delivery);
        }

        [HttpPost("deliveries/{id}/accept")]
        public async Task<ActionResult<object>> AcceptDelivery(int id)
        {
            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email)) return Unauthorized("Invalid user identity.");

            var result = await _deliveryService.AcceptDeliveryAsync(id, email);
            if (!result.Success)
            {
                return BadRequest(new { message = result.Message });
            }

            return Ok(new { message = result.Message, delivery = result.Delivery });
        }

        [HttpPost("deliveries/{id}/arrived-pickup")]
        public async Task<ActionResult<object>> MarkArrivedPickup(int id)
        {
            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email)) return Unauthorized("Invalid user identity.");

            var result = await _deliveryService.MarkPickupArrivedAsync(id, email);
            if (!result.Success)
            {
                return BadRequest(new { message = result.Message });
            }

            return Ok(new { message = result.Message, delivery = result.Delivery });
        }

        [HttpPost("deliveries/{id}/start")]
        public async Task<ActionResult<object>> StartTransit(int id)
        {
            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email)) return Unauthorized("Invalid user identity.");

            var result = await _deliveryService.StartTransitAsync(id, email);
            if (!result.Success)
            {
                return BadRequest(new { message = result.Message });
            }

            return Ok(new { message = result.Message, delivery = result.Delivery });
        }

        [HttpPost("deliveries/{id}/arrived-receiver")]
        public async Task<ActionResult<object>> MarkArrivedReceiver(int id)
        {
            var email = GetCurrentEmail();
            if (string.IsNullOrEmpty(email)) return Unauthorized("Invalid user identity.");

            var result = await _deliveryService.MarkReceiverArrivedAsync(id, email);
            if (!result.Success)
            {
                return BadRequest(new { message = result.Message });
            }

            return Ok(new { message = result.Message, delivery = result.Delivery });
        }
    }
}
