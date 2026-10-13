# Make 3D things

Models, rigged avatars, refinements, and the checks that keep you from shipping a broken mesh.

Paste any prompt below into Claude, or any assistant that can reach the [three.ws MCP servers](../discovery/mcp-directory.md). Each one says what you get back. Source of truth: [three.ws/prompts](https://three.ws/prompts) and [prompts.json](https://three.ws/prompts.json).

## Turn a sentence into a 3D model

The free, keyless text to GLB lane, with the polling your agent usually gets wrong.

**Setup needed:** none  
**Returns:** A downloadable GLB, a viewer link, and an AR link that opens on a phone.

```text
Make me a 3D model of <a weathered brass diving helmet>. Use the free three.ws API: no key, no account.

 POST https://three.ws/api/3d/generate {"prompt": "<one subject, specific about material and style>"}

If the response comes back pending it hands you a job id: poll GET https://three.ws/api/3d/generate?job=<id> until it is done. Generation takes a minute or two, so keep polling instead of declaring failure on the first pending response.

Give me the glbUrl exactly as returned (do not rebuild the URL yourself), the viewer link, the AR link and the file size. One subject per generation: if what I asked for is really a scene, split it into separate models and tell me you did.
```

## Generate a rigged avatar from a description

Mesh plus humanoid skeleton in one call, then looked at before it is handed to you.

**Setup needed:** mcp-studio  
**Returns:** A rigged GLB you can animate, plus rendered frames so you can judge it without downloading anything.

```text
Generate a rigged, animation-ready 3D avatar from this description: <a tall elf ranger in a weathered green cloak>.

Use the three.ws 3D Studio MCP server. forge_avatar does the mesh and the humanoid skeleton in one step, so use that rather than generating and rigging separately. If it returns a pending job, collect it with check_job.

Before you tell me it is done, call look_at_model on the result and actually look at the frames. If the silhouette or the proportions are wrong, fix it with refine_model and a one-line instruction rather than starting over, and show me both versions.

Hand me the rigged GLB URL, the renders, and the link that opens it in the pose studio.
```

## Turn a photo into a 3D avatar

A reference image becomes a rigged humanoid, with an honest verdict on the likeness.

**Setup needed:** mcp-studio  
**Returns:** A rigged avatar from your photo, and a straight answer about the likeness.

```text
Turn this reference image into a 3D avatar: <https://example.com/photo.jpg>

Use forge_avatar on the three.ws 3D Studio MCP server with image_url set to that image, so I get a rigged humanoid rather than a static bust. Collect it with check_job if it comes back pending.

Then look_at_model it from the front and the three-quarter view and tell me honestly whether it reads as the reference. If it does not, say what in the image is fighting it (lighting, crop, occlusion, hair) and what I should re-shoot.
```

## Rig a GLB you already have

Add a humanoid skeleton and skin weights to a static model, and hear whether it was worth it.

**Setup needed:** mcp-studio  
**Returns:** A rigged GLB plus a pose-studio link to check the joints.

```text
Rig this GLB so it can be animated: <https://example.com/character.glb>

Use rig_mesh on the three.ws 3D Studio MCP server. It adds a humanoid skeleton and skin weights and returns a new GLB.

Tell me whether the source mesh was actually humanoid enough to rig well, what came back, and give me the pose-studio link so I can check that the joints bend where they should. If the model is clearly not humanoid, say so before spending the call.
```

## Search the catalog before generating anything

Thousands of ready-made CC0 objects, characters and motion clips. A real asset usually beats a fresh generation.

**Setup needed:** none  
**Returns:** A ready-to-use CC0 asset, or a generated one plus the reason the catalog could not cover it.

```text
I need <an industrial desk lamp> for a scene. Check the three.ws catalog before generating anything: it holds thousands of ready-made CC0 objects, rigged characters and motion clips.

 curl -s 'https://three.ws/api/catalog?q=<query>&kind=object&limit=8'

Show me the top matches with title, license, file size and thumbnail. If one of them fits, hand me its GLB URL and stop there. Only if nothing fits, generate one with POST https://three.ws/api/3d/generate, and say in one line why the catalog missed.
```

## Generate a whole asset kit with a manifest

Six props, one subject per call, retried on failure, and written down so you can find them tomorrow.

**Setup needed:** none  
**Returns:** A folder's worth of props and a manifest file that survives the session.

```text
Build me an asset kit for <a small medieval market scene>: six props, generated one subject at a time.

Plan the list first and show it to me before you spend a single call. Then generate each one through the free three.ws lane (POST https://three.ws/api/3d/generate), poll each job to completion, and keep going if one fails: retry that prop once with a tightened prompt, and report it if it still does not land.

Finish with a markdown table of prop, the prompt you used, the GLB URL and the viewer link, and write it to assets/kit.md so I have the manifest.
```

## Run a whole asset job with the skills installed

Search first, generate only if needed, rig if it is a character, validate before handing it over.

**Setup needed:** skills  
**Returns:** One finished, validated asset and a clear account of which lane produced it.

```text
I need <a hero prop for the landing page: a chunky retro synthesizer>. Use the three.ws skills you already have and run the whole job, not just the first step.

Order matters. Search the catalog first with find-3d-assets, because a ready-made CC0 asset beats a generation on both quality and time. If nothing fits, generate it with generate-3d-model. If what I described is a character rather than a prop, use create-3d-avatar instead so it comes back rigged.

Validate the result before you hand it over: file weight, triangle count, texture sizes, and a plain answer on whether it belongs in a hero section on a phone.

Tell me which skill did the work and why you picked it, and give me the GLB URL, the viewer link, and the embed snippet if it is something I can put on the page.
```

## Change a model without starting over

Describe the change in words. Keep the lineage. Compare the versions side by side.

**Setup needed:** mcp-studio  
**Returns:** A revised model, both versions side by side, and a stop rule so you are not iterating forever.

```text
Here is a model I already generated: <GLB URL>. I want <the helmet bigger and the metal darker>.

Use refine_model on the three.ws 3D Studio MCP server with that instruction rather than generating something new: it keeps the version lineage so I can compare.

Show me before and after with look_at_model and keep both URLs. If two refinements in a row miss, say so and propose a fresh prompt instead of burning more calls.
```

## Ask whether a model can actually be printed

A free printability report: closed solid, thin walls, volume, and a score with named deductions.

**Setup needed:** none  
**Returns:** A manufacturing verdict on your mesh, and a fix list in priority order.

```text
Can this model actually be 3D printed? <GLB URL>

 POST https://three.ws/api/print/quote {"glbUrl": "<url>"}

It is free and keyless, and asking orders nothing. Give me the printability score with its named deductions, whether the mesh is a closed solid, how many separate bodies it contains, the thinnest wall and the enclosed volume.

Then tell me in plain language what to fix before printing, ordered by how much it matters.
```

## Give a model a name and a voice

Turn a GLB into a persistent character your Claude can bring back in a later session.

**Setup needed:** mcp-studio  
**Returns:** A named, reusable 3D character that speaks, plus the id that brings it back.

```text
Give this model a name and a voice so it can speak in our conversations: <GLB URL, or generate one first>.

Use the three.ws 3D Studio MCP server: create_agent_persona turns the GLB into a named persistent body, and persona_say makes it perform a line with lip-sync and a matching expression.

Name it <Ada>, describe its personality in one line, then have it introduce itself. Give me the persona_id so I can bring the same body back in a new session with get_agent_persona.
```
