# ReconX

> A lightweight Bash automation script for authorized reconnaissance during penetration testing and bug bounty engagements.

## Overview

ReconX automates several common reconnaissance tasks and stores the results in a structured directory, making it easier to review information before beginning manual security testing.

The script is intended for **authorized security assessments only** and does not perform exploitation or vulnerability attacks.

---

## Features

* Domain WHOIS lookup
* DNS record enumeration
* Hostname resolution
* ICMP connectivity check
* Traceroute analysis
* Nmap service and version detection
* HTTP response header collection
* Automatic report organization

---

## Project Structure

```text
recon_<target>/
│
├── whois.txt
├── dns.txt
├── nslookup.txt
├── ping.txt
├── traceroute.txt
├── nmap.txt
├── headers.txt
└── summary.txt
```

---

## Requirements

Make sure the following tools are installed:

* Bash
* whois
* dig
* nslookup
* ping
* traceroute
* nmap
* curl

---

## Installation

Clone the repository:

```bash
git clone https://github.com/yourusername/reconx.git
cd reconx
```

Make the script executable:

```bash
chmod +x recon.sh
```

---

## Usage

Run ReconX against a domain:

```bash
./recon.sh example.com
```

Example:

```bash
./recon.sh example.com
```

---

## Sample Output

```text
[+] Target: example.com

[+] Running whois...
[+] Running dig...
[+] Running nslookup...
[+] Running ping...
[+] Running traceroute...
[+] Running Nmap...
[+] Gathering HTTP headers...

[✓] Recon complete.
Results saved in: recon_example.com
```

---

## Generated Reports

After execution, ReconX creates a dedicated directory containing:

| File           | Description                      |
| -------------- | -------------------------------- |
| whois.txt      | WHOIS information                |
| dns.txt        | DNS records                      |
| nslookup.txt   | Name resolution output           |
| ping.txt       | Connectivity test                |
| traceroute.txt | Network path information         |
| nmap.txt       | Open ports and detected services |
| headers.txt    | HTTP response headers            |
| summary.txt    | Execution summary                |

---

## Workflow

```text
Target
   │
   ▼
WHOIS
   │
   ▼
DNS Enumeration
   │
   ▼
Hostname Resolution
   │
   ▼
Ping
   │
   ▼
Traceroute
   │
   ▼
Nmap Scan
   │
   ▼
HTTP Headers
   │
   ▼
Generate Report
```

---

## Use Cases

* Penetration testing
* Bug bounty reconnaissance
* External attack surface mapping
* Initial asset discovery
* Security assessments
* Network documentation

---

## Roadmap

Future improvements may include:

* Subdomain enumeration
* Live host detection
* Screenshot capture
* Technology fingerprinting
* Historical URL collection
* Report generation (HTML/PDF)
* JSON output
* Parallel execution
* Configuration file support
* Colored terminal output
* Logging and timestamps

---

## Disclaimer

This project is intended **only for authorized security testing**. Always obtain explicit permission before scanning or assessing systems you do not own or manage. The author assumes no responsibility for misuse of this software.

---



---

## Author

Developed for learning, automation, and ethical cybersecurity research.
     - A.C.HARIHARAN
