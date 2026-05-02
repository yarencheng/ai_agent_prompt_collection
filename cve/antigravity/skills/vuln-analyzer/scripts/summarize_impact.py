import json
import sys

def summarize_cve(cve_path):
    try:
        with open(cve_path, 'r') as f:
            data = json.load(f)
        
        cve_id = data.get('cveMetadata', {}).get('cveId', 'Unknown')
        state = data.get('cveMetadata', {}).get('state', 'Unknown')
        
        cna = data.get('containers', {}).get('cna', {})
        description = cna.get('descriptions', [{}])[0].get('value', 'No description.')
        
        # Collect all metrics
        metrics = []
        # From CNA
        for m in cna.get('metrics', []):
            metrics.append({'source': 'CNA', 'data': m})
        
        # From ADPs
        for adp in data.get('containers', {}).get('adp', []):
            source = adp.get('providerMetadata', {}).get('shortName', 'ADP')
            for m in adp.get('metrics', []):
                metrics.append({'source': source, 'data': m})
        
        print(f"CVE ID: {cve_id}")
        print(f"State: {state}")
        print(f"Description: {description[:200]}...")
        print("-" * 20)
        print("Metrics:")
        for m in metrics:
            d = m['data']
            if 'cvssV4_0' in d:
                v = d['cvssV4_0']
                print(f"[{m['source']}] CVSS v4.0: {v.get('baseScore')} ({v.get('baseSeverity')}) - {v.get('vectorString')}")
            elif 'cvssV3_1' in d:
                v = d['cvssV3_1']
                print(f"[{m['source']}] CVSS v3.1: {v.get('baseScore')} ({v.get('baseSeverity')}) - {v.get('vectorString')}")
            elif 'cvssV3_0' in d:
                v = d['cvssV3_0']
                print(f"[{m['source']}] CVSS v3.0: {v.get('baseScore')} ({v.get('baseSeverity')}) - {v.get('vectorString')}")
        
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 summarize_impact.py <path-to-cve.json>")
        sys.exit(1)
    summarize_cve(sys.argv[1])
