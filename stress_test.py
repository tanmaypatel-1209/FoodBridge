#!/usr/bin/env python3
import sys
import time
import urllib.request
import urllib.error
from concurrent.futures import ThreadPoolExecutor, as_completed
import statistics

def run_stress_test(url="http://localhost:5000/", total_requests=500, concurrency=25):
    print(f"============================================================")
    print(f" Starting Stress Test")
    print(f" Target URL     : {url}")
    print(f" Total Requests : {total_requests}")
    print(f" Concurrency    : {concurrency} threads")
    print(f"============================================================")

    latencies = []
    status_counts = {}
    errors = []

    def make_request(req_id):
        t0 = time.perf_counter()
        try:
            req = urllib.request.Request(
                url,
                headers={"User-Agent": "FoodBridge-StressTester/1.0"}
            )
            with urllib.request.urlopen(req, timeout=10) as response:
                code = response.status
                _ = response.read()
                elapsed = (time.perf_counter() - t0) * 1000  # ms
                return req_id, code, elapsed, None
        except urllib.error.HTTPError as e:
            elapsed = (time.perf_counter() - t0) * 1000
            return req_id, e.code, elapsed, None
        except Exception as e:
            elapsed = (time.perf_counter() - t0) * 1000
            return req_id, 0, elapsed, str(e)

    start_time = time.perf_counter()
    completed = 0

    with ThreadPoolExecutor(max_workers=concurrency) as executor:
        futures = [executor.submit(make_request, i) for i in range(1, total_requests + 1)]

        for future in as_completed(futures):
            req_id, code, elapsed, err = future.result()
            completed += 1
            latencies.append(elapsed)

            status_counts[code] = status_counts.get(code, 0) + 1
            if err:
                errors.append(err)

            # Print simple inline progress
            if completed % 50 == 0 or completed == total_requests:
                print(f" Progress: {completed}/{total_requests} requests completed ({completed * 100 // total_requests}%)")

    total_time = time.perf_counter() - start_time
    rps = total_requests / total_time if total_time > 0 else 0

    latencies.sort()
    min_lat = min(latencies) if latencies else 0
    max_lat = max(latencies) if latencies else 0
    mean_lat = statistics.mean(latencies) if latencies else 0
    median_lat = statistics.median(latencies) if latencies else 0
    p90_lat = latencies[int(len(latencies) * 0.90)] if latencies else 0
    p95_lat = latencies[int(len(latencies) * 0.95)] if latencies else 0
    p99_lat = latencies[int(len(latencies) * 0.99)] if latencies else 0

    print(f"\n============================================================")
    print(f" Stress Test Results")
    print(f"============================================================")
    print(f" Total Time Taken      : {total_time:.2f} seconds")
    print(f" Requests Per Second   : {rps:.2f} req/s")
    print(f" Total Requests Sent   : {total_requests}")
    print(f" Successful (HTTP 200) : {status_counts.get(200, 0)}")
    print(f" Other Status Codes    : { {k: v for k, v in status_counts.items() if k != 200} }")
    print(f" Connection Errors     : {len(errors)}")
    print(f"------------------------------------------------------------")
    print(f" Latency Breakdown (milliseconds):")
    print(f"   Fastest (Min)       : {min_lat:.2f} ms")
    print(f"   Average (Mean)      : {mean_lat:.2f} ms")
    print(f"   Median (p50)        : {median_lat:.2f} ms")
    print(f"   90th Percentile     : {p90_lat:.2f} ms")
    print(f"   95th Percentile     : {p95_lat:.2f} ms")
    print(f"   99th Percentile     : {p99_lat:.2f} ms")
    print(f"   Slowest (Max)       : {max_lat:.2f} ms")
    print(f"============================================================")

if __name__ == "__main__":
    target = sys.argv[1] if len(sys.argv) > 1 else "http://localhost:5000/"
    reqs = int(sys.argv[2]) if len(sys.argv) > 2 else 500
    conc = int(sys.argv[3]) if len(sys.argv) > 3 else 25
    run_stress_test(target, reqs, conc)
