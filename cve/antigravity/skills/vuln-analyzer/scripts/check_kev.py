import json
import sys
import os

def check_kev(cve_id, kev_path):
    if not os.path.exists(kev_path):
        print(f"Error: KEV file not found at {kev_path}")
        return False
    
    try:
        with open(kev_path, 'r') as f:
            kev_data = json.load(f)
            
        # KEV structure usually has a 'vulnerabilities' list
        vulns = kev_data.get('vulnerabilities', [])
        for vuln in vulns:
            if vuln.get('cveID') == cve_id:
                print(f"MATCH: {cve_id} found in KEV catalog.")
                print(f"Date Added: {vuln.get('dateAdded')}")
                print(f"Due Date: {vuln.get('dueDate')}")
                return True
        
        print(f"INFO: {cve_id} not found in KEV catalog.")
        return False
    except Exception as e:
        print(f"Error parsing KEV: {e}")
        return False

if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: python3 check_kev.py <CVE-ID> <path-to-kev.json>")
        sys.exit(1)
    
    check_kev(sys.argv[1], sys.argv[2])
