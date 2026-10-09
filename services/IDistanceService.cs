namespace FoodBridge.services
{
    /// <summary>
    /// Provides geographic distance calculations between coordinate pairs.
    /// The interface is designed to allow future replacement of Haversine
    /// with a routing provider (e.g. Google Maps Distance Matrix API).
    /// </summary>
    public interface IDistanceService
    {
        /// <summary>
        /// Calculates the straight-line (as-the-crow-flies) distance in kilometres
        /// between two geographic coordinates using the Haversine formula.
        /// NOTE: This is an approximation. Actual road distance may be greater.
        /// </summary>
        double CalculateDistanceKm(double latitude1, double longitude1,
                                   double latitude2, double longitude2);
    }
}
