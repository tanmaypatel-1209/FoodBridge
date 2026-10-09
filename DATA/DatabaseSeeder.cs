using FoodBridge.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Linq;

namespace FoodBridge.DATA
{
    public static class DatabaseSeeder
    {
        public static void Seed(FoodBridgeDB db)
        {
            // Ensure columns exist on Users table if upgrading an existing database without logging errors
            try
            {
                var cols = db.Database.SqlQueryRaw<string>(
                    "SELECT COLUMN_NAME AS Value FROM information_schema.COLUMNS WHERE TABLE_SCHEMA = DATABASE() AND TABLE_NAME = 'Users';"
                ).ToList();
                var set = new System.Collections.Generic.HashSet<string>(cols, System.StringComparer.OrdinalIgnoreCase);

                if (!set.Contains("PhoneNumber"))
                    db.Database.ExecuteSqlRaw("ALTER TABLE Users ADD COLUMN PhoneNumber LONGTEXT NULL;");
                if (!set.Contains("Address"))
                    db.Database.ExecuteSqlRaw("ALTER TABLE Users ADD COLUMN Address LONGTEXT NULL;");
                if (!set.Contains("State"))
                    db.Database.ExecuteSqlRaw("ALTER TABLE Users ADD COLUMN State LONGTEXT NULL;");
                if (!set.Contains("Pincode"))
                    db.Database.ExecuteSqlRaw("ALTER TABLE Users ADD COLUMN Pincode LONGTEXT NULL;");
            }
            catch { }

            // Hashed password for "123456"
            const string hashedPassword = "AQAAAAIAAYagAAAAEMeOMPuFZOYIT/yPdadIfQQ3l/YghrYr8FeJLWk8XBxtILwQNj5vqpmdB+SDSUVOYA==";

            if (!db.Users.Any())
            {
                var donor = new User("Tanmay Patel (Donor)", "abc@gmail.com", hashedPassword, "Donor", "Ahmedabad")
                {
                    PhoneNumber = "9876543210",
                    Address = "Near Vaishnodevi Circle, SG Highway",
                    State = "Gujarat",
                    Pincode = "382421"
                };
                var receiver = new User("PQR Seva Trust (Receiver)", "pqr@gmail.com", hashedPassword, "Receiver", "Nadiad")
                {
                    PhoneNumber = "9123456780",
                    Address = "Santram Bal Ashram Road, Near Mandir",
                    State = "Gujarat",
                    Pincode = "387001"
                };
                var transporter = new User("Amit Patel (Transporter)", "transporter@gmail.com", hashedPassword, "Transporter", "Ahmedabad")
                {
                    PhoneNumber = "9988776655",
                    Address = "Commerce Six Roads, Navrangpura",
                    State = "Gujarat",
                    Pincode = "380009",
                    AvailabilityStatus = "Available",
                    Latitude = 23.0338,
                    Longitude = 72.5540,
                    LastLocationUpdatedAt = DateTime.UtcNow
                };

                db.Users.AddRange(donor, receiver, transporter);
                db.SaveChanges();

                var foods = new[]
                {
                    new Food("abc@gmail.com", 45, "Fresh Vegetable Dum Biryani & Raita", new[] {"Vegetable Dum Biryani","Cucumber Mint Raita","Roasted Papad"}, DateTime.Now.AddHours(-2), "available", "Near Vaishnodevi Circle, SG Highway, Ahmedabad, Gujarat", "Ahmedabad", "Gujarat", "Shivalik Business Hub, SG Highway"),
                    new Food("abc@gmail.com", 60, "Dal Makhani with Jeera Basmati Rice", new[] {"Dal Makhani","Jeera Basmati Rice","Sirka Pyaz","Papad"}, DateTime.Now.AddHours(-3), "available", "Behind Vadodara Central Mall, Alkapuri, Vadodara, Gujarat", "Vadodara", "Gujarat", "Alkapuri Club Road, Opposite Express Hotel"),
                    new Food("abc@gmail.com", 80, "Traditional Gujarati Thali Meal Packs", new[] {"Phulka Roti (4 pcs)","Gujarati Dal","Bhindu Sambharo","Steamed Rice","Mohanthal"}, DateTime.Now.AddHours(-4), "claimed", "Opposite Iscon Mega Mall, SG Highway, Ahmedabad, Gujarat", "Ahmedabad", "Gujarat", "Iscon Cross Roads, SG Highway"),
                    new Food("abc@gmail.com", 35, "Paneer Butter Masala with Butter Naan", new[] {"Paneer Butter Masala","Butter Tandoori Naan","Mixed Green Salad"}, DateTime.Now.AddHours(-1), "available", "Near Indoor Stadium, Athwa Lines, Surat, Gujarat", "Surat", "Gujarat", "Athwa Gate Circle, Ghod Dod Road"),
                    new Food("abc@gmail.com", 50, "Amritsari Chole Bhature with Pickled Onions", new[] {"Amritsari Chole","Fresh Fluffy Bhature (2 pcs)","Mint Chutney","Pickled Chilli"}, DateTime.Now.AddHours(-5), "completed", "Near Infocity Club & Resort, Sector 0, Gandhinagar, Gujarat", "Gandhinagar", "Gujarat", "Infocity IT Tower 2, Sector 0"),
                    new Food("abc@gmail.com", 65, "South Indian Breakfast Combo (Idli & Vada)", new[] {"Steamed Idli (3 pcs)","Medu Vada (2 pcs)","Vegetable Sambar","Coconut Chutney"}, DateTime.Now.AddHours(-6), "delivered", "Opposite Ahmedabad University Campus, Navrangpura, Ahmedabad, Gujarat", "Ahmedabad", "Gujarat", "Commerce Six Roads, Navrangpura"),
                    new Food("abc@gmail.com", 40, "Fresh Steamed Khaman Dhokla & Khandvi", new[] {"Khaman Dhokla","Spiced Khandvi Roll","Papaya Sambharo","Sweet Kadhi"}, DateTime.Now.AddHours(-2), "available", "Near Sardar Patel Bhavan, Santram Road, Nadiad, Gujarat", "Nadiad", "Gujarat", "Santram Mandir Road"),
                    new Food("abc@gmail.com", 70, "Mumbai Style Butter Pav Bhaji", new[] {"Butter Pav Bhaji Gravy","Toasted Butter Pav (4 pcs)","Lemon Wedges","Diced Onions"}, DateTime.Now.AddHours(-7), "completed", "Opposite MSU Arts Faculty, Sayajigunj, Vadodara, Gujarat", "Vadodara", "Gujarat", "Sayajigunj Near Railway Station Gate 3"),
                    new Food("abc@gmail.com", 55, "Punjabi Rajma Masala with Basmati Rice", new[] {"Punjabi Rajma Gravy","Steamed Basmati Rice","Kachumber Salad","Roasted Papad"}, DateTime.Now.AddHours(-1), "available", "Near Venus Atlantis, Corporate Road, Prahlad Nagar, Ahmedabad, Gujarat", "Ahmedabad", "Gujarat", "Prahlad Nagar Corporate Road"),
                    new Food("abc@gmail.com", 90, "Assorted Fresh Bakery Breads & Dinner Rolls", new[] {"Whole Wheat Sandwich Loaves","Dinner Butter Rolls","Multigrain Breads"}, DateTime.Now.AddHours(-3), "available", "VIP Road junction, Vesu, Surat, Gujarat", "Surat", "Gujarat", "Vesu Canal Corridor, Near GD Goenka School")
                };

                db.Foods.AddRange(foods);

                var neededFoods = new[]
                {
                    new NeededFood("pqr@gmail.com", 60, DateTime.Now.AddHours(2), "Santram Bal Ashram Trust, Santram Road, Nadiad, Gujarat", "Nadiad", "Gujarat", "Santram Bal Ashram, Santram Road Gate 1"),
                    new NeededFood("pqr@gmail.com", 120, DateTime.Now.AddHours(3), "Near SG Highway Flyover, Gota, Ahmedabad, Gujarat", "Ahmedabad", "Gujarat", "Metro Construction Labor Camp, Gota Chowkdi"),
                    new NeededFood("pqr@gmail.com", 40, DateTime.Now.AddHours(1), "Near Karelibaug Water Tank, Vadodara, Gujarat", "Vadodara", "Gujarat", "Vrundavan Vruddhashram, Karelibaug Road"),
                    new NeededFood("pqr@gmail.com", 85, DateTime.Now.AddHours(4), "Behind Community Health Center, Pandesara, Surat, Gujarat", "Surat", "Gujarat", "Pandesara GIDC Community Study Center"),
                    new NeededFood("pqr@gmail.com", 75, DateTime.Now.AddHours(5), "Opposite Kalupur Railway Station West Gate, Ahmedabad, Gujarat", "Ahmedabad", "Gujarat", "Rain Basera Night Shelter, Kalupur")
                };

                db.NeededFoods.AddRange(neededFoods);
                db.SaveChanges();
            }
            else
            {
                // Ensure Transporter user exists
                if (!db.Users.Any(u => u.EmailID == "transporter@gmail.com"))
                {
                    var transporter = new User("Amit Patel (Transporter)", "transporter@gmail.com", hashedPassword, "Transporter", "Ahmedabad");
                    db.Users.Add(transporter);
                }

                // Backfill profile details for existing seed accounts if empty
                var uDonor = db.Users.FirstOrDefault(u => u.EmailID == "abc@gmail.com");
                if (uDonor != null && string.IsNullOrWhiteSpace(uDonor.PhoneNumber))
                {
                    uDonor.PhoneNumber = "9876543210";
                    uDonor.Address = "Near Vaishnodevi Circle, SG Highway";
                    uDonor.State = "Gujarat";
                    uDonor.Pincode = "382421";
                }

                var uRecv = db.Users.FirstOrDefault(u => u.EmailID == "pqr@gmail.com");
                if (uRecv != null && string.IsNullOrWhiteSpace(uRecv.PhoneNumber))
                {
                    uRecv.PhoneNumber = "9123456780";
                    uRecv.Address = "Santram Bal Ashram Road, Near Mandir";
                    uRecv.State = "Gujarat";
                    uRecv.Pincode = "387001";
                }

                var uTrans = db.Users.FirstOrDefault(u => u.EmailID == "transporter@gmail.com");
                if (uTrans != null && string.IsNullOrWhiteSpace(uTrans.PhoneNumber))
                {
                    uTrans.PhoneNumber = "9988776655";
                    uTrans.Address = "Commerce Six Roads, Navrangpura";
                    uTrans.State = "Gujarat";
                    uTrans.Pincode = "380009";
                    if (uTrans.Latitude == null || uTrans.Longitude == null)
                    {
                        uTrans.Latitude = 23.0338;
                        uTrans.Longitude = 72.5540;
                        uTrans.LastLocationUpdatedAt = DateTime.UtcNow;
                    }
                }
                db.SaveChanges();
            }

            // Seed sample MatchedFood and FoodDeliveries if none exist
            if (!db.FoodDeliveries.Any())
            {
                var donorUser = db.Users.FirstOrDefault(u => u.EmailID == "abc@gmail.com");
                var receiverUser = db.Users.FirstOrDefault(u => u.EmailID == "pqr@gmail.com");
                var transporterUser = db.Users.FirstOrDefault(u => u.EmailID == "transporter@gmail.com");

                if (donorUser != null && receiverUser != null)
                {
                    // 1. AwaitingTransporter delivery
                    var food1 = new Food(
                        "abc@gmail.com", 30, "Nutritious Khichdi & Kadhi Packets",
                        new[] { "Moong Dal Khichdi", "Kadhi", "Papad" },
                        DateTime.Now.AddMinutes(-30), "Allocated",
                        "Near Vaishnodevi Circle, SG Highway, Ahmedabad", "Ahmedabad", "Gujarat", "Vaishnodevi Circle"
                    );
                    db.Foods.Add(food1);

                    var needed1 = new NeededFood(
                        "pqr@gmail.com", 30, DateTime.Now.AddMinutes(45),
                        "Near Gota Flyover, SG Highway, Ahmedabad", "Ahmedabad", "Gujarat", "Gota Community Shelter"
                    ) { status = "Allocated" };
                    db.NeededFoods.Add(needed1);
                    db.SaveChanges();

                    var match1 = new MatchedFood(
                        food1.id, food1.emailID, food1.quntity, food1.donationDateTime,
                        food1.city, food1.state, food1.perfectLocation,
                        needed1.id, needed1.emailID, needed1.requestDateTime,
                        needed1.quntity, needed1.perfectLocation
                    );
                    db.MatchedFoods.Add(match1);
                    db.SaveChanges();

                    var del1 = new FoodDelivery(match1.id, food1.emailID, needed1.emailID)
                    {
                        Status = "AwaitingTransporter",
                        CreatedAt = DateTime.UtcNow.AddMinutes(-25)
                    };
                    db.FoodDeliveries.Add(del1);
                    db.SaveChanges();

                    db.DeliveryStatusHistories.Add(new DeliveryStatusHistory(
                        del1.Id, "Allocated", "AwaitingTransporter", "System", "System",
                        "Matched successfully. Ready for transporter acceptance."
                    ));

                    // 2. PickupPending delivery (Transporter arrived at Donor, waiting for Donor handover confirmation!)
                    var food2 = new Food(
                        "abc@gmail.com", 50, "Puri Bhaji & Sweet Ladoo Meals",
                        new[] { "Aloo Bhaji", "Puri (4 pcs)", "Besan Ladoo" },
                        DateTime.Now.AddHours(-1), "Allocated",
                        "Navrangpura Main Road, Ahmedabad", "Ahmedabad", "Gujarat", "Commerce Six Roads"
                    );
                    db.Foods.Add(food2);

                    var needed2 = new NeededFood(
                        "pqr@gmail.com", 50, DateTime.Now.AddMinutes(30),
                        "Paldi Cross Roads, Ahmedabad", "Ahmedabad", "Gujarat", "Paldi Night Shelter"
                    ) { status = "Allocated" };
                    db.NeededFoods.Add(needed2);
                    db.SaveChanges();

                    var match2 = new MatchedFood(
                        food2.id, food2.emailID, food2.quntity, food2.donationDateTime,
                        food2.city, food2.state, food2.perfectLocation,
                        needed2.id, needed2.emailID, needed2.requestDateTime,
                        needed2.quntity, needed2.perfectLocation
                    );
                    db.MatchedFoods.Add(match2);
                    db.SaveChanges();

                    var del2 = new FoodDelivery(match2.id, food2.emailID, needed2.emailID)
                    {
                        TransporterId = "transporter@gmail.com",
                        Status = "PickupPending",
                        CreatedAt = DateTime.UtcNow.AddMinutes(-40),
                        AssignedAt = DateTime.UtcNow.AddMinutes(-35),
                        AcceptedAt = DateTime.UtcNow.AddMinutes(-35),
                        PickupArrivedAt = DateTime.UtcNow.AddMinutes(-5)
                    };
                    db.FoodDeliveries.Add(del2);
                    db.SaveChanges();

                    db.DeliveryStatusHistories.AddRange(
                        new DeliveryStatusHistory(del2.Id, "Allocated", "AwaitingTransporter", "System", "System", "Match initialized."),
                        new DeliveryStatusHistory(del2.Id, "AwaitingTransporter", "Accepted", "transporter@gmail.com", "Transporter", "Transporter accepted delivery."),
                        new DeliveryStatusHistory(del2.Id, "Accepted", "PickupPending", "transporter@gmail.com", "Transporter", "Transporter has arrived at Donor pickup location.")
                    );

                    // 3. ReceiverArrived delivery (Transporter arrived at Receiver, waiting for Receiver receipt confirmation!)
                    var food3 = new Food(
                        "abc@gmail.com", 40, "Dal Baati & Churma Special",
                        new[] { "Dal", "Baati (3 pcs)", "Churma" },
                        DateTime.Now.AddHours(-2), "Allocated",
                        "Satellite Road, Ahmedabad", "Ahmedabad", "Gujarat", "Star Bazaar Area"
                    );
                    db.Foods.Add(food3);

                    var needed3 = new NeededFood(
                        "pqr@gmail.com", 40, DateTime.Now.AddMinutes(15),
                        "Vastrapur Lake East, Ahmedabad", "Ahmedabad", "Gujarat", "Vastrapur Orphanage"
                    ) { status = "Allocated" };
                    db.NeededFoods.Add(needed3);
                    db.SaveChanges();

                    var match3 = new MatchedFood(
                        food3.id, food3.emailID, food3.quntity, food3.donationDateTime,
                        food3.city, food3.state, food3.perfectLocation,
                        needed3.id, needed3.emailID, needed3.requestDateTime,
                        needed3.quntity, needed3.perfectLocation
                    );
                    db.MatchedFoods.Add(match3);
                    db.SaveChanges();

                    var del3 = new FoodDelivery(match3.id, food3.emailID, needed3.emailID)
                    {
                        TransporterId = "transporter@gmail.com",
                        Status = "ReceiverArrived",
                        CreatedAt = DateTime.UtcNow.AddHours(-1),
                        AssignedAt = DateTime.UtcNow.AddMinutes(-50),
                        AcceptedAt = DateTime.UtcNow.AddMinutes(-50),
                        PickupArrivedAt = DateTime.UtcNow.AddMinutes(-35),
                        PickupConfirmedAt = DateTime.UtcNow.AddMinutes(-30),
                        PickedUpAt = DateTime.UtcNow.AddMinutes(-30),
                        InTransitAt = DateTime.UtcNow.AddMinutes(-25),
                        ReceiverArrivedAt = DateTime.UtcNow.AddMinutes(-5)
                    };
                    db.FoodDeliveries.Add(del3);
                    db.SaveChanges();

                    db.DeliveryStatusHistories.AddRange(
                        new DeliveryStatusHistory(del3.Id, "Allocated", "AwaitingTransporter", "System", "System", "Match initialized."),
                        new DeliveryStatusHistory(del3.Id, "AwaitingTransporter", "Accepted", "transporter@gmail.com", "Transporter", "Transporter accepted delivery."),
                        new DeliveryStatusHistory(del3.Id, "Accepted", "PickupPending", "transporter@gmail.com", "Transporter", "Arrived at pickup."),
                        new DeliveryStatusHistory(del3.Id, "PickupPending", "PickedUp", "abc@gmail.com", "Donor", "Donor confirmed handover."),
                        new DeliveryStatusHistory(del3.Id, "PickedUp", "InTransit", "transporter@gmail.com", "Transporter", "Transporter in transit."),
                        new DeliveryStatusHistory(del3.Id, "InTransit", "ReceiverArrived", "transporter@gmail.com", "Transporter", "Transporter has arrived at Receiver location.")
                    );

                    db.SaveChanges();
                }
            }
        }
    }
}
