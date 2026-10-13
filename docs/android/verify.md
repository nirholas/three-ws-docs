# Verify the Android APK

Every three.ws APK is signed with one release key. The public fingerprint of that key is published at `https://three.ws/.well-known/assetlinks.json`, the same file Android uses to decide that links to three.ws may open inside the app.

## Published fingerprint

For package `ws.three.app`:

```text
98:0A:1A:AB:A3:ED:28:D6:3D:06:69:86:7F:9A:C1:4D:EC:05:F7:78:6D:3A:30:0F:84:00:4D:E8:55:11:13:D7
```

Always read the live value instead of trusting a copy, including this one:

```bash
curl -s https://three.ws/.well-known/assetlinks.json
```

## Check your APK

With the Android SDK build tools installed:

```bash
apksigner verify --print-certs three-ws-release.apk
```

Compare the line `Signer #1 certificate SHA-256 digest` with the fingerprint above. Remove the colons and ignore case when comparing; the two forms are the same bytes.

## If it does not match

Do not install it. Download again from [three.ws/apps/android](https://three.ws/apps/android). If a fresh download still differs, report it through [SECURITY.md](../../SECURITY.md).

## Note for Google Play builds

When the app is on Google Play, Google re-signs the bundle with its own key, and its fingerprint is added to the same assetlinks file. If you see more than one fingerprint there later, that is why.
