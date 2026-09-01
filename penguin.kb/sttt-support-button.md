---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor.garden/apps/super-tictactoe
session:
  uuid: [] # planned 2026-08-31, not yet started; append your uuid on pickup
  started: null
  ended: null
---

# STTT Support Button — the Checkout Goes Live

Revenue-beam session: a G1 expansion that also closes G2's shortest
path (`private.bukzor-llc/strategy.kb/beam-search.md` — public URL
accepts money by 2026-09-26). Ordering: this runs before the llc
todo's prepended gutter-mechanization shim (sycophancy-check reversal,
user-agreed 2026-08-31).

## State (prep landed 2026-09-01, from the llc repo)

Platform **ruled**: Stripe Payment Links, two SKUs -- $0.50/mo and
$6/yr. Rationale, rejected alternatives (Ko-fi, GitHub Sponsors), the
per-transaction-fee finding, and the FEE_OPTIMIZE tripwire all live in
`private.bukzor-llc/strategy.kb/products.kb/sttt.md`. Do not re-run
that research.

Wiring **staged and built**: `<footer class="support">` in
`index.html` with `.support*` rules in `style.css`; `trunk build`
verified the footer reaches `dist/`. It is deliberately static rather
than rendered from Rust, so checkout survives a WASM load failure.
`body` is a flex column that the app appends the board into at
runtime, so `.support { order: 1 }` is what keeps it below the board
-- not decoration.

Both hrefs are still `PLACEHOLDER`, so **the app must not be deployed
as it stands**.

## Remaining

- [ ] Create the Stripe account and both Payment Links ($0.50/mo,
  $6/yr) -- needs the user's hands: identity and bank details.
  Activation runs 1-5 business days; test-mode links unblock
  everything below in the meantime
- [ ] Swap the two `PLACEHOLDER` hrefs in `index.html` for the real
  links. Gate: `grep -c PLACEHOLDER index.html` prints `0` before any
  build or deploy
- [ ] `trunk build --release`, then deploy per `docs/dev/deploy.md`
  (wrangler, from the garden repo root)
- [ ] Confirm the live URL takes a real charge -- that is what closes
  G2; log it as the week's G1 expansion
- [ ] Devlog the sitting in `private.bukzor-llc/docs/dev/devlog/`

An external stall (payment-account approval) remains a valid stopping
point: log it as the expansion and file the remainder. G2 has slack to
2026-09-26.

## Gotcha

Start the session in the app directory, not the garden root. The
session-start cwd grep is an unanchored prefix match, so from
`bukzor.garden/` it matches this entry *and*
`sttt-bot-existence-proof.md` and you get asked which one you meant.
