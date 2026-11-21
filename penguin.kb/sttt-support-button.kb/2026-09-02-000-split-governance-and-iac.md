# Status 2026-09-02 -- split, governance and IaC filed

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
