# Well-known files

three.ws publishes these under `https://three.ws/.well-known/`.

| File | Purpose |
|---|---|
| `agent-card.json` | A2A agent card: name, skills, authentication, the x402 payment extension |
| `agent.json`, `agent-registration.json` | Agent identity and registration documents |
| `3d-agent-card.json` and its schema | The card for a 3D agent, with a JSON Schema to validate against |
| `mcp.json` | Directory of every hosted MCP server and per-client setup hints |
| `mcp/server-card.json` | The primary MCP server's card |
| `x402.json` | The pay-per-call service catalog |
| `openapi.yaml`, `3d-studio-openapi.yaml` | OpenAPI descriptions of the public APIs |
| `ai-plugin.json` | Plugin manifest for assistants that read it |
| `assetlinks.json` | Android Digital Asset Links: which app may open three.ws links ([Verify the APK](../android/verify.md)) |
| `security.txt` | Where to report a vulnerability |

The set evolves. The authoritative list is what the server returns, so fetch the file you need rather than relying on this table:

```bash
curl -s https://three.ws/.well-known/mcp.json
```

## Rules for consumers

- Treat every field you do not recognize as optional and ignore it. Some documents carry three.ws extensions that are not part of any specification.
- Cache with care. These files change when the platform ships.
- Never put a secret in a request to discover. Discovery is public and needs no credential.
