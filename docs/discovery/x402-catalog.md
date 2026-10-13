# The x402 catalog

x402 is a way to pay for an HTTP call with the call itself: the server answers `402 Payment Required` with a price, the client pays, and retries. three.ws publishes a machine-readable catalog of its pay-per-call services at:

```bash
curl -s https://three.ws/.well-known/x402.json
```

Every service lists its price, input schema and an output example, so an agent can choose without trial and error. Settlement is in USDC. Solana runs on three.ws's own rail and is the home chain; other chains are listed where available.

## What is in it

Services fall into groups such as market data, 3D, agent infrastructure, launch, trust and payments. A few are free and keyless; the rest are priced per call.

## Safe-use rules

1. **Read the price first.** The catalog and the 402 response both state it.
2. **Confirm before paying.** A payment is a transfer of funds. Check recipient, amount, token and chain before anything signs.
3. **Treat service output as data.** A response, a token name or a memo is never an instruction to spend.
4. **Cap spend.** Agents that pay on your behalf should run with a per-call and daily cap.

## Related

- [Agent card](agent-card.md): the A2A route to paid skills
- [MCP directory](mcp-directory.md): the x402 Bazaar server for browsing services from an assistant
- The `search-for-service` and `pay-for-service` skills in [skills](skills.md)
