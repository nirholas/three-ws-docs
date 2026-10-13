# Verify a download

Builds are unsigned for now, so the checksum is your proof the file is the one three.ws published. It takes thirty seconds.

## 1. Get the published hash

The release feed lists a SHA-256 for every file:

```bash
curl -s https://three.ws/releases/desktop/release.json | node -e '
let s="";process.stdin.on("data",d=>s+=d).on("end",()=>{
  for (const f of JSON.parse(s).files) console.log(f.sha256, f.name);
})'
```

The same table is on [three.ws/apps/desktop](https://three.ws/apps/desktop) under the download buttons.

## 2. Hash what you downloaded

Linux and macOS:

```bash
sha256sum three.ws-Desktop-*.AppImage
```

Windows PowerShell:

```powershell
Get-FileHash .\three.ws-Desktop-0.1.0-win-x64-setup.exe -Algorithm SHA256
```

## 3. Compare

The two strings must match exactly. If they do not, delete the file and download it again from [three.ws/apps/desktop](https://three.ws/apps/desktop). If a fresh download still does not match, stop and report it through [SECURITY.md](../../SECURITY.md).

## Why bother

A checksum protects against a corrupted download and against a file swapped on a mirror or a look-alike site. The only official site is `three.ws`.
