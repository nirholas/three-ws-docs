# Security policy

## Reporting a vulnerability

Email **security@three.ws** (also published at <https://three.ws/.well-known/security.txt>). Please do not open a public issue for a vulnerability.

Include what you found, how to reproduce it, and the impact. We will acknowledge your report and keep you updated until it is resolved. If you want credit, say so and we will name you once it is fixed.

## What counts

- A flaw in the three.ws platform, desktop app, Android app or Seeker app
- A download, checksum or fingerprint published here that does not match what three.ws serves
- A link in these docs that points to a look-alike or malicious site

This repository contains documentation and small example snippets only. A mistake in a doc is a normal [issue](https://github.com/nirholas/three-ws-docs/issues); a risk to users is a security report.

## Never share secrets

Do not put a token, API key, seed phrase or private key in an issue, a pull request or an email. If you pasted one by accident, revoke it immediately.

## Stay safe

- The only official website is **three.ws**.
- Verify downloads against the published SHA-256 or certificate fingerprint: [desktop](docs/desktop/verify-download.md), [Android](docs/android/verify.md).
- three.ws staff will never ask for your seed phrase.
