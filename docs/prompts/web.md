# Put it on your site

The embed, the framework wrapper, the concierge, and what to do when an embed goes dark.

Paste any prompt below into Claude, or any assistant that can reach the [three.ws MCP servers](../discovery/mcp-directory.md). Each one says what you get back. Source of truth: [three.ws/prompts](https://three.ws/prompts) and [prompts.json](https://three.ws/prompts.json).

## Put a live avatar on your page

The web component, the pinned production snippet with SRI, and the states most embeds forget.

**Setup needed:** none  
**Returns:** A working embed on your page and the exact snippet to ship.

```text
Put a live 3D avatar on <index.html> using the three.ws <agent-3d> web component.

Read https://three.ws/docs/embedding first so you use the real attributes instead of inventing them.

Prototype against the latest channel, then give me the production snippet: a pinned version plus the SRI hash from https://three.ws/agent-3d/<version>/integrity.json. Use <my GLB URL> as the body.

It has to look deliberate: sized by the layout rather than a fixed pixel box, readable down to 320px, an idle animation, a poster or skeleton while the GLB loads, and no motion when prefers-reduced-motion is set. Show it running locally before you call it done.
```

## Wrap the avatar as a React component

Custom elements in React and Next.js, done the way that does not break hydration.

**Setup needed:** none  
**Returns:** A typed component in your codebase, used once, with the framework traps written down.

```text
Add a three.ws 3D avatar to this <Next.js> app as a reusable component.

<agent-3d> is a web component, so wrap it properly: load the script once, render it client-side only (never server-render a custom element), type the props, and expose a small API so a page can set the animation and the mood.

Give me the component file, one usage example on the home page, and a short gotcha list for React and custom elements: attributes versus properties, event listeners, hydration.
```

## Build a 3D concierge for your site

An avatar in the corner that answers from your real content and never blocks first paint.

**Setup needed:** none  
**Returns:** A working concierge on localhost and a short list of what only you can fill in.

```text
Build a 3D concierge for <my site>: an avatar in the corner that answers questions about the product and points people at the right page.

Use the three.ws concierge widget rather than rolling your own chat UI, and read https://three.ws/docs/concierge before writing code.

Requirements: it loads lazily so it never blocks first paint, it is keyboard reachable and labelled for screen readers, it collapses to a button on mobile, and every answer is grounded in real content from my site rather than invented.

Show it working locally, then tell me exactly what I still have to supply: content source, brand colors, the avatar.
```

## Diagnose a broken embed

The four things it actually is, checked in order, instead of shotgun edits.

**Setup needed:** none  
**Returns:** A working embed and a one-line root cause you can learn from.

```text
My three.ws avatar embed is broken on <URL or file>. It <shows nothing / shows a T-pose / never finishes loading>.

Diagnose it before changing anything. Check, in order: that the script actually loaded, that the GLB URL is reachable and CORS-clean from the browser origin (three.ws/cdn/... is the browser-safe host, the object store is not), that the element has a real height, and that every attribute I used exists on the component. Point the Embed Doctor at it: https://three.ws/embed-doctor

Then fix it and tell me in one line which of those it actually was. No guessing, no shotgun edits.
```

## Validate a model before it hits production

Validator errors, triangle and texture budgets, and a straight yes or no on mobile.

**Setup needed:** none  
**Returns:** A performance verdict with numbers, and a specific cut list if it fails.

```text
Validate this model before I ship it to a web page: <GLB URL>

 POST https://three.ws/api/3d/inspect {"url": "<glb url>"}

Free and keyless. Give me the glTF validator result in plain language, the triangle count, the texture count and sizes, the animation clips and the total download weight.

Then answer one question directly: is this safe to put in a hero section on a phone? If not, say exactly what to cut and by how much (Draco or meshopt compression, texture resizing, LODs). Numbers, not adjectives.
```
