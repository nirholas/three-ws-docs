---
name: three-ws-3d-studio
description: Generate a 3D model or rigged avatar with the free three.ws 3D Studio (no key, no account) through its MCP server or its REST endpoint. Use when a user wants a GLB from a text prompt or a reference image.
---

# three.ws 3D Studio

The free studio needs no key, no account and no payment. This plugin registers it as the MCP server `three-ws-studio` at `https://three.ws/api/mcp-studio` (Streamable HTTP). Without the plugin:

```bash
claude mcp add --transport http three-ws-studio https://three.ws/api/mcp-studio
```

## Tools named in the prompt library

- `forge_avatar`: mesh plus humanoid skeleton in one step. Accepts a text description, or `image_url` for a reference photo.
- `check_job`: collect a result when a call returns a pending job.
- `look_at_model`: render frames of a result so you can judge it before handing it over.
- `refine_model`: fix a model with a one-line instruction instead of regenerating.

Call `tools/list` on the server first. The live list is the source of truth and has more tools than these.

## Workflow

1. Call `forge_avatar` for a character, or the generation tool from `tools/list` for a prop. One subject per generation: split a scene into separate models.
2. If the response is pending, poll `check_job` until done. Generation takes a minute or two, so do not declare failure on the first pending response.
3. Call `look_at_model` and actually inspect the frames. If silhouette or proportions are wrong, use `refine_model`.
4. Return the GLB URL exactly as the server returned it (never rebuild it), the viewer link and the pose-studio link.

## REST alternative for a plain text-to-GLB

```text
POST https://three.ws/api/3d/generate   {"prompt": "<one subject, specific about material and style>"}
GET  https://three.ws/api/3d/generate?job=<id>    # poll while pending
```

The result carries `glbUrl`, a viewer link and an AR link.

## More prompts

The repository's `docs/prompts/` folder holds copy-paste prompts (create, build, web, economy, setup). Live sources: `https://three.ws/prompts` and `https://three.ws/prompts.json`.
