---
cwd: /home/bukzor/.claude
session:
  started: null
  ended: null
---
# Reconcile sessions.kb Schema Drift

`bin/llm.kb-validate ~/.claude/sessions.kb` reports 11 of 28 entries
failing against `~/.claude/sessions.jsonschema.yaml`. The schema and the
corpus have diverged: entries adopted fields and value shapes the schema
never blessed, and the schema's `additionalProperties: false` now rejects
them. This session decides, per category, whether the schema is behind
(extend it) or the entries are wrong (fix them), then makes the corpus
validate clean.

## The decision

Two directions, applied per-field:

1. Extend `sessions.jsonschema.yaml` to bless `parent`, `spawned`,
   `prior-sessions`, and (if sessions are rated) `cost-benefit-sweh`.
   These encode a real session-graph the user maintains.
2. Normalize the malformed values: drop or null-allow `uuid`, and
   re-emit `started`/`ended` as full RFC3339 instants. Add the missing
   `session` block to the one entry lacking it.

Done when `bin/llm.kb-validate ~/.claude/sessions.kb` is clean and the
schema documents whatever new fields it gained.

## Additional normalization (added 2026-07-19, from the T3 design session)

- [ ] Dated-prefix rename sweep: entries become
      `YYYY-MM-DD-NNN-slug.md` (date = when the line of work was
      identified — from `session.started`, else git first-commit
      date; `NNN` resets per date within the host dir). Rename
      sibling `$slug.kb/` dirs and the two `@` symlinks to match;
      update `CLAUDE.md` File Naming (drop "Do not number — sessions
      are not ordered": chronological identity is not priority
      ordering) and the exact-match-slug guidance (match modulo date
      prefix); update `.template.md`; check
      `sessions.jsonschema.yaml` for filename assumptions.
      Rationale: `design-next.kb/040-design.kb/class-task.md` (Scope)
      — session entries are ordinary task-collection entries, and
      collection entries carry dated-record identity.
- [ ] Taskfile retirement (operator-ratified 2026-07-19):
      `CLAUDE.<slug>.Task.md` is superseded — a sessions.kb entry
      (plus elaboration kb) is the operator-scope task shape. Update
      `CLAUDE.md`'s Creating-a-New-Entry (drop the
      taskfile-slug-matching clause; note "superseded; migrate on
      touch"). Once the last taskfile
      (`CLAUDE.move-skill-triggers-to-must-read-kb.Task.md`, live
      work, migrates on its next pickup) is gone, also drop the
      `CLAUDE.*Task*.md` pattern from `~/bin/claude-open-tasks-list`
      and from `Skill(llm-subtask)`'s scan-locations list.
      (`CLAUDE.integrate-sessions-kb-into-llm-subtask.Task.md`
      deleted 2026-07-19 — obsoleted by T2's delivery boundary and
      T3's scope design.)

## Addenda

Dated pickup write-ups moved to `reconcile-sessions-kb-schema-drift.kb/`
— one file per addendum, `ls` for the full chronological list. Latest
(and only, so far): 2026-05-27, the violation inventory that drove
"The decision" above. (The "Additional normalization" open items above
stay here rather than in the addenda kb, since they're live `- [ ]`
tasks -- burying them in a dated sub-file would make them invisible to
`claude-open-tasks-list`'s one-level-deep scan of `sessions.kb/*.md`.)

## Why a separate session

Touching the shared sessions schema affects every entry and the
session-start tooling that writes them. Distinct blast radius from the
migrations.kb work that surfaced it.
