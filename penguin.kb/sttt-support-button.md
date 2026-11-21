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

## Status

Shipped 2026-09-02: the account is live (sole proprietor, DBA
`bukzor.garden`), production serves the footer button on a single
`donate.stripe.com` link with three prices. **G2 is not closed**: the
Payment Link is paused, so the public URL has a button but does not yet
accept money; the pause lifts server-side and needs no redeploy.
Follow-ups (support address, DNS move, one-off preset, statement
descriptor) are filed in the addenda.

## Open work

- [x] Swap the two `PLACEHOLDER` hrefs once real Payment Links exist,
  then build and deploy -- ~15 min, gated on activation (swapped in 366a993)

## Addenda

`sttt-support-button.kb/` holds one dated write-up per session that
picked this entry up. `ls` gives the timeline.
