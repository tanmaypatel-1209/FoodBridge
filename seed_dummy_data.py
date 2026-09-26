import json
import random
from datetime import datetime, timedelta

def generate_seed_sql():
    cities_locations = [
        ("Ahmedabad", "Gujarat", [
            ("Near Vaishnodevi Circle, SG Highway", "Shivalik Business Hub, SG Highway"),
            ("Opposite Iscon Mega Mall, SG Highway", "Iscon Cross Roads, SG Highway"),
            ("Opposite Ahmedabad University Campus, Navrangpura", "Commerce Six Roads, Navrangpura"),
            ("Near Venus Atlantis, Corporate Road, Prahlad Nagar", "Prahlad Nagar Corporate Road"),
            ("Near Gota Flyover, SG Highway", "Gota Community Labor Camp"),
            ("Near C.G. Road Crossings, Navrangpura", "Supermall, C.G. Road"),
            ("Near Shyamal Cross Roads, Satellite", "Shyamal Row Houses, Satellite"),
            ("Near Kankaria Lake Gate 3, Maninagar", "Kankaria Lake Front, Maninagar"),
            ("Near Vastrapur Lake, Vastrapur", "Alpha One Mall, Vastrapur"),
            ("Near Chandkheda Bus Terminal, Chandkheda", "Tragad Road, Chandkheda"),
            ("Near Bopal Cross Roads, South Bopal", "Sobha Dream Acres, South Bopal"),
            ("Opposite Kalupur Railway Station, Kalupur", "Rain Basera Shelter, Kalupur Gate 2")
        ]),
        ("Vadodara", "Gujarat", [
            ("Behind Vadodara Central Mall, Alkapuri", "Alkapuri Club Road, Opposite Express Hotel"),
            ("Opposite MSU Arts Faculty, Sayajigunj", "Sayajigunj Near Railway Station Gate 3"),
            ("Near Karelibaug Water Tank, Karelibaug", "Vrundavan Vruddhashram, Karelibaug"),
            ("Near Akshar Chowk, Old Padra Road", "Akshar Pavilion, Old Padra Road"),
            ("Near Manjalpur Naka, Manjalpur", "Manjalpur Sports Complex Gate"),
            ("Near Fatehgunj Main Post Office, Fatehgunj", "Fatehgunj Flyover Circle"),
            ("Near Gotri Medical College, Gotri", "Gotri Road Community Center")
        ]),
        ("Surat", "Gujarat", [
            ("Near Indoor Stadium, Athwa Lines", "Athwa Gate Circle, Ghod Dod Road"),
            ("VIP Road junction, Vesu", "Vesu Canal Corridor, Near GD Goenka School"),
            ("Behind Community Health Center, Pandesara", "Pandesara GIDC Community Center"),
            ("Near Textile Market Gate 1, Ring Road", "Ring Road Flyover Junction"),
            ("Near Varachha Main Road, Varachha", "Mini Bazar Cross Roads, Varachha"),
            ("Near Adajan Star Bazar, Adajan", "LP Savani Road, Adajan"),
            ("Near Pal RTO, Pal", "Pal Gam Community Hall")
        ]),
        ("Rajkot", "Gujarat", [
            ("Near Yagnik Road, Jagnath Plot", "Imperial Palace Road, Yagnik Road"),
            ("Near Kalawad Road Crossings, Kalawad Road", "Kotecha Chowk, Kalawad Road"),
            ("Near Madhapar Chowkadi, 150 Feet Ring Road", "Madhapar Flyover Circle"),
            ("Near Indira Circle, University Road", "University Road Bus Stop"),
            ("Near Gondal Road ST Workshop, Gondal Road", "Malaviya Chowk, Gondal Road")
        ]),
        ("Gandhinagar", "Gujarat", [
            ("Near Infocity Club & Resort, Sector 0", "Infocity IT Tower 2, Sector 0"),
            ("Near Gh-5 Circle, Sector 16", "Sector 16 Government Colony Community Hall"),
            ("Near CH-3 Circle, Sector 21", "Sector 21 Shopping Center Ground"),
            ("Near Reliance Cross Roads, Kudasan", "Kudasan Main Road, Gandhinagar"),
            ("Near Bhaijipura Cross Roads, PDPU Road", "PDPU Campus Road, Raysan")
        ]),
        ("Nadiad", "Gujarat", [
            ("Near Sardar Patel Bhavan, Santram Road", "Santram Mandir Road"),
            ("Santram Bal Ashram Trust, Santram Road", "Santram Bal Ashram Gate 1"),
            ("Near College Road, Christian Society", "Methodist Mission Hospital Road"),
            ("Near Uttarsanda Road Crossings", "Expressway Toll Approach Road")
        ]),
        ("Anand", "Gujarat", [
            ("Near Amul Dairy Campus, Amul Dairy Road", "Amul Circle, Anand"),
            ("Near IRMA Campus, Anand-Vidyanagar Road", "Bhaikaka Statue, Vallabh Vidyanagar"),
            ("Near Town Hall, Station Road", "Anand Railway Station West Gate"),
            ("Near Borsad Chowkadi, Anand", "Borsad Highway Junction")
        ])
    ]

    food_catalog = [
        ("Fresh Vegetable Dum Biryani & Raita", ["Vegetable Dum Biryani", "Cucumber Mint Raita", "Roasted Papad"]),
        ("Dal Makhani with Jeera Basmati Rice", ["Dal Makhani", "Jeera Basmati Rice", "Sirka Pyaz", "Papad"]),
        ("Traditional Gujarati Thali Meal Packs", ["Phulka Roti (4 pcs)", "Gujarati Dal", "Bhindu Sambharo", "Steamed Rice", "Mohanthal"]),
        ("Paneer Butter Masala with Butter Naan", ["Paneer Butter Masala", "Butter Tandoori Naan (2 pcs)", "Green Salad"]),
        ("Amritsari Chole Bhature with Pickled Onions", ["Amritsari Chole", "Fluffy Bhature (2 pcs)", "Mint Chutney", "Pickled Chilli"]),
        ("South Indian Breakfast Combo (Idli & Vada)", ["Steamed Idli (3 pcs)", "Medu Vada (2 pcs)", "Vegetable Sambar", "Coconut Chutney"]),
        ("Fresh Steamed Khaman Dhokla & Khandvi", ["Khaman Dhokla", "Spiced Khandvi Roll", "Papaya Sambharo", "Sweet Kadhi"]),
        ("Mumbai Style Butter Pav Bhaji", ["Butter Pav Bhaji Gravy", "Toasted Butter Pav (4 pcs)", "Lemon Wedges", "Diced Onions"]),
        ("Punjabi Rajma Masala with Basmati Rice", ["Punjabi Rajma Gravy", "Steamed Basmati Rice", "Kachumber Salad", "Roasted Papad"]),
        ("Assorted Fresh Bakery Breads & Dinner Rolls", ["Whole Wheat Sandwich Loaves", "Dinner Butter Rolls", "Multigrain Breads"]),
        ("Kathiyawadi Sev Tameta & Bajra Rotla", ["Sev Tameta Nu Shaak", "Bajra No Rotlo (2 pcs)", "Garlic Chutney", "Gud & Ghee"]),
        ("Palak Paneer with Tandoori Butter Roti", ["Palak Paneer Gravy", "Tandoori Butter Roti (3 pcs)", "Onion Salad"]),
        ("Aloo Gobi Matar with Phulka Rotis", ["Aloo Gobi Matar", "Phulka Roti (5 pcs)", "Moong Dal", "Cucumber Salad"]),
        ("Nutritious Moong Dal Khichdi & Gujarati Kadhi", ["Moong Dal Khichdi", "Sweet & Sour Kadhi", "Fried Papad", "Achar"]),
        ("Puri Bhaji with Suji Kesari Halwa", ["Aloo Bhaji Gravy", "Hot Puris (5 pcs)", "Suji Kesari Halwa"]),
        ("Veg Hakka Noodles with Veg Manchurian", ["Veg Hakka Noodles", "Veg Manchurian Dry (4 pcs)", "Chilli Garlic Sauce"]),
        ("Veg Fried Rice with Manchurian Gravy", ["Veg Fried Rice", "Vegetable Manchurian Gravy", "Crispy Noodles"]),
        ("Matar Paneer with Jeera Rice", ["Matar Paneer Curry", "Jeera Rice", "Papad", "Pickle"]),
        ("Kadhi Pakora with Steamed Rice", ["Punjabi Kadhi with Pakoras", "Steamed Rice", "Spicy Pickle"]),
        ("Mixed Vegetable Pulao with Boondi Raita", ["Mixed Vegetable Pulao", "Boondi Raita", "Roasted Papad", "Mint Chutney"]),
        ("Chole Kulche Street Style Combo", ["Pindi Chole", "Soft Butter Kulcha (2 pcs)", "Pickled Onions", "Green Chutney"]),
        ("Methi Thepla with Masala Chai & Chunda", ["Methi Thepla (6 pcs)", "Mango Chunda", "Spicy Pickle"]),
        ("Dal Tadka with Steamed Rice & Green Salad", ["Yellow Dal Tadka", "Steamed Basmati Rice", "Fried Green Chillies", "Papad"]),
        ("Mix Veg Korma with Parotta", ["Creamy Mix Veg Korma", "Malabar Parotta (2 pcs)", "Onion Raita"]),
        ("Masala Dosa Combo with Sambar & Chutneys", ["Crispy Masala Dosa", "Mixed Veg Sambar", "Coconut Chutney", "Tomato Chutney"]),
        ("Baingan Bhartha with Bajra Rotla", ["Smoked Ringan Bharthu", "Hot Bajra Rotla (2 pcs)", "Chaas Glass", "Green Garlic Chutney"]),
        ("Veg Biryani with Mirchi Ka Salan", ["Hyderabadi Veg Biryani", "Mirchi Ka Salan", "Raita"]),
        ("Khaman & Nylon Sev Poha Pack", ["Nylon Sev Khaman", "Indori Poha", "Fried Peanuts", "Sweet Chutney"]),
        ("Sambar Vada & Upma Breakfast Box", ["Rava Upma Bowl", "Crispy Medu Vada (2 pcs)", "Sambar Bowl"]),
        ("Vegetable Cutlets with Mint Chutney & Bread", ["Spiced Veg Cutlets (4 pcs)", "Brown Bread Slices (4 pcs)", "Tomato Ketchup", "Mint Chutney"])
    ]

    shelter_catalog = [
        "Santram Bal Ashram & Orphanage Support Wing",
        "Vrundavan Old Age Home & Care Shelter",
        "Gota Metro Construction Labor Community Camp",
        "Pandesara Industrial Workers Child Welfare Shelter",
        "Rain Basera Night Shelter for Homeless Citizens",
        "Apang Manav Mandal Specially Abled Care Foundation",
        "Shishu Gruh Destitute Children Welfare Center",
        "Snehalaya Leprosy & Destitute Relief Center",
        "Mother Teresa Home for the Dying Destitute",
        "Navrangpura Urban Slum Free Meal Distribution Point",
        "Karelibaug Slum Children Daily Nutrition Center",
        "Vesu Migrant Laborers Free Community Kitchen",
        "Sayajigunj Daily Food Relief for Destitute Travelers",
        "Athwa Lines Senior Citizen Support Center",
        "Sector 16 Night Care Center for Rural Migrants",
        "Kalupur Railway Porters & Daily Wage Workers Canteen",
        "Bhadra Slum Cluster Free Food Distribution Center",
        "Chandkheda Community Relief Foundation Food Cell",
        "Prahlad Nagar Construction Camp Daily Food Program",
        "Alkapuri Slum Women & Children Nutrition Point"
    ]

    sql_statements = []

    # 1. Ensure users exist with the hashed password for '123456'
    pwd_hash = "AQAAAAIAAYagAAAAEMeOMPuFZOYIT/yPdadIfQQ3l/YghrYr8FeJLWk8XBxtILwQNj5vqpmdB+SDSUVOYA=="
    sql_statements.append(f"""
INSERT INTO Users (EmailID, Username, password, role, city)
VALUES ('abc@gmail.com', 'Tanmay Patel (Donor)', '{pwd_hash}', 'Donor', 'Ahmedabad')
ON DUPLICATE KEY UPDATE password='{pwd_hash}', role='Donor';
""")
    sql_statements.append(f"""
INSERT INTO Users (EmailID, Username, password, role, city)
VALUES ('pqr@gmail.com', 'PQR Seva Trust (Receiver)', '{pwd_hash}', 'Receiver', 'Nadiad')
ON DUPLICATE KEY UPDATE password='{pwd_hash}', role='Receiver';
""")
    sql_statements.append(f"""
INSERT INTO Users (EmailID, Username, password, role, city)
VALUES ('transporter@gmail.com', 'Amit Patel (Transporter)', '{pwd_hash}', 'Transporter', 'Ahmedabad')
ON DUPLICATE KEY UPDATE password='{pwd_hash}', role='Transporter';
""")

    now = datetime.now()

    # 2. 100 Foods for Donor (abc@gmail.com)
    statuses_donor = ["pending"] * 70 + ["available"] * 15 + ["Allocated"] * 10 + ["done"] * 5
    random.shuffle(statuses_donor)

    for i in range(100):
        city, state, loc_pairs = random.choice(cities_locations)
        loc, perf_loc = random.choice(loc_pairs)
        food_name, items = random.choice(food_catalog)
        items_json = json.dumps(items).replace("'", "''")
        qty = random.randint(15, 120)
        hours_offset = random.randint(-48, 12)
        dt = (now + timedelta(hours=hours_offset, minutes=random.randint(0, 59))).strftime("%Y-%m-%d %H:%M:%S")
        status = statuses_donor[i]

        sql_statements.append(f"""
INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', {qty}, '{food_name.replace("'", "''")}', '{items_json}', '{dt}', '{status}', '{loc.replace("'", "''")}', '{city}', '{state}', '{perf_loc.replace("'", "''")}');
""")

    # 3. 100 NeededFoods for Receiver (pqr@gmail.com)
    statuses_receiver = ["pending"] * 75 + ["Allocated"] * 15 + ["Fulfilled"] * 10
    random.shuffle(statuses_receiver)

    for i in range(100):
        city, state, loc_pairs = random.choice(cities_locations)
        loc, perf_loc = random.choice(loc_pairs)
        shelter = random.choice(shelter_catalog)
        full_loc = f"{shelter}, {loc}"
        qty = random.randint(20, 100)
        hours_offset = random.randint(-24, 24)
        dt = (now + timedelta(hours=hours_offset, minutes=random.randint(0, 59))).strftime("%Y-%m-%d %H:%M:%S")
        status = statuses_receiver[i]

        sql_statements.append(f"""
INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', {qty}, '{dt}', '{status}', '{full_loc.replace("'", "''")}', '{city}', '{state}', '{perf_loc.replace("'", "''")}');
""")

    # 4. Transporter Deliveries & Status Histories
    # Let's create 16 paired matches & deliveries across various delivery lifecycle states
    transporter_states = [
        ("AwaitingTransporter", None),
        ("AwaitingTransporter", None),
        ("AwaitingTransporter", None),
        ("AwaitingTransporter", None),
        ("AwaitingTransporter", None),
        ("Accepted", "transporter@gmail.com"),
        ("Accepted", "transporter@gmail.com"),
        ("PickupArrived", "transporter@gmail.com"),
        ("PickupArrived", "transporter@gmail.com"),
        ("PickupConfirmed", "transporter@gmail.com"),
        ("PickedUp", "transporter@gmail.com"),
        ("InTransit", "transporter@gmail.com"),
        ("InTransit", "transporter@gmail.com"),
        ("ReceiverArrived", "transporter@gmail.com"),
        ("Delivered", "transporter@gmail.com"),
        ("Delivered", "transporter@gmail.com"),
    ]

    for idx, (t_status, trans_id) in enumerate(transporter_states, start=1):
        city, state, loc_pairs = random.choice(cities_locations)
        loc_donor, perf_donor = loc_pairs[0]
        loc_rec, perf_rec = loc_pairs[-1] if len(loc_pairs) > 1 else loc_pairs[0]
        food_name, items = random.choice(food_catalog)
        items_json = json.dumps(items).replace("'", "''")
        qty = random.randint(30, 80)
        
        c_time = (now - timedelta(hours=random.randint(1, 12))).strftime("%Y-%m-%d %H:%M:%S")

        # Create Food
        sql_statements.append(f"""
INSERT INTO Foods (emailID, quntity, FoodName, items, donationDateTime, status, location, city, state, perfectLocation)
VALUES ('abc@gmail.com', {qty}, '{food_name.replace("'", "''")}', '{items_json}', '{c_time}', 'Allocated', '{loc_donor.replace("'", "''")}', '{city}', '{state}', '{perf_donor.replace("'", "''")}');
SET @FID_{idx} = LAST_INSERT_ID();
""")

        # Create NeededFood
        sql_statements.append(f"""
INSERT INTO NeededFoods (emailID, quntity, requestDateTime, status, location, city, state, perfectLocation)
VALUES ('pqr@gmail.com', {qty}, '{c_time}', 'Allocated', '{loc_rec.replace("'", "''")}', '{city}', '{state}', '{perf_rec.replace("'", "''")}');
SET @NFID_{idx} = LAST_INSERT_ID();
""")

        # Create MatchedFood
        sql_statements.append(f"""
INSERT INTO MatchedFoods (FID, DonorId, Providedquntity, donationDateTime, city, state, fromperfectLocation, NFID, ReceiverId, requestDateTime, Neededquntity, toperfectLocation)
VALUES (@FID_{idx}, 'abc@gmail.com', {qty}, '{c_time}', '{city}', '{state}', '{perf_donor.replace("'", "''")}', @NFID_{idx}, 'pqr@gmail.com', '{c_time}', {qty}, '{perf_rec.replace("'", "''")}');
SET @MFID_{idx} = LAST_INSERT_ID();
""")

        # Create FoodDelivery
        t_id_val = f"'{trans_id}'" if trans_id else "NULL"
        assigned_val = f"'{c_time}'" if trans_id else "NULL"
        accepted_val = f"'{c_time}'" if trans_id else "NULL"
        delivered_val = f"'{c_time}'" if t_status == "Delivered" else "NULL"

        sql_statements.append(f"""
INSERT INTO FoodDeliveries (MatchedFoodId, DonorId, ReceiverId, TransporterId, Status, CreatedAt, AssignedAt, AcceptedAt, DeliveredAt)
VALUES (@MFID_{idx}, 'abc@gmail.com', 'pqr@gmail.com', {t_id_val}, '{t_status}', '{c_time}', {assigned_val}, {accepted_val}, {delivered_val});
SET @DEL_{idx} = LAST_INSERT_ID();
""")

        # Add initial DeliveryStatusHistory
        sql_statements.append(f"""
INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_{idx}, 'Allocated', 'AwaitingTransporter', 'System', 'System', '{c_time}', 'Order matched and awaiting transporter pickup.');
""")

        if trans_id:
            sql_statements.append(f"""
INSERT INTO DeliveryStatusHistories (DeliveryId, FromStatus, ToStatus, ChangedByUserId, ChangedByUserRole, ChangedAt, Notes)
VALUES (@DEL_{idx}, 'AwaitingTransporter', '{t_status}', '{trans_id}', 'Transporter', '{c_time}', 'Delivery progress updated by transporter.');
""")

    return "\n".join(sql_statements)

if __name__ == "__main__":
    sql = generate_seed_sql()
    with open("/media/tanmay/tanmay/FoodBridge/generated_dummy_data.sql", "w", encoding="utf-8") as f:
        f.write(sql)
    print("generated_dummy_data.sql written successfully.")
