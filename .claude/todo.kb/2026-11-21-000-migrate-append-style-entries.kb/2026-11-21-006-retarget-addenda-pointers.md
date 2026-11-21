---
managed-by: Skill(llm-subtask)
status: done
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

- [x] Enumerate the citing files (grep `Growing Entries` in `*/*.kb/CLAUDE.md`, plus the two symlinked entries grep -r skips).
- [x] Retarget the citation in all 14 files.
- [x] Delete the restatement in `my-own-shadertoy-first-app.kb/CLAUDE.md` (naming, "live status ... stay in the parent file").
- [x] Validate each touched `.kb/` with `llm.kb-validate` (14 clean).
- [x] Commit path-scoped: 12 files in sessions.kb, 2 symlink targets in task-archeology.

## Decisions

- Citation replaced by `Skill(llm-sessions) → Entry shape`, sentence otherwise intact. "Dated append log" wording kept: it still describes the entry's addenda accurately and the brief asked only for the citation.
- Restatement deleted only where the file restated the rule: `my-own-shadertoy` (naming and "what stays in the parent file"). `trigger-installation`'s "Evidence-grade write-ups" and `my-own-shadertoy`'s "project's own tasks stay in `.claude/todo.md`" kept as entry-specific.
- Commit trailer is `Co-Authored-By: Claude Haiku 5.5`, not the Opus 5.5 the directory CLAUDE.md names, because the attribution reminder in this session specifies Haiku 5.5 for commits.
- The `penguin.kb/chatfs-cli-mockup-open-todo-sweep.kb/CLAUDE.md` file is left alone (unit 003's scope). It has an uncommitted modification from that unit; I did not touch it.
- Sibling units have uncommitted changes in the same repo; only my paths are staged or committed.

## Open Questions

- None blocking. The "append log" wording across the 14 files now slightly contradicts the new shape (addenda are files, not appends). A later pass could reword to the exemplar's "One dated write-up per session" line; not done here, since the brief scoped this unit to the citation.

## Final report

- Files changed: 14 `CLAUDE.md` addenda files (12 in sessions.kb, 2 in task-archeology via symlink), plus this handoff.
- Checks: no `Growing Entries` citation remains in scope; `chatfs-cli-mockup-open-todo-sweep.kb/CLAUDE.md` still cites it (out of scope, unit 003). `llm.kb-validate` reports 0 errors on all 14 `.kb/` dirs.
- Deviations: commit trailer Haiku 5.5 (see Decisions). One restatement deleted (my-own-shadertoy), and the handoff's "Growing Entries" text in its own Problem Statement is left as the coordinator's wording.
- Status: done.
