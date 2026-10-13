# How the Android app works

## A Trusted Web Activity

The APK is a Trusted Web Activity (TWA): it opens `https://three.ws` full-screen in Chrome's rendering engine with no browser chrome. For a WebGL product this is the shape Solana Mobile recommends for web apps. 3D runs at full speed, and what makes it feel like an app is everything around the shell.

## Digital Asset Links

Android only lets an app open a site full-screen if the site vouches for the app. three.ws does that with `/.well-known/assetlinks.json`, which lists the app's package id and the SHA-256 fingerprint of its signing certificate. See [Verify the APK](verify.md).

## Wallet sign-in

Wallet actions go through Mobile Wallet Adapter, which talks to the wallet installed on your phone. Sign-in is a single request. The session is stored so it survives Android killing the app in the background, and a revoked session is dropped cleanly.

## One app, two channels

The same package, `ws.three.app`, ships on the Solana dApp Store for Seeker and Saga and, when approved, on Google Play. See the [Seeker guide](../seeker/README.md).
