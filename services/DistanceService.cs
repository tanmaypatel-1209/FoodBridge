using System;

namespace FoodBridge.services
{
    /// <summary>
    /// Implements geographic distance calculation using the Haversine formula.
    ///
    /// Formula:
    ///   a = sin²((lat2-lat1)/2) + cos(lat1) × cos(lat2) × sin²((lon2-lon1)/2)
    ///   c = 2 × atan2(√a, √(1-a))
    ///   distance = EarthRadius × c
    ///
    /// Earth radius used: 6371 km
    ///
    /// IMPORTANT: Returns straight-line (as-the-crow-flies) distance.
    /// Actual road distance will typically be 20–40% greater.
    /// Display results as "~X km" or "Approx. X km", never as exact road distance.
    ///
    /// To switch to road distance later (e.g. Google Maps Distance Matrix),
    /// create a new class implementing IDistanceService and register it in Program.cs.
    /// </summary>
    public class DistanceService : IDistanceService
    {
        private const double EarthRadiusKm = 6371.0;

        /// <inheritdoc />
        public double CalculateDistanceKm(
            double latitude1, double longitude1,
            double latitude2, double longitude2)
        {
            // Convert degrees to radians
            var lat1Rad = DegreesToRadians(latitude1);
            var lat2Rad = DegreesToRadians(latitude2);
            var deltaLat = DegreesToRadians(latitude2 - latitude1);
            var deltaLon = DegreesToRadians(longitude2 - longitude1);

            var a = Math.Sin(deltaLat / 2) * Math.Sin(deltaLat / 2)
                  + Math.Cos(lat1Rad) * Math.Cos(lat2Rad)
                  * Math.Sin(deltaLon / 2) * Math.Sin(deltaLon / 2);

            var c = 2 * Math.Atan2(Math.Sqrt(a), Math.Sqrt(1 - a));

            return EarthRadiusKm * c;
        }

        private static double DegreesToRadians(double degrees)
            => degrees * Math.PI / 180.0;
    }
}
