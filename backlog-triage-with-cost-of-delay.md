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

- **Re-rate `2026-02-09-000-schema-reuse-with-ref.md`** with
  `cost-of-delay-2w` value reflecting the worsened dup tax.
- **Delete or rename the verified deletion candidates** (homedir-archeology
  `verified-claim.kb/trailing-newline-dups-bit-identical.md` and
  `verified-claim.kb/skills-trash-todo-stale-predecessor.md`).

## Approach for the next session

1. Walk the items above in cost-of-delay order (highest urgency first).
2. For each, read the file body, write a `cost-of-delay-2w` rationale,
   add `confidence: low|medium|high` to existing ratings.
3. Use `md-frontmatter | jq | md-frontmatter-set` (per homedir-archeology
   CLAUDE.md) to bulk-edit frontmatter where appropriate.
4. Re-run aggregate prioritization with WSJF:
   `(benefit-2w + cost-of-delay-2w) / timebox`.

The sweep is multi-hour work; do not attempt in one session.
