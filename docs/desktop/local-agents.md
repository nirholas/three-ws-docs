# Local agents and approvals

The desktop app can run agents on your own machine. Signing keys live in your operating system keychain and never leave it. Paper-mode strategies keep running with no account and no cloud connection at all.

## What runs locally

- **Agents.** Each has a name, a mode (`paper` or `live`) and a strategy validated by the same schema the cloud uses.
- **Strategies.** A scheduler scans the launch feed every minute, applies the entry rules, and manages exits (take profit, stop loss).
- **Orders.** Limit orders fire when a price crosses your above or below level.
- **Automations.** Interval jobs such as sweeps.
- **Receipts.** Every fill is recorded with the approval hash it ran under.

Prices come from on-chain reserves read over Solana RPC, so a paper fill reflects real reserves. Paper mode never signs or sends anything.

## Keys and custody

A live agent gets a keypair generated on your machine, stored encrypted with Electron `safeStorage`:

| OS | Backing store |
|---|---|
| macOS | Keychain |
| Windows | DPAPI |
| Linux | Secret Service (GNOME Keyring, KWallet) |

If the OS reports that no keychain is available, **live agents are refused** and paper agents still work. Keys are never logged. The runtime log is redacted (secret fields, byte arrays, base58 keys, bearer tokens), and crash dumps stay on disk with uploading off.

## Approvals

A live agent in `ask` mode files an approval instead of signing. The approval shows four rows: **Recipient, Amount, Asset, Chain**, and carries a SHA-256 of the canonical JSON of the action.

1. The decision happens in a **native dialog** opened by the main process, from the tray or from the notification's Review action.
2. The hash is held by the runtime and checked again at decide time. If the stored action changed, nothing runs.
3. The renderer window can review or deny but has **no approve channel**.
4. An approval **expires after 15 minutes** and runs nothing.
5. Killing an agent denies its pending approvals.

Read the four rows every time. Treat a recipient, amount or asset you did not expect as a reason to deny.

## Safe defaults

- Start every strategy in `paper` mode and watch it for a while.
- Keep live agents in `ask` mode so nothing spends without you.
- Fund a live agent wallet with only what you are prepared to lose.
