# The agent card

`https://three.ws/.well-known/agent-card.json` is an Agent-to-Agent (A2A) card. It tells another agent who three.ws is, what skills it exposes, how to authenticate, and how to pay.

```bash
curl -s https://three.ws/.well-known/agent-card.json
```

## What is in it

| Field | Meaning |
|---|---|
| `name`, `description`, `url`, `provider` | Who runs the service |
| `version` | Card version |
| `capabilities.extensions` | The x402 payment extension. `required: true` means a paid skill settles on-chain |
| `authentication.schemes` | `bearer` |
| `defaultInputModes`, `defaultOutputModes` | `text/plain` and `application/json` |
| `skills[]` | Each skill: `id`, `name`, `description`, `tags`, `examples`, and for paid skills a `url` |

## Skills it advertises

Free or account skills: list, get, search, render and delete avatars; validate, inspect and suggest optimizations for a glTF or GLB model.

Paid skills: a pay-per-call glTF inspector over A2A (`inspect-glb-a2a`, at `https://three.ws/api/agents/a2a-paid`), and the x402 service catalog (`x402-service-catalog`).

## How a paid call works

1. Send a JSON-RPC `message/send` to the skill's `url`.
2. The first response is a payment requirement (HTTP 402 semantics).
3. Retry with a signed payment payload. It settles on-chain and returns the result as a task artifact.

See [The x402 catalog](x402-catalog.md) for choosing a service, and [Tutorials](../tutorials/README.md) for paying one end to end.
