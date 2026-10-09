import urllib.request
import urllib.error
import json
import time

BASE_URL = "http://localhost:5023"

def send_request(method, path, data=None, token=None):
    url = f"{BASE_URL}{path}"
    headers = {"Content-Type": "application/json"}
    if token:
        headers["Authorization"] = f"Bearer {token}"
    body = json.dumps(data).encode("utf-8") if data is not None else None
    req = urllib.request.Request(url, data=body, headers=headers, method=method)
    try:
        with urllib.request.urlopen(req) as resp:
            resp_body = resp.read().decode("utf-8")
            try:
                parsed = json.loads(resp_body)
            except Exception:
                parsed = resp_body
            return resp.status, parsed
    except urllib.error.HTTPError as e:
        err_body = e.read().decode("utf-8")
        try:
            parsed = json.loads(err_body)
        except Exception:
            parsed = err_body
        return e.code, parsed

def login(email, password="123456"):
    status, body = send_request("POST", "/login", {"EmailID": email, "password": password})
    if status != 200:
        raise Exception(f"Login failed for {email}: {status} {body}")
    token = body.strip().replace('"', '') if isinstance(body, str) else str(body)
    return token

def run_test():
    print("=" * 80)
    print("TEST: FOODBRIDGE ALLOCATED FOOD DELIVERY FLOW VERIFICATION")
    print("=" * 80)

    # 1. Login Accounts
    print("\n--- 1. Authenticating Roles ---")
    donor_token = login("abc@gmail.com")
    print("Donor (abc@gmail.com) logged in.")
    receiver_token = login("khush@gmail.com")
    print("Receiver (khush@gmail.com) logged in.")
    transporter1_token = login("het@gmail.com")
    print("Transporter 1 (het@gmail.com) logged in.")
    transporter2_token = login("neel@gmail.com")
    print("Transporter 2 (neel@gmail.com) logged in.")

    # 2. Donor posts food: 15 servings in Nadiad
    print("\n--- 2. Donor creates food (15 servings, Nadiad) ---")
    now_str = time.strftime("%Y-%m-%dT%H:%M:%S")
    food_payload = {
        "emailID": "abc@gmail.com",
        "quntity": 15,
        "FoodName": "Dal Khichdi & Buttermilk",
        "items": ["Khichdi", "Kadhi", "Chaas"],
        "donationDateTime": now_str,
        "city": "Nadiad",
        "state": "Gujarat",
        "perfectLocation": "nalanda naagr",
        "PickupLatitude": 22.6916,
        "PickupLongitude": 72.8634
    }
    status, body = send_request("POST", "/DonerHome", food_payload, donor_token)
    print(f"Donor post food response: {status} {body}")
    assert status == 200

    # 3. Receiver posts requirement: 10 servings in Nadiad
    print("\n--- 3. Receiver creates requirement (10 servings, Nadiad) ---")
    req_payload = {
        "emailID": "khush@gmail.com",
        "quntity": 10,
        "requestDateTime": now_str,
        "city": "Nadiad",
        "state": "Gujarat",
        "perfectLocation": "nalanda naagr",
        "DeliveryLatitude": 22.6920,
        "DeliveryLongitude": 72.8640
    }
    status, body = send_request("POST", "/NGOs", req_payload, receiver_token)
    print(f"Receiver post requirement response: {status} {body}")
    assert status == 200

    time.sleep(1)

    # 4. Verify Receiver sees Allocated requirement
    print("\n--- 4. Verify Receiver Allocated dashboard ---")
    status, allocated_receiver = send_request("GET", "/NGOs/display/Allocated", token=receiver_token)
    assert status == 200
    print(f"Receiver Allocated count: {len(allocated_receiver)}")
    assert len(allocated_receiver) > 0
    latest_rcv_match = allocated_receiver[-1]
    print(f"Latest receiver allocation: FoodName={latest_rcv_match['food']['foodName']}, Donor={latest_rcv_match['food']['emailID']}, MatchedQty={latest_rcv_match['food']['quntity']}, NeededQty={latest_rcv_match['neededFood']['quntity']}")
    assert latest_rcv_match['food']['quntity'] == 10
    assert latest_rcv_match['neededFood']['quntity'] == 10

    # 5. Verify Donor sees Allocated food and remaining pending food (15 - 10 = 5)
    print("\n--- 5. Verify Donor Allocated and Remaining Pending food ---")
    status, donor_allocated = send_request("GET", "/DonerHome/display/Allocated", token=donor_token)
    assert status == 200
    print(f"Donor Allocated count: {len(donor_allocated)}")
    latest_donor_alloc = donor_allocated[-1]
    assert latest_donor_alloc['food']['quntity'] == 10

    status, donor_pending = send_request("GET", "/DonerHome/display/pending", token=donor_token)
    assert status == 200
    remaining_5 = [f for f in donor_pending if f['foodName'] == "Dal Khichdi & Buttermilk" and f['quntity'] == 5]
    print(f"Remaining 5 servings pending found: {len(remaining_5) > 0}")
    assert len(remaining_5) > 0

    # 6. Transporter 1 fetches available deliveries
    print("\n--- 6. Transporter 1 checks Available Deliveries ---")
    status, available_jobs = send_request("GET", "/Transporter/available", token=transporter1_token)
    assert status == 200
    print(f"Transporter available deliveries count: {len(available_jobs)}")
    assert len(available_jobs) > 0

    # Find our delivery
    our_delivery = next((d for d in available_jobs if d['foodName'] == "Dal Khichdi & Buttermilk" and d['status'] == "AwaitingTransporter"), None)
    assert our_delivery is not None, "Created delivery not found in Transporter available list!"
    delivery_id = our_delivery['deliveryId']
    print(f"SUCCESS: Delivery found! DeliveryId={delivery_id}, Status={our_delivery['status']}, Quantity={our_delivery['quantity']}, Donor={our_delivery['donorId']}, Receiver={our_delivery['receiverId']}, TransporterId={our_delivery['transporterId']}")
    assert our_delivery['quantity'] == 10
    assert our_delivery['status'] == "AwaitingTransporter"
    assert our_delivery['transporterId'] is None or our_delivery['transporterId'] == ""

    # 7. Transporter 1 accepts the delivery
    print(f"\n--- 7. Transporter 1 accepts Delivery #{delivery_id} ---")
    status, accepted_data = send_request("POST", f"/Transporter/deliveries/{delivery_id}/accept", token=transporter1_token)
    print(f"Accept response: {status} {accepted_data}")
    assert status == 200
    assert accepted_data['delivery']['status'] == "Accepted"
    assert accepted_data['delivery']['transporterId'] == "het@gmail.com"

    # 8. Transporter 2 checks available deliveries (should NOT see this delivery anymore)
    print("\n--- 8. Transporter 2 checks Available Deliveries (duplicate acceptance prevention) ---")
    status, t2_avail = send_request("GET", "/Transporter/available", token=transporter2_token)
    assert status == 200
    is_in_avail = any(d['deliveryId'] == delivery_id for d in t2_avail)
    print(f"Is accepted delivery still in available list for Transporter 2? {is_in_avail}")
    assert not is_in_avail

    # Transporter 2 attempts to accept the already-accepted delivery
    status_conflict, body_conflict = send_request("POST", f"/Transporter/deliveries/{delivery_id}/accept", token=transporter2_token)
    print(f"Transporter 2 duplicate accept response: {status_conflict} {body_conflict}")
    assert status_conflict == 409

    # 9. Verify full delivery progression lifecycle
    print("\n--- 9. Full Delivery Lifecycle Progression ---")
    # Step A: Arrived at Pickup
    status, body = send_request("POST", f"/Transporter/deliveries/{delivery_id}/arrived-pickup", token=transporter1_token)
    assert status == 200
    print("Step A (Transporter -> Arrived at Pickup): Status = PickupPending")

    # Step B: Donor Confirms Handover
    status, body = send_request("POST", f"/Donor/deliveries/{delivery_id}/confirm-handover", {"notes": "All 10 packed securely"}, donor_token)
    assert status == 200
    print("Step B (Donor -> Confirms Handover): Status = PickedUp")

    # Step C: Transporter starts transit
    status, body = send_request("POST", f"/Transporter/deliveries/{delivery_id}/start", token=transporter1_token)
    assert status == 200
    print("Step C (Transporter -> Starts Transit): Status = InTransit")

    # Step D: Transporter arrives at receiver
    status, body = send_request("POST", f"/Transporter/deliveries/{delivery_id}/arrived-receiver", token=transporter1_token)
    assert status == 200
    print("Step D (Transporter -> Arrived at Receiver): Status = ReceiverArrived")

    # Step E: Receiver confirms delivery receipt
    status, body = send_request("POST", f"/Receiver/deliveries/{delivery_id}/confirm-received", {"notes": "Received hot and fresh"}, receiver_token)
    assert status == 200
    print("Step E (Receiver -> Confirms Received): Status = Delivered")

    # Verify final delivery state
    status, final_del = send_request("GET", f"/Transporter/deliveries/{delivery_id}", token=transporter1_token)
    assert status == 200
    assert final_del['status'] == "Delivered"
    assert final_del['deliveredAt'] is not None
    print(f"Final Delivery State: Status={final_del['status']}, DeliveredAt={final_del['deliveredAt']}")

    print("\n" + "=" * 80)
    print("ALL TESTS PASSED SUCCESSFULLY!")
    print("=" * 80)

if __name__ == "__main__":
    run_test()
