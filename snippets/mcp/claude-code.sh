# Free 3D Studio: no account, no key, no payment.
claude mcp add --transport http three-ws-studio https://three.ws/api/mcp-studio

# The account server (OAuth 2.1 on first use): avatars, agents, memory.
claude mcp add --transport http three-ws https://three.ws/api/mcp

# Or configure every client on this machine at once:
npx three-ws setup
