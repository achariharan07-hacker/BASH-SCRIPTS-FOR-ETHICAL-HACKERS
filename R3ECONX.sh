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

echo "[+] Enumerating subdomains..."

if command -v subfinder >/dev/null 2>&1; then
    subfinder -d "$TARGET" -silent > "$OUTPUT/subfinder.txt"
else
    echo "[!] subfinder not found." > "$OUTPUT/subfinder.txt"
fi

if command -v assetfinder >/dev/null 2>&1; then
    assetfinder --subs-only "$TARGET" > "$OUTPUT/assetfinder.txt"
else
    echo "[!] assetfinder not found." > "$OUTPUT/assetfinder.txt"
fi

cat "$OUTPUT"/subfinder.txt "$OUTPUT"/assetfinder.txt 2>/dev/null | \
sort -u > "$OUTPUT/subdomains.txt"

echo "[+] Found $(wc -l < "$OUTPUT/subdomains.txt") unique subdomains."

echo "[+] Creating summary..."

{
echo "Target: $TARGET"
echo "Date: $(date)"
echo
echo "Files Generated:"
ls "$OUTPUT"
echo
echo "Subdomains Found: $(wc -l < "$OUTPUT/subdomains.txt")"
} > "$OUTPUT/summary.txt"

echo
echo "[✓] Recon complete."
echo "[✓] Results saved in: $OUTPUT"

