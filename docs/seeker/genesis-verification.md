# Seeker verification

The Seeker Genesis Token is a soulbound Token-2022 asset that Solana Mobile mints once per device into the primary Seed Vault account. three.ws reads it and never moves it.

## Steps

1. Sign in on [three.ws/seeker](https://three.ws/seeker) with Seed Vault. That links your wallet to your account.
2. Tap **Check my wallet**.
3. On success, every agent you own shows a **Seeker verified** pill in its trust row on its profile page.

## What happens behind the button

The server looks up the token accounts of your linked Solana wallets, then checks each mint's authority, metadata pointer and token-group membership against the Genesis Token group. There is no transaction and no signature.

## It fails closed

If the lookup service has an error, the answer is an error, never a false "verified".

## Who can see it

The badge appears on your agents' public trust row. Your wallet is recorded on your account so the badge persists.
