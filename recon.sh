#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <domain>"
    exit 1
fi

TARGET=$1
OUTPUT="recon_$TARGET"

mkdir -p "$OUTPUT"

echo "[+] Target: $TARGET"

echo "[+] Running whois..."
whois "$TARGET" > "$OUTPUT/whois.txt"

echo "[+] Running dig..."
dig "$TARGET" ANY > "$OUTPUT/dns.txt"

echo "[+] Running nslookup..."
nslookup "$TARGET" > "$OUTPUT/nslookup.txt"

echo "[+] Running ping..."
ping -c 4 "$TARGET" > "$OUTPUT/ping.txt"

echo "[+] Running traceroute..."
traceroute "$TARGET" > "$OUTPUT/traceroute.txt"

echo "[+] Running Nmap..."
nmap -sV -O "$TARGET" -oN "$OUTPUT/nmap.txt"

echo "[+] Gathering HTTP headers..."
curl -I "https://$TARGET" > "$OUTPUT/headers.txt" 2>/dev/null

echo "[+] Creating summary..."

{
echo "Target: $TARGET"
echo "Date: $(date)"
echo
echo "Files Generated:"
ls "$OUTPUT"
} > "$OUTPUT/summary.txt"

echo
echo "[✓] Recon complete."
echo "Results saved in: $OUTPUT"
