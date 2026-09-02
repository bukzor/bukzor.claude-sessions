---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor.garden/docs/private.bukzor-llc
session:
  uuid: [] # planned 2026-09-02, not yet started; append your uuid on pickup
  started: null
  ended: null
---

# Lead Times: Verify the Ledger, Then Promote It

`private.bukzor-llc/lead-times.md` records how long processes we do not
control take — Stripe activation and payouts, DBA and LLC formation in
Wisconsin, EIN, EU/UK VAT registration. It was set down 2026-09-02 as
deliberate best guesses with `verification: none`, and it says so
loudly: model knowledge runs to 2026-05 and was caught stale that same
session by Stripe's repackaging of Tax into Basic/Complete. Three
entries are marked `confidence: low` and are placeholders with numbers
on them — `STRIPE_ENTITY_CONVERSION`, `EU_VAT_OSS`, `UK_VAT`.

This is the homeless line of work: the content is bukzor-llc's, the
schema question is `Skill(llm-subtask)`'s, and no single todo owns
both. Everything else from that session landed in a todo that does own
it (`rule MERCHANT_SEAM` in the llc todo, stripe-config-as-code in
bukzor.garden, the schedule dimension in llm-subtask).

Reasoning and rejected alternatives:
`private.bukzor-llc/docs/dev/devlog/2026-09-02-000-donations-are-not-sales--lead-times-get-a-ledger.md`

- [ ] Verification pass against live vendor and statutory docs; clear
      `verification: none`, and either firm up or delete the three
      `low` entries rather than leaving numbers nobody stands behind
- [ ] Answer whether a game cosmetic is taxable in Wisconsin —
      "specified digital goods" is narrow, but electronically delivered
      prewritten software is taxable and a theme argues either way.
      Wanted **before** a cosmetic SKU is priced, not after
- [ ] Promote to `lead-times.claims.md` + `lead-times.claims.kb/` with
      stable ids, once the content has survived a session boundary.
      Nothing can reference it until then
- [ ] Reconcile with whatever the schedule-dimension ruling decides
      (`bukzor-agent-skills/llm-subtask/.claude/todo.md`) — the
      reference form must stay optional, since most repos using that
      skill keep no ledger at all

Not blocking the revenue path. The 2026-09-26 date rides on Stripe
activation alone.
