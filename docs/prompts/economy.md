# The agent economy

Find a paid API, sell your own, pay for a call. Anything that moves money stops for your confirmation.

Paste any prompt below into Claude, or any assistant that can reach the [three.ws MCP servers](../discovery/mcp-directory.md). Each one says what you get back. Source of truth: [three.ws/prompts](https://three.ws/prompts) and [prompts.json](https://three.ws/prompts.json).

## Find a paid API your agent can call

Search the x402 bazaar, price the best match, pay for nothing without your say-so.

**Setup needed:** none  
**Returns:** A shortlist of real paid endpoints with prices, and nothing spent.

```text
Find me a paid API for <turning a wallet address into a company profile> in the x402 agent economy: per-call USDC, no signup.

Searching is keyless:

 npx awal@2.10.0 x402 bazaar search "<what I need>" --json

For the top matches show me what each one does, the price per call, the chain and the exact endpoint. Then inspect the best one with `npx awal@2.10.0 x402 details <url>` and tell me what a single call would really cost me.

Do not pay for anything. I will decide.
```

## Charge other agents for your API

A real 402, a real settle, and a verified paid call before anyone calls it done.

**Setup needed:** wallet  
**Returns:** An endpoint that charges per call, proven with a real 402 and a real 200.

```text
Turn <this endpoint> into a paid API other agents can call per request, using x402.

Read https://three.ws/tutorials/paid-x402-endpoint first, then wire it for real: the 402 response with correct payment requirements, the settle path, and a price that honestly covers what the call costs me to serve.

Verify it end to end before you tell me it works: curl it and show me the 402, then pay it once on a test network and show me the 200.

Use a test network for that paid call. If anything you propose would spend real funds, stop and wait for my yes with the amount and the recipient in front of me.

Finish with the one-paragraph listing I can publish so agents discover it.
```

## Pay for one call, with a hard stop first

Price it, show you recipient and amount, and wait for your yes before any money moves.

**Setup needed:** wallet  
**Returns:** A priced, confirmed, single payment and the response you paid for.

```text
I want to use this paid endpoint: <URL>. Walk it through properly.

First inspect it without paying: `npx awal@2.10.0 x402 details <url>`. Show me the price, the chain, the asset and who gets paid, as a table.

Then stop and wait. Do not send a payment, sign anything or run the pay command until I have confirmed that exact amount and that exact recipient.

After I confirm, pay once, show me the response, and tell me what the call actually cost.
```

## Check the agent wallet before you rely on it

One verdict line: can this wallet pay for a call right now, yes or no.

**Setup needed:** wallet  
**Returns:** A one-glance verdict on whether your wallet can transact, and the one fix if it cannot.

```text
Give me a straight status report on my agent wallet before I rely on it.

Check which addresses it holds (Solana first, then any EVM legs), the balance of each, whether it can actually sign right now, and anything that would make a payment fail: empty gas, an unfunded chain, an expired session.

Present it as a table with a verdict line at the top: can this wallet pay for a call right now, yes or no. If the answer is no, give me the single action that fixes it.

Do not move any funds.
```
