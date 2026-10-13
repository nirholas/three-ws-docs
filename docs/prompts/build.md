# Build on the platform

Wire three.ws into your own agent, your own toolchain, your own dashboards.

Paste any prompt below into Claude, or any assistant that can reach the [three.ws MCP servers](../discovery/mcp-directory.md). Each one says what you get back. Source of truth: [three.ws/prompts](https://three.ws/prompts) and [prompts.json](https://three.ws/prompts.json).

## Brief me on $THREE from the source

Live token stats from the platform's own endpoint, with no predictions attached.

**Setup needed:** none  
**Returns:** A factual $THREE briefing straight from the platform, ready to paste into a report.

```text
Give me the live state of $THREE, the three.ws token, from the platform's own endpoint rather than a third-party aggregator:

 curl -s https://three.ws/api/three-token/stats

Report price, 24 hour change, market cap, 24 hour volume, holders and liquidity, with the mint address, and say how fresh the data is.

Then three sentences on what changed since yesterday. Numbers only: no price predictions, no advice.
```

## Wire the 3D API into your own agent

Generate clients from the real OpenAPI 3.1 spec, and test against a real generation.

**Setup needed:** none  
**Returns:** Typed clients, correct polling, and a test that proves the integration against production.

```text
Wire the free three.ws 3D API into <my agent> from its OpenAPI spec instead of hand-writing clients:

 https://three.ws/api/3d/openapi.json

It is a real OpenAPI 3.1 document and it is keyless. Generate typed callers for the endpoints I need, and wrap the queued endpoints so a pending response polls to completion inside my client instead of leaking a job id into my application code.

Write one integration test that generates a real model and asserts a GLB comes back. A real call, not a mock.
```

## Give an agent you already built a body

Take an existing bot or app and put a reactive 3D face on it, driven by real state.

**Setup needed:** none  
**Returns:** Your existing agent with a 3D presence wired to its real lifecycle, plus the gaps named.

```text
I have <an agent / a bot / a dashboard> at <path or URL>. Give it a body: a 3D avatar that reacts to what it is actually doing.

Read https://three.ws/docs/embedding, then wire the avatar to real state, not to a timer: thinking while a request is in flight, talking while it streams a reply, idle when it is waiting, and a visible error posture when a call fails.

Map every state my app can be in to an animation, list the ones I have no mapping for, and show me the whole thing running against real traffic rather than a demo loop.
```
