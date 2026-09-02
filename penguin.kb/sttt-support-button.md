---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor.garden/apps/super-tictactoe
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 312c7f92-75f9-4386-ab8f-664db8a1e7bd
    - 8559b2ff-fc2f-4d81-8e0b-eddabdd3da6c
  started: 2026-09-02T11:32:53-05:00
  ended: null
---

# STTT Support Button — the Checkout Goes Live

Revenue-beam session: a G1 expansion that also closes G2's shortest
path (`private.bukzor-llc/strategy.kb/beam-search.md` — public URL
accepts money by 2026-09-26). Add the support button to the
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

## Status 2026-09-02

Shipped. The account is live (sole proprietor, DBA `bukzor.garden`), the
product carries three prices -- $1/yr, $6/yr, and a customer-chosen
one-off -- on a single `donate.stripe.com` link, and production serves
the footer button. The $0.50/mo SKU was dropped: the fixed 30c is per
transaction, so annual billing at $1 keeps pennies-scale support at a
third of the fee load.

**G2 is not closed.** The Payment Link is paused, so the public URL has
a button but does not yet accept money. The pause lifts server-side and
needs no redeploy. Everything else in this session is done.

Follow-ups filed rather than done: `support@bukzor.garden` and the DNS
move it shares with the Pages custom domain (urgent now -- the live
Stripe profile advertises `https://bukzor.garden`, which does not
resolve); the public support address, knowingly the home address; the
one-off preset, $1 with a case for $5; the shortened statement
descriptor, unset and truncating to `BUKZOR.GAR`.
