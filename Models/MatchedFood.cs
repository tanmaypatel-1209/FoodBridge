using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace FoodBridge.Models
{
    public class MatchedFood{
        [Key]
        public int id { get; set; }

        public int FID{get;set;}
        [EmailAddress]
        public string DonorId { get; set; }
        public int Providedquntity { get; set; }
        public DateTime? donationDateTime { get; set; }
        public string? city { get; set; }
        public string? state { get; set; }
        public string? fromperfectLocation { get; set; }

        public int NFID{get;set;}
        [EmailAddress]
        public string ReceiverId { get; set; }
        public DateTime? requestDateTime { get; set; }
        public int Neededquntity { get; set; }
        public string? toperfectLocation { get; set; }

        public MatchedFood()
        {
        }

        public MatchedFood(int fid, string donorId, int providedquntity, DateTime? donationDateTime, string? city, string? state, string? fromperfectLocation, int nfid, string receiverId, DateTime? requestDateTime, int neededquntity, string? toperfectLocation)
        {
            FID = fid;
            DonorId = donorId;
            Providedquntity = providedquntity;
            this.donationDateTime = donationDateTime;
            this.city = city;
            this.state = state;
            this.fromperfectLocation = fromperfectLocation;
            NFID = nfid;
            ReceiverId = receiverId;
            this.requestDateTime = requestDateTime;
            Neededquntity = neededquntity;
            this.toperfectLocation = toperfectLocation;
        }

        public MatchedFood(string donorId, int providedquntity, DateTime? donationDateTime, string? city, string? state, string? fromperfectLocation, string receiverId, DateTime? requestDateTime, int neededquntity, string? toperfectLocation)
        {
            DonorId = donorId;
            Providedquntity = providedquntity;
            this.donationDateTime = donationDateTime;
            this.city = city;
            this.state = state;
            this.fromperfectLocation = fromperfectLocation;
            ReceiverId = receiverId;
            this.requestDateTime = requestDateTime;
            Neededquntity = neededquntity;
            this.toperfectLocation = toperfectLocation;
        }
    }
}