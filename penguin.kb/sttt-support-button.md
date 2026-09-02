---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor.garden/apps/super-tictactoe
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 312c7f92-75f9-4386-ab8f-664db8a1e7bd
    - 8559b2ff-fc2f-4d81-8e0b-eddabdd3da6c
  started: 2026-09-02T11:32:53-05:00
  ended: null
---

# STTT Support Button — the $0.50/mo Checkout Goes Live

Revenue-beam session: a G1 expansion that also closes G2's shortest
path (`private.bukzor-llc/strategy.kb/beam-search.md` — public URL
accepts money by 2026-09-26). Add the "$0.50/mo support" button to the
live app at `bukzor-garden--super-tictactoe.pages.dev`: research and
choose the payment platform (Stripe, Ko-fi, GitHub Sponsors, …), set
up the $0.50/mo product, wire the button into the page. ~2h by the
app's own estimate; depends on nothing else — expressly not the bot
subtree (`private.bukzor-llc/strategy.kb/products.kb/sttt.md`).

Work items: `.claude/todo.md` §Support button (three checkboxes).
Ordering: this runs before the llc todo's prepended
gutter-mechanization shim (sycophancy-check reversal, user-agreed
2026-08-31). Timebox ≤2h — an external stall (e.g. payment-account
approval) is a valid stopping point: log it as the week's expansion
and file the remainder.

## Status 2026-09-02

Picked up, then split in two. Registration itself -- the Stripe
account, the activation questionnaire, the two SKUs -- continues in
the peer session `initial-setup`. This session forked to governance
and IaC, and filed:

- Merchant identity, ruled and recorded at
  `private.bukzor-llc/strategy.kb/merchant-identity.md`: sole
  proprietor, public name and statement descriptor `bukzor.garden`
  (domain registered the same day), and the observation that the
  incorporation trigger is now armed rather than hypothetical.
- A hardened deploy gate in `apps/super-tictactoe/.claude/todo.md`:
  it now rejects `stripe.com/test_` as well as `PLACEHOLDER`, because
  a test-mode link passed the old gate while taking no money.
- Stripe under `CODE_ONLY`, at both scopes -- `rule MERCHANT_SEAM` in
  the llc todo for where the seam falls when half a vendor's config is
  KYC-bound, and
  `bukzor.garden/.claude/todo.kb/2026-09-02-000-stripe-config-as-code.md`
  for the implementation. `ADOPT_SEAM` licenses the hand-bootstrap;
  the import comes after.

- [ ] Swap the two `PLACEHOLDER` hrefs once real Payment Links exist,
  then build and deploy -- ~15 min, gated on activation
