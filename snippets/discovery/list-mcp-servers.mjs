// List every hosted three.ws MCP server with its endpoint and auth model.
const res = await fetch('https://three.ws/.well-known/mcp.json');
if (!res.ok) throw new Error(`mcp.json returned ${res.status}`);
const { servers } = await res.json();
for (const s of servers) console.log(`${s.name.padEnd(18)} ${s.endpoint}  [${s.auth}]`);
