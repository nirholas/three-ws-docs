# llms.txt

`https://three.ws/llms.txt` is a plain-text map of three.ws written for language models: what the platform is, the official channels, and links to every machine-readable entry point. `https://three.ws/llms-full.txt` is the long form.

```bash
curl -s https://three.ws/llms.txt
```

## What it gives a model

- The tagline and what three.ws is
- The **official** channels, so a model can tell the real site from an impersonator
- Links to the sitemap, the MCP trust policy and the prompt library in structured and plain-text form
- Source and example locations

## Use it as a first fetch

If an agent has been told only "use three.ws", `llms.txt` is the cheapest first request. From there it can follow the links to the [MCP directory](mcp-directory.md) or the [x402 catalog](x402-catalog.md).

## Official channels

The only official website is `https://three.ws`. A site on any other domain that presents itself as three.ws is not affiliated with the project.
