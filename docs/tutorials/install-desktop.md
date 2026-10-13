# Verify and install the desktop app

**You will end with:** a verified copy of the desktop app, running.

1. Open [three.ws/apps/desktop](https://three.ws/apps/desktop) and download the build for your OS.
2. Verify it:

   ```bash
   bash snippets/desktop/verify-checksum.sh ~/Downloads/three.ws-Desktop-0.1.0-linux-amd64.deb
   ```

   You should see `OK` and the file name. (Script: [snippets/desktop/verify-checksum.sh](../../snippets/desktop/verify-checksum.sh).)
3. Install it: [Install the desktop app](../desktop/install.md).
4. Sign in and set your bar: [First run](../desktop/first-run.md).
5. Before running a live agent, read [Local agents and approvals](../desktop/local-agents.md).
