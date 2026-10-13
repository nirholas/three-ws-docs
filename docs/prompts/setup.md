# Connect it to your Claude

Two prompts that leave your Claude able to build 3D for you in every session after this one.

Paste any prompt below into Claude, or any assistant that can reach the [three.ws MCP servers](../discovery/mcp-directory.md). Each one says what you get back. Source of truth: [three.ws/prompts](https://three.ws/prompts) and [prompts.json](https://three.ws/prompts.json).

## Connect the free 3D studio to Claude

One prompt that installs the free MCP server and proves it works by generating a model.

**Setup needed:** none  
**Returns:** A connected MCP server, its tool list, and one real GLB you can open in the browser.

```text
Connect the free three.ws 3D Studio to this session so you can make 3D models for me.

It is a remote MCP server with no account, no API key and no payment:

 claude mcp add --transport http three-ws-studio https://three.ws/api/mcp-studio

If this environment has no Claude Code CLI, tell me where to paste the URL instead: the Claude apps take it as a custom connector with authentication set to None.

Once it is connected, list the tools it exposes with one line each, then prove the path end to end by generating "a small brass desk lamp" and handing me the GLB URL and the viewer link.
```

## Install the three.ws skills in your project

Teach your Claude the platform once, so later prompts can be one sentence long.

**Setup needed:** none  
**Returns:** The skills installed in the right place for your setup, plus a table of what each one does.

```text
Set up the three.ws Agent Skills in this project so you know how to drive the platform without me explaining it every time.

Read https://three.ws/docs/agent-skills first, then take whichever install path fits this environment:
- Claude Code with plugins: add the marketplace nirholas/three.ws and install three-ws-core@three-ws.
- Anything else: copy the skill folders out of github.com/nirholas/three.ws/tree/main/.agents/skills into .claude/skills/.

I want the 3D set at minimum: find-3d-assets, generate-3d-model, create-3d-avatar, rig-a-model.

Tell me which path you took, which skills landed, and give me one sentence per skill on what it triggers on. Do not install the wallet or trading skills unless I ask for them.
```
