# Troubleshooting

## Windows says "Windows protected your PC"

The builds are unsigned for now. Verify the hash ([Verify a download](verify-download.md)), then choose **More info**, **Run anyway**.

## The AppImage does nothing when I double-click it

Mark it executable first:

```bash
chmod +x three.ws-Desktop-*.AppImage
```

If it still will not start from a terminal with a message about FUSE, install FUSE 2 (`sudo apt install libfuse2` on Debian and Ubuntu, `sudo dnf install fuse` on Fedora), or extract and run it:

```bash
./three.ws-Desktop-*.AppImage --appimage-extract-and-run
```

## "keychain_unavailable" when I start a live agent

Live agents need an OS keychain. On Linux, install and unlock a Secret Service provider such as GNOME Keyring or KWallet, then restart the app. Paper agents work without a keychain.

## The companion is not visible

Check the tray icon: the companion may be paused. If you are on Linux under Wayland, some compositors do not allow a transparent always-on-top window; try an X11 session.

## I cannot sign in

Confirm you can sign in at [three.ws](https://three.ws) in a browser. If the browser works and the app does not, check your clock and network, then sign out and in again.

## Still stuck

Open an issue on [nirholas/three.ws](https://github.com/nirholas/three.ws/issues) with your OS, the app version (from the release you installed) and what you saw. Never paste a token, a seed phrase or a private key into an issue.
