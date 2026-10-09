#!/usr/bin/env python3
import json
import urllib.request
import urllib.error
import sys

BASE_URL = "http://localhost:5023"

def request(method, path, data=None, token=None):
    url = f"{BASE_URL}{path}"
    headers = {"Content-Type": "application/json"}
    if token:
        headers["Authorization"] = f"Bearer {token}"
    
    payload = json.dumps(data).encode("utf-8") if data is not None else None
    req = urllib.request.Request(url, data=payload, headers=headers, method=method)
    
    try:
        with urllib.request.urlopen(req, timeout=10) as resp:
            content = resp.read().decode("utf-8", errors="replace")
            return resp.status, content
    except urllib.error.HTTPError as e:
        content = e.read().decode("utf-8", errors="replace")
        return e.code, content
    except Exception as e:
        return 0, str(e)

def login(email, password="SecurePassword123!"):
    # Try password first, or seed password "123456"
    status, body = request("POST", "/login", {"EmailID": email, "password": password})
    if status == 200 and not body.startswith("user") and not body.startswith("invalid"):
        return body.strip().replace('"', '')
    # Fallback to seed password
    status, body = request("POST", "/login", {"EmailID": email, "password": "123456"})
    if status == 200 and not body.startswith("user") and not body.startswith("invalid"):
        return body.strip().replace('"', '')
    raise Exception(f"Failed to login {email}: {body}")

