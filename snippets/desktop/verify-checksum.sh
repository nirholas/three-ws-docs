#!/usr/bin/env bash
# Usage: verify-checksum.sh <downloaded-file>
# Compares the file's SHA-256 with the one in the live release feed.
set -euo pipefail
file="$1"; name="$(basename "$file")"
want=$(curl -s https://three.ws/releases/desktop/release.json | node -e '
let s="";process.stdin.on("data",d=>s+=d).on("end",()=>{
  const f=JSON.parse(s).files.find(f=>f.name===process.argv[1]);
  if(!f){console.error("not in the release feed: "+process.argv[1]);process.exit(2)}
  console.log(f.sha256)})' "$name")
got=$(sha256sum "$file" | cut -d' ' -f1)
if [ "$want" = "$got" ]; then echo "OK  $name"; else echo "MISMATCH  $name"; echo " want $want"; echo " got  $got"; exit 1; fi
