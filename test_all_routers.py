#!/usr/bin/env python3
import json
import time
import urllib.request
import urllib.error

BASE_URL = "http://localhost:5000"

def request(method, path, data=None, token=None):
    url = f"{BASE_URL}{path}"
    headers = {"Content-Type": "application/json"}
    if token:
        headers["Authorization"] = f"Bearer {token}"
    
    payload = json.dumps(data).encode("utf-8") if data else None
    req = urllib.request.Request(url, data=payload, headers=headers, method=method)
    
    t0 = time.perf_counter()
    try:
        with urllib.request.urlopen(req, timeout=10) as resp:
            elapsed = (time.perf_counter() - t0) * 1000
            content = resp.read().decode("utf-8", errors="replace")
            return resp.status, elapsed, content
    except urllib.error.HTTPError as e:
        elapsed = (time.perf_counter() - t0) * 1000
        content = e.read().decode("utf-8", errors="replace")
        return e.code, elapsed, content
    except Exception as e:
        elapsed = (time.perf_counter() - t0) * 1000
        return 0, elapsed, str(e)

def test_all_routes():
    results = []
    
    def log_result(category, method, path, expected_status, actual_status, elapsed, note=""):
        passed = (actual_status == expected_status)
        results.append({
            "category": category,
            "method": method,
            "path": path,
            "expected": expected_status,
            "actual": actual_status,
            "elapsed_ms": f"{elapsed:.1f}ms",
            "status": "PASS" if passed else "FAIL",
            "note": note
        })

    print("===================================================================")
    print("Testing All Routes in FoodBridge")
    print("===================================================================")

    # 1. Public MVC View Routes
    public_views = [
        ("/", 200, "Home Landing Page"),
        ("/Home/Index", 200, "Home Index View"),
        ("/Home/Privacy", 200, "Privacy Policy View"),
        ("/Home/Login", 200, "Login / Auth View"),
        ("/Home/DonerHome", 200, "Donor Home Dashboard View"),
        ("/Home/DonorPortal", 200, "Donor Portal Modal/View"),
        ("/Home/ReceiverHome", 200, "Receiver/NGO Dashboard View"),
        ("/Home/RequestFood", 200, "Request Food Form View"),
        ("/Home/Error", 200, "Error Page View"),
    ]
    for path, exp, desc in public_views:
        status, elapsed, _ = request("GET", path)
        log_result("Public View", "GET", path, exp, status, elapsed, desc)

    # 2. Auth Security Checks (Unauthenticated access to protected routes should return 401)
    protected_routes = [
        ("GET", "/DonerHome/display", 401, "Donor pending without token"),
        ("GET", "/DonerHome/display/Allocated", 401, "Donor allocated without token"),
        ("POST", "/DonerHome", 401, "Donor add food without token"),
        ("GET", "/NGOs/display", 401, "NGO pending without token"),
        ("GET", "/NGOs/display/Allocated", 401, "NGO allocated without token"),
        ("POST", "/NGOs", 401, "NGO add needed food without token"),
    ]
    for m, path, exp, desc in protected_routes:
        status, elapsed, _ = request(m, path)
        log_result("Security Check", m, path, exp, status, elapsed, desc)

    # 3. Authentication & Account Creation
    timestamp = int(time.time())
    donor_email = f"testdonor_{timestamp}@foodbridge.org"
    receiver_email = f"testreceiver_{timestamp}@foodbridge.org"
    password = "SecurePassword123!"

    # Sign up Donor
    signup_donor_payload = {
        "Username": "Test Donor Org",
        "EmailID": donor_email,
        "password": password,
        "role": "Donor",
        "city": "Surat"
    }
    status, elapsed, body = request("POST", "/signup", signup_donor_payload)
    log_result("Auth API", "POST", "/signup (Donor)", 200, status, elapsed, f"Result: {body[:30]}")

    # Login Donor
    login_donor_payload = {
        "EmailID": donor_email,
        "password": password
    }
    status, elapsed, donor_token = request("POST", "/login", login_donor_payload)
    donor_token = donor_token.strip().replace('"', '')
    log_result("Auth API", "POST", "/login (Donor)", 200, status, elapsed, "Obtained Donor JWT token")

    # Sign up Receiver
    signup_receiver_payload = {
        "Username": "Test Hope Shelter",
        "EmailID": receiver_email,
        "password": password,
        "role": "Receiver",
        "city": "Surat"
    }
    status, elapsed, body = request("POST", "/signup", signup_receiver_payload)
    log_result("Auth API", "POST", "/signup (Receiver)", 200, status, elapsed, f"Result: {body[:30]}")

    # Login Receiver
    login_receiver_payload = {
        "EmailID": receiver_email,
        "password": password
    }
    status, elapsed, receiver_token = request("POST", "/login", login_receiver_payload)
    receiver_token = receiver_token.strip().replace('"', '')
    log_result("Auth API", "POST", "/login (Receiver)", 200, status, elapsed, "Obtained Receiver JWT token")

    # 4. Donor API Routes (with valid Donor Token)
    donor_endpoints = [
        ("GET", "/DonerHome/display", 200, "Get pending donations"),
        ("GET", "/DonerHome/display/pending", 200, "Get pending donations (alias)"),
        ("GET", "/DonerHome/display/Allocated", 200, "Get allocated donations"),
        ("GET", "/DonerHome/display/NotMatched", 200, "Get expired/unmatched donations"),
        ("GET", "/DonerHome/display/done", 200, "Get completed donations"),
    ]
    for m, path, exp, desc in donor_endpoints:
        status, elapsed, body = request(m, path, token=donor_token)
        log_result("Donor API", m, path, exp, status, elapsed, desc)

    # Post Donor Food
    add_food_payload = {
        "emailID": donor_email,
        "quntity": 20,
        "FoodName": "Fresh Meal Trays",
        "items": ["Rice", "Curry", "Bread"],
        "donationDateTime": time.strftime("%Y-%m-%dT%H:%M:%S"),
        "city": "Surat",
        "state": "Gujarat",
        "perfectLocation": "Ring Road Community Kitchen"
    }
    status, elapsed, body = request("POST", "/DonerHome", add_food_payload, token=donor_token)
    log_result("Donor API", "POST", "/DonerHome", 200, status, elapsed, f"Response: {body[:30]}")

    # 5. Receiver / NGO API Routes (with valid Receiver Token)
    receiver_endpoints = [
        ("GET", "/NGOs/display", 200, "Get pending requests"),
        ("GET", "/NGOs/display/pending", 200, "Get pending requests (alias)"),
        ("GET", "/NGOs/display/Allocated", 200, "Get allocated matched food"),
        ("GET", "/NGOs/display/NotMatched", 200, "Get expired/unmatched requests"),
        ("GET", "/NGOs/display/done", 200, "Get completed requests"),
    ]
    for m, path, exp, desc in receiver_endpoints:
        status, elapsed, body = request(m, path, token=receiver_token)
        log_result("Receiver API", m, path, exp, status, elapsed, desc)

    # Post NGO Requirement
    add_needed_payload = {
        "quntity": 15,
        "requestDateTime": time.strftime("%Y-%m-%dT%H:%M:%S"),
        "city": "Surat",
        "state": "Gujarat",
        "perfectLocation": "Shelter Ward 4"
    }
    status, elapsed, body = request("POST", "/NGOs", add_needed_payload, token=receiver_token)
    log_result("Receiver API", "POST", "/NGOs", 200, status, elapsed, f"Response: {body[:30]}")

    # 6. Cross-Role Authorization Checks (Donor accessing NGO route, and vice-versa)
    status, elapsed, _ = request("GET", "/NGOs/display", token=donor_token)
    log_result("Role Protection", "GET", "/NGOs/display (as Donor)", 403, status, elapsed, "Donor blocked from NGO API")

    status, elapsed, _ = request("GET", "/DonerHome/display", token=receiver_token)
    log_result("Role Protection", "GET", "/DonerHome/display (as Receiver)", 403, status, elapsed, "Receiver blocked from Donor API")

    # Output formatted summary table
    print("\n" + "=" * 90)
    print(f"{'Category':<16} | {'Method':<6} | {'Path':<32} | {'Exp':<4} | {'Act':<4} | {'Time':<7} | {'Status'}")
    print("-" * 90)
    for r in results:
        print(f"{r['category']:<16} | {r['method']:<6} | {r['path']:<32} | {r['expected']:<4} | {r['actual']:<4} | {r['elapsed_ms']:<7} | {r['status']}")
    print("=" * 90)

    all_passed = all(r["status"] == "PASS" for r in results)
    print(f"\nFinal Result: {'ALL ROUTES PASSED' if all_passed else 'SOME ROUTES FAILED'}")
    print(f"Total Routes Tested: {len(results)} | Passed: {sum(1 for r in results if r['status'] == 'PASS')} | Failed: {sum(1 for r in results if r['status'] == 'FAIL')}\n")

if __name__ == "__main__":
    test_all_routes()
