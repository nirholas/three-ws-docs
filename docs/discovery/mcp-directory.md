# MCP directory

`https://three.ws/.well-known/mcp.json` lists every hosted three.ws MCP server. All of them speak MCP over Streamable HTTP (JSON-RPC 2.0, `POST`).

```bash
curl -s https://three.ws/.well-known/mcp.json
```

## Pick a server

| Server | Endpoint | Auth | Use it for |
|---|---|---|---|
| three.ws | `https://three.ws/api/mcp` | OAuth 2.1, API key, or x402 | Avatars, model validation and inspection, agent data, memory |
| 3D Studio (free) | `https://three.ws/api/mcp-studio` | None | Free text-to-3D, image-to-3D, rigged avatars, the ready-made asset catalog |
| 3D Studio (paid) | `https://three.ws/api/mcp-3d` | OAuth 2.1 or x402 | Higher-end generation, rigging, retexture, optimization |
| Agent wallet | `https://three.ws/api/mcp-agent` | OAuth 2.1 | The agent's wallet: balance, find and pay services, monetize an endpoint |
| x402 Bazaar | `https://three.ws/api/mcp-bazaar` | OAuth 2.1 or x402 | Discover and price paid agent services |
| Grok | `https://three.ws/api/mcp-grok` | None, or OAuth for account tools | One connector for Grok Bot and the xAI API |

The live directory has a few more and is the source of truth. **Start with the free 3D Studio** if you do not have an account: no key, no payment.

## Connect a client

The fastest way:

```bash
npx three-ws setup
```

It signs you in, writes the servers into Claude Code, Claude Desktop, Cursor, Windsurf, VS Code, Codex, Gemini CLI or Hermes, and checks each with a live `tools/list`.

By hand, with configs you can paste: [snippets/mcp](../../snippets/mcp). Or use the guided page at [three.ws/connect](https://three.ws/connect).

## Server card

`https://three.ws/.well-known/mcp/server-card.json` describes the primary server (`https://three.ws/api/mcp`): name, version, transport, and accepted auth schemes (OAuth 2.1, API key, x402).

## Registry

Every server is also listed in the official MCP registry: <https://registry.modelcontextprotocol.io/?q=io.github.nirholas>.

## Safety

Pay attention to which tools can spend. The Grok server never lists a wallet or payment tool. For an allowlist of what an assistant may run without asking, three.ws publishes a ready-to-paste policy at `https://three.ws/api/mcp-policy`.
