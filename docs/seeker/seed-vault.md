# Seed Vault sign-in

On Seeker the app signs in through Mobile Wallet Adapter with the wallet in Seed Vault.

## What you see

One Seed Vault sheet. Sign-In With Solana happens at authorize time, so there is no separate connect step followed by a message signature. No seed phrase is typed, no browser extension is involved, and sign-in is not a transaction.

## What is signed

| Action | Signed? |
|---|---|
| Sign in | A Sign-In With Solana message, nothing on-chain |
| Linking a wallet to your account | A message signature |
| Seeker verification | Nothing. The server reads your wallet, it does not move anything |
| Anything that spends | A transaction you approve in Seed Vault, showing recipient, amount and token |

## Sessions

The session survives Android closing the app. The next signature is a silent re-authorize rather than a new prompt. If Seed Vault revokes the session, the app drops it on the next failed re-authorize and asks you to sign in again.

## Good habits

Read the Seed Vault sheet every time. Never approve a request you did not start.
