#!/usr/bin/env bash
# Check that every three.ws machine-readable entry point answers 200.
set -euo pipefail
for p in .well-known/agent-card.json .well-known/mcp.json .well-known/mcp/server-card.json \
         .well-known/x402.json .well-known/assetlinks.json llms.txt llms-full.txt skill.md prompts.json; do
  code=$(curl -s -o /dev/null -w '%{http_code}' "https://three.ws/$p")
  printf '%-40s %s\n' "$p" "$code"
done
