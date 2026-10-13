# Agent discovery

three.ws is built to be found and used by software, not only by people. Every machine-readable entry point is a plain file or endpoint you can fetch with one request, so an agent can learn what the platform offers, how to connect, and what it costs without scraping a page.

| Entry point | URL | What it is |
|---|---|---|
| [Well-known files](well-known.md) | `/.well-known/*` | The index of discovery documents |
| [Agent card](agent-card.md) | `/.well-known/agent-card.json` | A2A agent card: skills, auth, payment extension |
| [MCP directory](mcp-directory.md) | `/.well-known/mcp.json` | Every hosted MCP server with transport, auth and prompts |
| [MCP server card](mcp-directory.md#server-card) | `/.well-known/mcp/server-card.json` | The primary server's card |
| [llms.txt](llms-txt.md) | `/llms.txt`, `/llms-full.txt` | Plain-text map of the site for language models |
| [x402 catalog](x402-catalog.md) | `/.well-known/x402.json` | Every pay-per-call service with price and schema |
| [Skills](skills.md) | `/skill.md` | One entry-point skill an agent can load before it knows what it needs |
| [Prompts](../prompts/README.md) | `/prompts.json`, `/prompts.txt` | The prompt library as structured data and plain text |

## One command to see it all

```bash
for p in .well-known/agent-card.json .well-known/mcp.json .well-known/x402.json llms.txt skill.md prompts.json; do
  printf '%s  ' "$p"; curl -s -o /dev/null -w '%{http_code}\n' "https://three.ws/$p"
done
```

Every line should print `200`. Copyable versions of these fetches are in [snippets/discovery](../../snippets/discovery).

## Order to read them in

1. [llms.txt](llms-txt.md) for orientation.
2. [MCP directory](mcp-directory.md) to pick a server and connect.
3. [Agent card](agent-card.md) if you speak A2A.
4. [x402 catalog](x402-catalog.md) when you need to find and pay for a service.
