# Embed an avatar

**You will end with:** a talking 3D avatar on a web page you control.

## 1. Paste the snippet

Save as `index.html`. This uses the pinned build with its integrity hash.

```html
<script
  type="module"
  src="https://three.ws/agent-3d/1.5.2/agent-3d.js"
  integrity="sha384-KdAiFRsdcCbQMu4O5rkoL8hOEYLkmrdpf9ELd7jro+9NTNipWis3oqqFLll7v20Q"
  crossorigin="anonymous"
></script>

<agent-3d
  body="https://three.ws/avatars/realistic-female.glb"
  brain="free"
  instructions="You are Maya, a friendly guide to this site."
  style="width: 400px; height: 500px; display: block;"
></agent-3d>
```

## 2. Serve it

```bash
npx serve .
```

Open the address it prints. The avatar loads and you can talk to it.

## 3. Make it yours

- `body` is any GLB URL. Use your own avatar, or find a ready-made one in the asset catalog.
- `instructions` is the system prompt.
- `brain="free"` uses the free tier. Set a specific model id when you have one.

## When you cannot load scripts

Use the iframe from [snippets/embed/iframe.html](../../snippets/embed/iframe.html). It works in a CMS or a sandboxed page.

## Production notes

Pin an exact version and keep the `integrity` attribute so the bytes can never change under you. The current hash for any release is at `https://three.ws/agent-3d/<version>/integrity.json`.
