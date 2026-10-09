using System.Threading.Tasks;
using FoodBridge.services;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace FoodBridge.Controllers
{
    /// <summary>
    /// Provides endpoints for distance-based Transporter matching.
    ///
    /// Route: /TransporterMatching
    ///
    /// Architecture:
    ///   Controller → TransporterMatchingService → IDistanceService → Database
    /// </summary>
    [Route("TransporterMatching")]
    [ApiController]
    public class TransporterMatchingController : ControllerBase
    {
        private readonly TransporterMatchingService _matchingService;

        public TransporterMatchingController(TransporterMatchingService matchingService)
        {
            _matchingService = matchingService;
        }

        /// <summary>
        /// GET /TransporterMatching/nearby/{deliveryId}
        ///
        /// Returns available Transporters ranked nearest-first to the Donor pickup
        /// location of the specified delivery.
        ///
        /// - Requires Admin or Donor role (admins for management; donors to see options).
        /// - Uses DefaultRadiusKm from config unless ?radiusKm= is supplied.
        /// - Transporters with stale location or active deliveries are excluded.
        /// - Exact Transporter coordinates are NEVER returned; only distances.
        /// </summary>
        [HttpGet("nearby/{deliveryId:int}")]
        [Authorize]
        public async Task<ActionResult> GetNearbyTransporters(
            int deliveryId,
            [FromQuery] double? radiusKm = null)
        {
            var (success, error, result) = await _matchingService.GetNearbyTransportersAsync(deliveryId, radiusKm);

            if (!success)
            {
                // Map known error messages to appropriate HTTP status codes
                if (error != null && error.Contains("not found"))
                    return NotFound(new { message = error });

                if (error != null && error.Contains("already been assigned"))
                    return Conflict(new { message = error });

                if (error != null && error.Contains("coordinates are unavailable"))
                    return UnprocessableEntity(new { message = error });

                if (error != null && error.Contains("No available") || (error != null && error.Contains("No Transporters")))
                    return Ok(new { message = error, transporters = System.Array.Empty<object>() });

                return BadRequest(new { message = error });
            }

            return Ok(result);
        }
    }
}
