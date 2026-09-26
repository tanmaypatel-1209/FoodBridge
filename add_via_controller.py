import urllib.request
import json
import random
import time
from datetime import datetime, timedelta

BASE_URL = "http://localhost:5000"

def api_post(endpoint, data, token=None):
    url = f"{BASE_URL}{endpoint}"
    headers = {"Content-Type": "application/json"}
    if token:
        headers["Authorization"] = f"Bearer {token}"
    req = urllib.request.Request(url, data=json.dumps(data).encode("utf-8"), headers=headers)
    with urllib.request.urlopen(req) as resp:
        return resp.read().decode("utf-8")

def api_get(endpoint, token=None):
    url = f"{BASE_URL}{endpoint}"
    headers = {}
    if token:
        headers["Authorization"] = f"Bearer {token}"
    req = urllib.request.Request(url, headers=headers)
    with urllib.request.urlopen(req) as resp:
        return resp.read().decode("utf-8")

def main():
    print("--- 1. Logging in users ---")
    donor_token = api_post("/login", {"EmailID": "abc@gmail.com", "password": "123456"}).strip('"')
    print("Donor logged in. Token length:", len(donor_token))

    receiver_token = api_post("/login", {"EmailID": "pqr@gmail.com", "password": "123456"}).strip('"')
    print("Receiver logged in. Token length:", len(receiver_token))

    transporter_token = api_post("/login", {"EmailID": "transporter@gmail.com", "password": "123456"}).strip('"')
    print("Transporter logged in. Token length:", len(transporter_token))

    cities_data = [
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

    food_catalog = [
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

    # Pre-calculated quantity pairs for testing MatchFoodRequirement:
    # (food_qty, needed_qty)
    quantities = [
        (35, 30),   # m=5  (<20 direct match)
        (60, 30),   # m=30 (>=20 triggers split!)
        (50, 45),   # m=5  (<20 direct match)
        (80, 50),   # m=30 (>=20 triggers split!)
        (40, 40),   # m=0  (exact match)
        (75, 40),   # m=35 (>=20 triggers split!)
        (45, 40),   # m=5  (<20 direct match)
        (100, 60),  # m=40 (>=20 triggers split!)
        (55, 50),   # m=5  (<20 direct match)
        (90, 50),   # m=40 (>=20 triggers split!)
    ]

    now = datetime.now()
    base_time = now.replace(minute=0, second=0, microsecond=0) + timedelta(hours=3)

    print("\n--- 2. Adding 100 Foods via Donor Controller (POST /DonerHome) ---")
    donor_count = 0
    donor_items_to_match = []

    for city, state, locs, count in cities_data:
        for i in range(count):
            loc, perf = locs[i % len(locs)]
            fname, fitems = food_catalog[i % len(food_catalog)]
            fq, nq = quantities[i % len(quantities)]
            t_offset = timedelta(hours=(i // 2) + 1, minutes=(30 if i % 2 == 1 else 0))
            food_time = (base_time + t_offset).strftime("%Y-%m-%dT%H:%M:%S")

            payload = {
                "emailID": "abc@gmail.com",
                "quntity": fq,
                "FoodName": fname,
                "items": fitems,
                "donationDateTime": food_time,
                "city": city,
                "state": state,
                "perfectLocation": perf,
                "location": loc
            }
            res = api_post("/DonerHome", payload, donor_token)
            donor_count += 1
            if donor_count % 20 == 0:
                print(f"Added {donor_count}/100 foods via Donor controller...")

    print(f"Total foods added via Donor controller: {donor_count}")

    print("\n--- 3. Adding 100 Requirements via Receiver Controller (POST /NGOs) ---")
    receiver_count = 0

    for city, state, locs, count in cities_data:
        for i in range(count):
            loc, perf = locs[i % len(locs)]
            fq, nq = quantities[i % len(quantities)]
            t_offset = timedelta(hours=(i // 2) + 1, minutes=(30 if i % 2 == 1 else 0))
            req_time = (base_time + t_offset).strftime("%Y-%m-%dT%H:%M:%S")

            shelter_name = f"Seva Relief Shelter {city} #{i+1}"
            payload = {
                "quntity": nq,
                "requestDateTime": req_time,
                "city": city,
                "state": state,
                "perfectLocation": perf,
                "location": f"{shelter_name}, {loc}"
            }
            res = api_post("/NGOs", payload, receiver_token)
            receiver_count += 1
            if receiver_count % 20 == 0:
                print(f"Added {receiver_count}/100 requirements via Receiver controller...")

    print(f"Total requirements added via Receiver controller: {receiver_count}")

    print("\n--- 4. Checking and advancing Transporter Deliveries via Controller ---")
    # For any matched deliveries, let transporter accept and update via TransporterController
    try:
        available_json = api_get("/Transporter/available", transporter_token)
        available_jobs = json.loads(available_json)
        print(f"Available jobs for Transporter: {len(available_jobs)}")

        # Accept some deliveries via TransporterController
        for idx, job in enumerate(available_jobs[:10]):
            jid = job.get("id") or job.get("Id")
            if not jid: continue
            try:
                # Accept
                api_post(f"/Transporter/deliveries/{jid}/accept", {}, transporter_token)
                print(f"Transporter accepted delivery #{jid}")
                
                # Advance some to arrived-pickup and start
                if idx % 3 == 0:
                    api_post(f"/Transporter/deliveries/{jid}/arrived-pickup", {}, transporter_token)
                elif idx % 3 == 1:
                    api_post(f"/Transporter/deliveries/{jid}/arrived-pickup", {}, transporter_token)
                    api_post(f"/Transporter/deliveries/{jid}/start", {}, transporter_token)
            except Exception as e:
                print(f"Transporter action on #{jid} info: {e}")
    except Exception as e:
        print("Transporter available check error:", e)

    print("\nData population via controllers completed successfully!")

if __name__ == "__main__":
    main()
