---
managed-by: Skill(llm-subtask)
status: done
required-reading:
  - /home/bukzor/.claude/sessions.kb/.claude/todo.kb/2026-11-21-000-migrate-append-style-entries.kb/CLAUDE.md
---

# `jsonschema-ref-rollout-beyond-todo-ideas`: split dated pickups into addenda

**Parent:** <../2026-11-21-000-migrate-append-style-entries.md> (wave 1)

## Problem Statement

Migrate the entry per this directory's `CLAUDE.md`. At 292 lines it
is the largest. "## 2026-08-27: lane -005 ruled" is a pickup record;
"Landed", "Committed" and "Notes for the next session" may be per-pickup
logs or live status. Decide each from its content and the session uuids
in frontmatter, and record the call in Decisions.

**Scope (only these files):**

- `/home/bukzor/.claude/sessions.kb/penguin.kb/jsonschema-ref-rollout-beyond-todo-ideas.md`
- `/home/bukzor/.claude/sessions.kb/penguin.kb/jsonschema-ref-rollout-beyond-todo-ideas.kb/` (new)
- this handoff file

## Steps

- [x] Read conventions, exemplar, entry
- [x] Split into 3 addenda, rewrite summary, lift open items, add Addenda
- [x] Checkbox count 12 before and after; llm.kb-validate clean; commit

## Decisions

- "Landed" and "Committed" are records of session 531674aa's first
  sitting (2026-08-21; the entry's `started:`), not live status: moved
  together to `2026-08-21-000`, with the short "The finding" section.
- "Notes for the next session" narrates that same session's later
  widening, lane returns and corrections: moved verbatim to
  `2026-08-21-001`. Its inner dates are 08-21 or undated, so it is filed
  08-21 (uuid `531674aa`).
- "2026-08-27: lane -005 ruled" is session abb60cf6's pickup: moved to
  `2026-08-27-000`. Its trailing "Still open" list (3 `- [ ]`) was lifted
  into `## Open work`, with "(as of 2026-08-27)" added to the first item.
- Summary rewritten to state current state, with pointers to the lane
  `-005` execution todos (previously only in the 08-27 section).
- Original saved at `~/.claude/sessions.kb/trash/jsonschema-ref-rollout-beyond-todo-ideas.orig.md`.

## Open Questions

- The Notes section's true date is not recoverable from the text; 08-21 is
  a best guess.

## Final report

Checkbox lines 12 before, 12 after (9 stayed in Open work, 3 lifted).
`llm.kb-validate` clean (4 files, 0 errors). No deviations; nothing left
inline on purpose. Frontmatter untouched.
