# PoC -- Gondi NFT Lending Access Control Exploit (Mar 2026)

> **Educational / research use only.** This repository reproduces the access
> control vulnerability in Gondi's Sell & Repay contract that allowed theft of
> ~78 NFTs worth approximately $230K.

## Quick Start

```bash
git clone https://github.com/NomosLabs-Security/poc-gondi-2026
cd poc-gondi-2026
forge install foundry-rs/forge-std --no-git
forge test -vvvv
```

## Details

- **Date:** 2026-03-10
- **Chain:** Ethereum
- **Loss:** ~$230,000 (78 NFTs including 44 Art Blocks, 10 Doodles, 2 Beeple)
- **Root Cause:** Missing caller authorization in `Purchase Bundler` function
- **Contract Deployed:** 2026-02-20 (Sell & Repay contract)
- **Expected Output:** Unauthorized caller claims NFTs from active loan positions

## Vulnerability

Gondi deployed a new Sell & Repay contract on February 20, 2026. The
`Purchase Bundler` function contained a logical flaw: it failed to verify
whether `msg.sender` was the legitimate owner or borrower of the NFT-backed
loan position. Any external caller could invoke the function and redirect the
NFT collateral to an arbitrary address.

On March 10, 2026, an attacker exploited this by calling the Purchase Bundler
for active loan positions, effectively claiming the NFT collateral without
being the borrower or lender. A total of 78 NFTs were stolen, including 44
Art Blocks, 10 Doodles, and 2 Beeple artworks.

- **Full Analysis:** [NomosLabs Security Intelligence Archive](https://nomoslabs.io/archive/gondi-2026)

MIT -- NomosLabs Security Research
