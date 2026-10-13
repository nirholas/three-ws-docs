# Connect an assistant

**You will end with:** your assistant able to generate a real 3D model and hand you the file.

## 1. Add the free studio

No account, no key, no payment.

Claude Code:

```bash
claude mcp add --transport http three-ws-studio https://three.ws/api/mcp-studio
```

Cursor: add this to `mcp.json`.

```json
{ "mcpServers": { "three-ws-studio": { "url": "https://three.ws/api/mcp-studio" } } }
```

VS Code: add this to `.vscode/mcp.json`.

```json
{ "servers": { "three-ws-studio": { "type": "http", "url": "https://three.ws/api/mcp-studio" } } }
```

Claude apps: Customize, Connectors, Add custom connector, URL `https://three.ws/api/mcp-studio`, authentication **None**.

To configure every client on a machine in one go: `npx three-ws setup`.

## 2. Prove it works

Paste this to your assistant:

```text
List the tools the three.ws studio exposes, one line each. Then generate "a small brass desk lamp" and give me the GLB URL and the viewer link.
```

You should get a tool list, then a link to a real GLB that opens in the browser.

## 3. Go further

The [prompt library](../prompts/README.md) has ready prompts for avatars, embeds and the agent economy. When you want an account-aware server (your agents, memory, wallet), add `https://three.ws/api/mcp` and sign in with OAuth when asked.

## Safety

Servers that can spend are separate and require sign-in. Read any payment request fully (recipient, amount, token, chain) before you approve it.
