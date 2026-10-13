# Menu bar and tray panel

Click the three.ws icon in the macOS menu bar or the Windows tray. A small panel drops down with your agent alive in 3D and the numbers you would otherwise open the console for. Right-click the icon for the full menu.

## What it shows

| Item | What it does |
|---|---|
| Your agent in 3D | The agent's embed, reacting to the local runtime: it waves when something needs your approval, walks while agents work, stands idle otherwise |
| Wallet balance | The SOL balance of the selected agent's Solana wallet, with a click-to-copy address |
| Start and stop | The power button starts or stops the selected cloud agent |
| Local agents | One tile pauses or resumes every local agent |
| Approvals | A card appears when a local agent is waiting on you. Review opens a native confirmation dialog |
| Alerts | Unread notification count, one click to the inbox |
| Companion | A switch for the on-screen companion character |
| Ask | A one-line box that messages the selected agent and shows the reply |

On macOS the menu bar title shows how many approvals are waiting, or the unread count, next to the icon, and nothing when there is nothing to do.

## Approvals are native on purpose

The panel has no approve button. Review opens a dialog built by the app's main process from the stored approval and its hash, so what you approve is exactly what you were shown. Details: [Local agents and approvals](local-agents.md).
