---
managed-by: Skill(llm-subtask)
status: open
required-reading:
  - /home/bukzor/.claude/sessions.kb/.claude/todo.kb/2026-11-21-000-migrate-append-style-entries.kb/CLAUDE.md
---

# Retarget 14 addenda `CLAUDE.md` pointers to Skill(llm-sessions)

**Parent:** <../2026-11-21-000-migrate-append-style-entries.md> (wave 1)

## Problem Statement

These files cite "sessions.kb's root `CLAUDE.md` → Lifecycle → Growing
Entries", a section that moved to Skill(llm-sessions) → "Entry shape" in
c22c645. Replace that citation with `Skill(llm-sessions) → Entry shape`.
Where a file also restates the rule itself (naming, what goes in the parent
file), delete the restatement; the skill owns it. Keep anything specific to
the entry (e.g. trigger-installation's "Evidence-grade write-ups").
Not a migration: the per-entry steps in this directory's `CLAUDE.md` do
not apply; its commit and scope rules do.

**Scope (only these files):**

Every `/home/bukzor/.claude/sessions.kb/*/*.kb/CLAUDE.md` (one level of entry `.kb/` under a host dir) that cites "Lifecycle → Growing Entries", **except**
`penguin.kb/chatfs-cli-mockup-open-todo-sweep.kb/CLAUDE.md` (unit 003's). 14 files. Two resolve through symlinks into
`~/repo/github.com/bukzor/2026-05-19--task-archeology/.claude/sessions.kb/` (`backlog-triage-with-cost-of-delay.kb`, `wsjf-rank-tool-gaps-discovered-during-sweep-3.kb`); commit those there, path-scoped, same message conventions; push neither repo.
Plus this handoff file.

## Steps

## Decisions

## Open Questions

## Final report
