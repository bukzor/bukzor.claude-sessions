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

11 items rated this session across 7 repos. WSJF-ranked view:

    ~/repo/github.com/bukzor/2026-05-19--task-archeology/task-list.wsjf.md

Refresh with `claude-open-tasks-list | ./wsjf-rank > task-list.wsjf.md`
from the project root.

Commits that landed the ratings:

- bukzor-agent-skills@fc8c346 (pre-sweep: schema-reuse-with-ref re-rate)
- bukzor-agent-skills@fb7230a (dollar-anchor + Ameriprise example)
- private.evan-family@1959daf (ameriprise-exit), @09ad9a4 (financial-data)
- private.bukzor-llc@ed26626
- prototype.chatfs@39280ce (har-browse)
- bukzor.garden@3a1b880 (super-tictactoe ×2), @fad6788 (trunk-to-buck2)
- scratch.vim-work@6cb48eb
- prototyping.hearts-2025@050cf73 (parent + engine)
- 2026-05-19--task-archeology@cacfcf6 (decision.kb), @ad5a121 (wsjf-rank)

## Confidence audit

All ratings except `trunk-to-buck2` and `schema-reuse-with-ref` are
`tentative` or weaker. The `bukzor-llc/cost-of-delay-2w` is
`hypothetical` — revenue projections could be off by an order of
magnitude in either direction. These should be re-evaluated before
driving prioritization decisions; the 5-band vocab is doing its job by
flagging them.

## Outstanding follow-ups

1. **Calibration review** — user may want to revise the hand-anchored
   cost-of-delay-2w values (especially bukzor-llc and Ameriprise tax-tail
   premium).
2. **Re-rate existing shaky items** — `observation.kb/sweh-ratings-need-recalibration.md`
   flagged the 20 pre-existing ratings as needing review. Not touched
   this session; still pending. Running
   `claude-open-tasks-list | wsjf-rank` now shows several pre-existing
   items at WSJF > 2.5 that may be miscalibrated (small timeboxes,
   no cost-of-delay values).
3. **`pnpm-run` PATH-resolution in pre-commit hooks** — hearts-2025
   commits required `eval "$(direnv export bash)"` to make
   `$REPO/bin/pnpm-run` resolvable. Could symlink to `~/bin/` or update
   `.pre-commit-config.yaml` to invoke via `$REPO/bin/pnpm-run` directly,
   so commits work from sessions that haven't loaded direnv.