def run_tests():
    passed = 0
    failed = 0

    def assert_test(name, condition, details=""):
        nonlocal passed, failed
        if condition:
            print(f"  [PASS] {name}")
            passed += 1
        else:
            print(f"  [FAIL] {name} - {details}")
            failed += 1

    print("\n========================================================")
    print("  FOODBRIDGE PROFILE FEATURE - COMPREHENSIVE TESTS")
    print("========================================================\n")

    # 1. Public Profile View
    print("--- 1. MVC View Tests ---")
    status, body = request("GET", "/Home/Profile")
    assert_test("GET /Home/Profile returns 200 OK", status == 200, f"Status: {status}")
    assert_test("Profile view contains Profile title / elements", "My Profile" in body or "Account & Profile Management" in body)

    # 2. Security & Authorization
    print("\n--- 2. Security & Auth Tests ---")
    status, _ = request("GET", "/profile/me")
    assert_test("GET /profile/me without token -> 401 Unauthorized", status == 401, f"Status: {status}")

    status, _ = request("PUT", "/profile/me", {"Name": "Hacker", "City": "Nowhere"})
    assert_test("PUT /profile/me without token -> 401 Unauthorized", status == 401, f"Status: {status}")

    # 3. Donor Profile Tests
    print("\n--- 3. Donor Profile Tests ---")
    donor_token = login("abc@gmail.com")
    assert_test("Login Donor abc@gmail.com", bool(donor_token))

    status, body = request("GET", "/profile/me", token=donor_token)
    assert_test("GET /profile/me for Donor returns 200", status == 200, f"Status: {status}")
    profile = json.loads(body)
    assert_test("Profile email is abc@gmail.com", profile.get("email") == "abc@gmail.com")
    assert_test("Profile role is Donor", profile.get("role") == "Donor")
    assert_test("Profile has city", bool(profile.get("city")))

    # Update Donor Profile
    update_payload = {
        "Name": "Tirth Patel",
        "Phone": "9876543210",
        "Address": "Nalanda Nagar, Near Santram Road",
        "City": "Nadiad",
        "State": "Gujarat",
        "Pincode": "387001"
    }
    status, body = request("PUT", "/profile/me", update_payload, token=donor_token)
    assert_test("PUT /profile/me for Donor returns 200", status == 200, f"Status: {status}, Body: {body}")
    updated = json.loads(body)
    assert_test("Updated Name is 'Tirth Patel'", updated.get("name") == "Tirth Patel")
    assert_test("Updated City is 'Nadiad'", updated.get("city") == "Nadiad")
    assert_test("Updated Phone is '9876543210'", updated.get("phone") == "9876543210")
    assert_test("Updated Address is 'Nalanda Nagar, Near Santram Road'", updated.get("address") == "Nalanda Nagar, Near Santram Road")
    assert_test("Token was reissued in response", bool(updated.get("token")))

    # Check GET /profile/me persistence
    status, body = request("GET", "/profile/me", token=updated.get("token") or donor_token)
    persisted = json.loads(body)
    assert_test("Persisted profile shows Tirth Patel", persisted.get("name") == "Tirth Patel")
    assert_test("Persisted profile shows Nadiad", persisted.get("city") == "Nadiad")

    # 4. Immutable Fields Protection Test
    print("\n--- 4. Immutable Fields Protection Tests ---")
    tamper_payload = {
        "Name": "Tirth Patel",
        "City": "Nadiad",
        "Email": "hacked@gmail.com",
        "EmailID": "hacked@gmail.com",
        "Role": "Transporter",
        "Password": "newpassword123",
        "UserId": 9999
    }
    status, body = request("PUT", "/profile/me", tamper_payload, token=donor_token)
    assert_test("PUT with tampered fields completes without error", status == 200)
    check_persisted = json.loads(body)
    assert_test("Email was NOT modified (remains abc@gmail.com)", check_persisted.get("email") == "abc@gmail.com")
    assert_test("Role was NOT modified (remains Donor)", check_persisted.get("role") == "Donor")

    # 5. Validation Rejection Tests
    print("\n--- 5. Validation Rejection Tests ---")
    # Empty Name
    status, body = request("PUT", "/profile/me", {"Name": "", "City": "Nadiad"}, token=donor_token)
    assert_test("Empty Name rejected with 400 Bad Request", status == 400, f"Status: {status}")

    # Empty City
    status, body = request("PUT", "/profile/me", {"Name": "Valid Name", "City": ""}, token=donor_token)
    assert_test("Empty City rejected with 400 Bad Request", status == 400, f"Status: {status}")

    # Invalid Phone
    status, body = request("PUT", "/profile/me", {"Name": "Valid Name", "City": "Nadiad", "Phone": "not-a-phone"}, token=donor_token)
    assert_test("Invalid Phone rejected with 400 Bad Request", status == 400, f"Status: {status}")

    # Invalid Pincode
    status, body = request("PUT", "/profile/me", {"Name": "Valid Name", "City": "Nadiad", "Pincode": "A!@#$%^&*()"}, token=donor_token)
    assert_test("Invalid Pincode rejected with 400 Bad Request", status == 400, f"Status: {status}")

    # 6. Receiver Profile Tests
    print("\n--- 6. Receiver Profile Tests ---")
    receiver_token = login("pqr@gmail.com")
    assert_test("Login Receiver pqr@gmail.com", bool(receiver_token))

    status, body = request("GET", "/profile/me", token=receiver_token)
    assert_test("GET /profile/me for Receiver returns 200", status == 200)
    rcv_profile = json.loads(body)
    assert_test("Receiver role is Receiver", rcv_profile.get("role") == "Receiver")

    # Update Receiver Profile
    rcv_update = {
        "Name": "PQR Seva Trust & Community Shelter",
        "Phone": "9123456780",
        "Address": "Santram Bal Ashram Road",
        "City": "Nadiad",
        "State": "Gujarat",
        "Pincode": "387001"
    }
    status, body = request("PUT", "/profile/me", rcv_update, token=receiver_token)
    assert_test("PUT /profile/me for Receiver returns 200", status == 200)
    updated_rcv = json.loads(body)
    assert_test("Updated Receiver Name saved", updated_rcv.get("name") == "PQR Seva Trust & Community Shelter")

    # 7. Transporter Profile & Availability Tests
    print("\n--- 7. Transporter Profile Tests ---")
    trans_token = login("transporter@gmail.com")
    assert_test("Login Transporter transporter@gmail.com", bool(trans_token))

    status, body = request("GET", "/profile/me", token=trans_token)
    assert_test("GET /profile/me for Transporter returns 200", status == 200)
    trans_profile = json.loads(body)
    assert_test("Transporter role is Transporter", trans_profile.get("role") == "Transporter")
    assert_test("Transporter has AvailabilityStatus field", "availabilityStatus" in trans_profile)

    # Update Transporter Location & Offline/Busy Status
    trans_update = {
        "Name": "Amit Patel (Transporter)",
        "City": "Ahmedabad",
        "Phone": "9988776655",
        "Address": "Commerce Six Roads, Navrangpura",
        "State": "Gujarat",
        "Pincode": "380009",
        "AvailabilityStatus": "Busy",
        "Latitude": 23.0338,
        "Longitude": 72.5540
    }
    status, body = request("PUT", "/profile/me", trans_update, token=trans_token)
    assert_test("PUT /profile/me for Transporter (Busy) returns 200", status == 200)
    updated_trans = json.loads(body)
    assert_test("Updated AvailabilityStatus is 'Busy'", updated_trans.get("availabilityStatus") == "Busy")
    assert_test("Updated Latitude is 23.0338", updated_trans.get("latitude") == 23.0338)

    # Test Transporter availability safeguard when active trip exists
    trans_update["AvailabilityStatus"] = "Available"
    status, body = request("PUT", "/profile/me", trans_update, token=trans_token)
    assert_test("Transporter blocked from setting 'Available' during active trip (400 Bad Request)", status == 400, f"Status: {status}, Body: {body}")

    # 8. Check Existing Deliveries Unaffected
    print("\n--- 8. Historical & Workflow Integrity Tests ---")
    # Verify Transporter deliveries endpoint still works
    status, body = request("GET", "/Transporter/my-deliveries", token=trans_token)
    assert_test("GET /Transporter/my-deliveries works normally", status == 200)

    status, body = request("GET", "/Transporter/available", token=trans_token)
    assert_test("GET /Transporter/available works normally", status == 200)

    # Verify Donor food listings endpoint still works
    status, body = request("GET", "/DonerHome/display/pending", token=donor_token)
    assert_test("GET /DonerHome/display/pending works normally", status == 200)

    # Verify Receiver food requests endpoint still works
    status, body = request("GET", "/NGOs/display/pending", token=receiver_token)
    assert_test("GET /NGOs/display/pending works normally", status == 200)

    print("\n========================================================")
    print(f"  TEST SUMMARY: {passed} PASSED, {failed} FAILED")
    print("========================================================\n")
    return failed == 0

if __name__ == "__main__":
    success = run_tests()
    sys.exit(0 if success else 1)
