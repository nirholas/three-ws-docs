# Install the desktop app

Download from [three.ws/apps/desktop](https://three.ws/apps/desktop). The page highlights the right file for your operating system. All builds are currently **unsigned**, so your OS may ask you to confirm before the first launch. That is expected. Verify the SHA-256 first if you want certainty: [Verify a download](verify-download.md).

## System requirements

| OS | Requirement |
|---|---|
| Windows | Windows 10 or 11, 64-bit |
| Linux | 64-bit Ubuntu 18.04+, Debian 10+, Fedora 39+ or another distribution with glibc 2.28+ |
| macOS | macOS 11 Big Sur or later is the target; a build is not in the release feed yet |

## Windows

**Installer (recommended):** `three.ws-Desktop-<version>-win-x64-setup.exe`

1. Download the installer from the download page.
2. Double-click it. If Windows SmartScreen shows "Windows protected your PC", choose **More info**, then **Run anyway**.
3. Follow the installer. Launch **three.ws Desktop** from the Start menu.

**Portable:** `three.ws-Desktop-<version>-win-x64-portable.exe` runs without installing. Put it anywhere and double-click it. Good for a USB stick or a locked-down machine where you cannot install software.

## Linux

**AppImage (any distribution):** `three.ws-Desktop-<version>-linux-x86_64.AppImage`

```bash
chmod +x three.ws-Desktop-*-linux-x86_64.AppImage
./three.ws-Desktop-*-linux-x86_64.AppImage
```

Some desktops need FUSE 2 for AppImages. If it refuses to start, see [Troubleshooting](troubleshooting.md).

**Debian and Ubuntu (.deb):** `three.ws-Desktop-<version>-linux-amd64.deb`

```bash
sudo apt install ./three.ws-Desktop-*-linux-amd64.deb
```

Using `apt install` with a path (rather than `dpkg -i`) pulls in any missing dependencies.

## Run from source

If you would rather build it yourself, the desktop app source is in the product repository under `apps/desktop`:

```bash
git clone https://github.com/nirholas/three.ws.git
cd three.ws/apps/desktop
npm install
npm start
```

## Update

The app checks the same release feed. When a new version is published, download it from the [download page](https://three.ws/apps/desktop) and install over the top. Your settings and local agents stay in your user profile.

## Uninstall

- **Windows:** Settings, Apps, Installed apps, three.ws Desktop, Uninstall. For the portable build, delete the file.
- **Debian and Ubuntu:** `sudo apt remove three-ws-desktop` (check the exact name with `dpkg -l | grep -i three`).
- **AppImage:** delete the file.

Your app data (settings, local agents, the encrypted key file) lives in the app's user data folder and is not removed automatically. Delete that folder if you want a clean slate.
