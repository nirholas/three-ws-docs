# Skills for assistants

`https://three.ws/skill.md` is a single entry-point skill in the open [Agent Skills](https://agentskills.io/specification) format. An assistant can load it before it knows which focused skill it needs. It explains how to reach the platform and which focused skill to load for each job.

```bash
curl -s https://three.ws/skill.md
```

## The pack

The focused skills are folders with a `SKILL.md` whose description is the trigger. They cover:

| Group | Examples |
|---|---|
| 3D and creative | find a ready-made asset, generate a model, create a rigged avatar, rig an existing GLB |
| Building on three.ws | create an agent, author an in-app skill, sell a skill, hire an agent, connect an MCP client |
| Wallet and payments | authenticate a wallet, fund, send, find and pay for a paid service, monetize an endpoint |

Full list and install paths: the [Agent Skills pack](https://github.com/nirholas/three.ws/blob/main/docs/agent-skills.md) in the product repository.

## Skills versus in-app skills

Agent Skills extend **external** assistants with three.ws abilities. The in-app skill format (`manifest.json`, `tools.json`, `handlers.js`) extends avatars and agents **inside** three.ws. They are different things; see [Tutorials](../tutorials/README.md).
