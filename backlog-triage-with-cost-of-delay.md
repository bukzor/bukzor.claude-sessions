---
cwd: /home/bukzor/claude/homedir-archeology
session:
  started: null
  ended: null
---
# Backlog triage with cost-of-delay re-rating

Sibling line of work surfaced during the 2026-05-18 SWEH-evolution
session. Captures the broader re-triage that the new
`cost-of-delay-2w` field unblocks.

The session-state for this thread lives in
`~/claude/homedir-archeology/.claude/`:

- `decision.kb/sweh-cost-of-delay-field.md` — what the new field is
- `principle.kb/roi-misses-cost-of-delay.md` — why it was needed
- `principle.kb/unrated-items-are-frame-mismatch-signals.md` —
  operational consequence
- `observation.kb/sweh-ratings-need-recalibration.md` — user's "shaky"
  flag on existing ratings
- `reference.kb/backlog-data-files.md` — input/view of the backlog

## What the re-triage needs to cover

High-stakes items currently lacking SWEH (or with SWEH but flagged
shaky) that the new field reframes:

- `~/repo/github.com/bukzor/private.evan-family/.claude/todo.kb/2026-04-17-001-exit-ameriprise-to-schwab.md`
  — money bleeds monthly; high cost-of-delay-2w.
- `~/repo/github.com/bukzor/private.evan-family/.claude/todo.kb/2026-04-17-000-financial-data-completeness-and-repeatability.md`
  — spousal coordination + tax windows.
- `~/repo/github.com/bukzor/private.bukzor-llc/.claude/todo.md`
  — revenue path; opportunity cost of unshipped product.
- `~/repo/github.com/bukzor/prototype.chatfs.too-many-changes/packages/har-browse/.claude/todo.kb/`
  (two files) — active finalization; context decay is the cost-of-delay.
- `~/repo/github.com/bukzor/bukzor.garden/apps/super-tictactoe/.claude/todo.md`
  + V0 sub-items — months-long scope.
- `~/repo/github.com/bukzor/bukzor.garden/.claude/todo.kb/2026-02-03-000-trunk-to-buck2-migration.md`
- `~/repo/github.com/bukzor/prototyping.hearts-2025/.claude/todo.md`
  + `packages/engine/.claude/todo.md` (no-frontmatter; needs SWEH at
  all).
- `~/repo/github.com/bukzor/scratch.vim-work/CLAUDE.task.md` (no-fm).

## Open user decisions (pending at end of 2026-05-18 session)

Both resolved 2026-05-19:

- ~~**Re-rate `2026-02-09-000-schema-reuse-with-ref.md`** with
  `cost-of-delay-2w` value reflecting the worsened dup tax.~~ Done in
  `fc8c346` (bukzor-agent-skills): rated `cost-of-delay-2w: 1.5` with
  dup-tax rationale; all SWEH legs now carry `confidence: unsure`
  (5-band vocab).
- ~~**Delete or rename the verified deletion candidates** (homedir-archeology
  `verified-claim.kb/trailing-newline-dups-bit-identical.md` and
  `verified-claim.kb/skills-trash-todo-stale-predecessor.md`).~~ Resolved
  in `bce91b4` + `d15556e` (this repo); verified-claim.kb is empty.

## Sweep progress (2026-05-19)

User-confirmed dollar anchor: **$100 USD ≈ 1 SWEh**. Recorded in
canonical schema (`bukzor-agent-skills@fb7230a`) and homedir-archeology
`decision.kb/sweh-dollar-anchor.md`.

Items rated this session (highest-WSJF first):

| File | tb | b2w | cod2w | WSJF | cod-2w conf. | Commit |
|---|---|---|---|---|---|---|
| schema-reuse-with-ref | 1.0 | 1.0 | 1.5 | 2.50 | unsure | bukzor-agent-skills@fc8c346 (pre-sweep) |
| har-browse/todo.md | 2.0 | 1.5 | 0.3 | 0.90 | tentative | prototype.chatfs@39280ce |
| bukzor-llc/todo.md | 6.0 | 2.0 | 3.0 | 0.83 | **hypothetical** | private.bukzor-llc@ed26626 |
| ameriprise-exit | 12.0 | 2.0 | 3.0 | 0.42 | tentative | private.evan-family@1959daf |
| financial-data-completeness | 6.0 | 1.0 | 1.0 | 0.33 | tentative | private.evan-family@09ad9a4 |
| super-tictactoe/todo.md | 8.0 | 1.0 | 0.5 | 0.19 | tentative | bukzor.garden@3a1b880 |
| super-tictactoe/beam-search | 4.0 | 0.5 | 0.3 | 0.20 | tentative | bukzor.garden@3a1b880 |
| scratch.vim-work | 10.0 | 0.5 | 0.5 | 0.10 | tentative | scratch.vim-work@6cb48eb |
| trunk-to-buck2 (deferred) | 8.0 | 0.0 | 0.0 | 0.00 | confident | bukzor.garden@fad6788 |

## Items NOT rated this session

- `prototyping.hearts-2025/.claude/todo.md`
- `prototyping.hearts-2025/packages/engine/.claude/todo.md`

Pre-commit hooks in this repo reference a missing `pnpm-run` binary
(prettier + pyright entries in `.pre-commit-config.yaml`). The hearts
repo also had unrelated staged Python refactor work in flight. My
edits were reverted and skipped. Re-attempt after the user fixes the
pre-commit tooling.

## Confidence audit

All ratings except `trunk-to-buck2` and `schema-reuse-with-ref` are
`tentative` or weaker. The `bukzor-llc/cost-of-delay-2w` is
`hypothetical` — revenue projections could be off by an order of
magnitude in either direction. These should be re-evaluated before
driving prioritization decisions; the 5-band vocab is doing its job by
flagging them.

## Outstanding follow-ups

1. **hearts-2025** ratings (pending pre-commit fix).
2. **Calibration review** — user may want to revise the hand-anchored
   cost-of-delay-2w values (especially bukzor-llc and Ameriprise tax-tail
   premium).
3. **Re-rate existing shaky items** — `observation.kb/sweh-ratings-need-recalibration.md`
   flagged the 20 pre-existing ratings as needing review. Not touched
   this session; still pending.
4. **Aggregate prioritization view** — WSJF table above is per-item;
   user may want a unified backlog view sorted by WSJF across all rated
   items (would need a small script vs the JSONL output of md-frontmatter).
