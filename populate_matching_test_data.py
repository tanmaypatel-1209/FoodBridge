import json
from datetime import datetime, timedelta

def build_test_sql():
    pwd_hash = "AQAAAAIAAYagAAAAEMeOMPuFZOYIT/yPdadIfQQ3l/YghrYr8FeJLWk8XBxtILwQNj5vqpmdB+SDSUVOYA=="
    
    now = datetime.now()
    # Baseline future time so wastfood never marks as NotMatched
    base_time = now.replace(minute=0, second=0, microsecond=0) + timedelta(hours=2)

    sql = []

    # Reset tables cleanly
    sql.append("""
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE DeliveryStatusHistories;
TRUNCATE TABLE FoodDeliveries;
TRUNCATE TABLE MatchedFoods;
TRUNCATE TABLE NeededFoods;
TRUNCATE TABLE Foods;
SET FOREIGN_KEY_CHECKS = 1;
""")

    # 1. Ensure 3 primary users exist with password '123456'
    sql.append(f"""
INSERT INTO Users (EmailID, Username, password, role, city)
VALUES 
    ('abc@gmail.com', 'Tanmay Patel (Donor)', '{pwd_hash}', 'Donor', 'Ahmedabad'),
    ('pqr@gmail.com', 'PQR Seva Trust (Receiver)', '{pwd_hash}', 'Receiver', 'Ahmedabad'),
    ('transporter@gmail.com', 'Amit Patel (Transporter)', '{pwd_hash}', 'Transporter', 'Ahmedabad')
ON DUPLICATE KEY UPDATE password='{pwd_hash}';
""")

    # 2. Add 100 structured test Foods for Donor (abc@gmail.com)
    # Cities: Ahmedabad (40), Nadiad (20), Surat (20), Vadodara (20)
    city_configs = [
        ("Ahmedabad", "Gujarat", [
            ("Near Vaishnodevi Circle, SG Highway", "Shivalik Business Hub"),
            ("Opposite Iscon Mega Mall, SG Highway", "Iscon Cross Roads"),
            ("Navrangpura Main Road", "Commerce Six Roads"),
            ("Prahlad Nagar Corporate Road", "Venus Atlantis"),
            ("Near Gota Flyover, SG Highway", "Gota Chowkdi")
        ], 40),
        ("Nadiad", "Gujarat", [
            ("Near Sardar Patel Bhavan, Santram Road", "Santram Mandir Road"),
            ("Near College Road", "Methodist Hospital Road"),
            ("Near Uttarsanda Crossings", "Expressway Toll Road")
        ], 20),
        ("Surat", "Gujarat", [
            ("Near Indoor Stadium, Athwa Lines", "Athwa Gate Circle"),
            ("VIP Road junction, Vesu", "Vesu Canal Corridor"),
            ("Near Ring Road Textile Market", "Ring Road Flyover")
        ], 20),
        ("Vadodara", "Gujarat", [
            ("Behind Vadodara Central Mall, Alkapuri", "Alkapuri Club Road"),
            ("Opposite MSU Arts Faculty, Sayajigunj", "Sayajigunj Station Road"),
            ("Near Karelibaug Water Tank", "Karelibaug Center")
        ], 20)
    ]

    food_names = [
        ("Fresh Vegetable Dum Biryani & Raita", ["Veg Biryani", "Mint Raita", "Papad"]),
        ("Dal Makhani with Jeera Basmati Rice", ["Dal Makhani", "Jeera Rice", "Sirka Pyaz"]),
        ("Traditional Gujarati Thali Meal Packs", ["Rotli (4 pcs)", "Gujarati Dal", "Shaak", "Rice"]),
        ("Paneer Butter Masala with Butter Naan", ["Paneer Butter Masala", "Butter Naan (2 pcs)"]),
        ("Amritsari Chole Bhature with Pickled Onions", ["Chole Gravy", "Bhature (2 pcs)", "Pickle"]),
        ("South Indian Idli Vada Sambar Combo", ["Idli (3 pcs)", "Medu Vada (2 pcs)", "Sambar"]),
        ("Khaman Dhokla & Khandvi Snack Box", ["Khaman Dhokla", "Khandvi Rolls", "Chutney"]),
        ("Mumbai Style Butter Pav Bhaji", ["Pav Bhaji Gravy", "Butter Pav (4 pcs)", "Onions"]),
        ("Punjabi Rajma Masala with Basmati Rice", ["Rajma Curry", "Basmati Rice", "Papad"]),
        ("Nutritious Moong Dal Khichdi & Kadhi", ["Khichdi", "Gujarati Kadhi", "Papad"])
    ]

    # Pre-calculated test quantity pairs for testing MatchFoodRequirement:
    # - Some with small surplus (m < 20): e.g., food 35 vs need 30 -> m=5 (direct match)
    # - Some with large surplus (m >= 20): e.g., food 60 vs need 30 -> m=30 (triggers split!)
    # - Some exact match: food 30 vs need 30 -> m=0
    test_quantities = [
        # (food_qty, need_qty)
        (35, 30),   # m = 5  (< 20, direct match)
        (60, 30),   # m = 30 (>= 20, split logic: 30 allocated, 30 remainder)
        (50, 45),   # m = 5  (< 20, direct match)
        (80, 50),   # m = 30 (>= 20, split logic: 50 allocated, 30 remainder)
        (40, 40),   # m = 0  (< 20, exact match)
        (75, 40),   # m = 35 (>= 20, split logic: 40 allocated, 35 remainder)
        (45, 40),   # m = 5  (< 20, direct match)
        (100, 60),  # m = 40 (>= 20, split logic: 60 allocated, 40 remainder)
        (55, 50),   # m = 5  (< 20, direct match)
        (90, 50),   # m = 40 (>= 20, split logic: 50 allocated, 40 remainder)
    ]

    food_id_counter = 0
    needed_id_counter = 0

    for city, state, locs, count in city_configs:
        for i in range(count):
            food_id_counter += 1
            needed_id_counter += 1

            loc, perf = locs[i % len(locs)]
            fname, fitems = food_names[i % len(food_names)]
            items_json = json.dumps(fitems).replace("'", "''")

            # Stagger time in 1-hour increments starting from base_time
            # For each index i, Food and NeededFood share EXACT SAME hour or within 30 mins!
            # (donationDateTime - requestDateTime) <= 0.5 hours <= 2 hours!
            t_offset = timedelta(hours=(i // 2) + 1, minutes=(30 if i % 2 == 1 else 0))
            food_time = (base_time + t_offset).strftime("%Y-%m-%d %H:%M:%S")
            needed_time = (base_time + t_offset).strftime("%Y-%m-%d %H:%M:%S")

            fq, nq = test_quantities[i % len(test_quantities)]

            # Insert Pending Food
            sql.append(f"""
INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', {fq}, '{fname}', '{items_json}', '{food_time}', 'pending', '{loc}', '{city}', '{state}', '{perf}');
""")

            # Insert Pending NeededFood
            shelter_name = f"Seva Relief Center {city} #{i+1}"
            needed_loc = f"{shelter_name}, {loc}"
            sql.append(f"""
INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', {nq}, '{needed_time}', 'pending', '{needed_loc}', '{city}', '{state}', '{perf}');
""")

    # 3. Add Transporter Deliveries & Status Histories
    # Add 12 realistic matched jobs for transporter@gmail.com
    # 5 AwaitingTransporter (available to accept)
    # 3 Accepted
    # 2 InTransit
    # 2 Delivered
    delivery_states = [
        ("AwaitingTransporter", None),
        ("AwaitingTransporter", None),
        ("AwaitingTransporter", None),
        ("AwaitingTransporter", None),
        ("AwaitingTransporter", None),
        ("Accepted", "transporter@gmail.com"),
        ("Accepted", "transporter@gmail.com"),
        ("Accepted", "transporter@gmail.com"),
        ("InTransit", "transporter@gmail.com"),
        ("InTransit", "transporter@gmail.com"),
        ("Delivered", "transporter@gmail.com"),
        ("Delivered", "transporter@gmail.com"),
    ]

    for d_idx, (d_status, trans_id) in enumerate(delivery_states, start=1):
        dt_str = (now - timedelta(hours=d_idx)).strftime("%Y-%m-%d %H:%M:%S")
        f_items_json = json.dumps(["Dal Makhani", "Jeera Rice", "Papad"]).replace("'", "''")

        sql.append(f"""
INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', 40, 'Ready Delivery Meal Box #{d_idx}', '{f_items_json}', '{dt_str}', 'Allocated', 'Near Vaishnodevi Circle', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_FID_{d_idx} = LAST_INSERT_ID();

INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', 40, '{dt_str}', 'Allocated', 'Santram Relief Center', 'Ahmedabad', 'Gujarat', 'Shivalik Hub');
SET @DEL_NFID_{d_idx} = LAST_INSERT_ID();

INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@DEL_FID_{d_idx}, 'abc@gmail.com', 40, '{dt_str}', 'Ahmedabad', 'Gujarat', 'Shivalik Hub', @DEL_NFID_{d_idx}, 'pqr@gmail.com', '{dt_str}', 40, 'Shivalik Hub');
SET @DEL_MFID_{d_idx} = LAST_INSERT_ID();
""")

        t_id_val = f"'{trans_id}'" if trans_id else "NULL"
        assigned_val = f"'{dt_str}'" if trans_id else "NULL"
        accepted_val = f"'{dt_str}'" if trans_id else "NULL"
        delivered_val = f"'{dt_str}'" if d_status == "Delivered" else "NULL"

        sql.append(f"""
INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@DEL_MFID_{d_idx}, 'abc@gmail.com', 'pqr@gmail.com', {t_id_val}, '{d_status}', '{dt_str}', {assigned_val}, {accepted_val}, {delivered_val});
SET @DEL_ID_{d_idx} = LAST_INSERT_ID();

INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_{d_idx}, 'Allocated', 'AwaitingTransporter', 'System', 'System', '{dt_str}', 'Order matched and ready for transporter.');
""")

        if trans_id:
            sql.append(f"""
INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_ID_{d_idx}, 'AwaitingTransporter', '{d_status}', '{trans_id}', 'Transporter', '{dt_str}', 'Status updated by transporter.');
""")

    return "\n".join(sql)

if __name__ == "__main__":
    sql_text = build_test_sql()
    with open("/media/tanmay/tanmay/FoodBridge/matching_test_data.sql", "w", encoding="utf-8") as f:
        f.write(sql_text)
    print("matching_test_data.sql generated successfully.")
