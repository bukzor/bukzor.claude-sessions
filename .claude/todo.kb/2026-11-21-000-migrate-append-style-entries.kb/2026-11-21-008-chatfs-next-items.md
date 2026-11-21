---
managed-by: Skill(llm-subtask)
status: done
required-reading:
  - /home/bukzor/.claude/sessions.kb/.claude/todo.kb/2026-11-21-000-migrate-append-style-entries.kb/CLAUDE.md
  - /home/bukzor/.claude/sessions.kb/.claude/todo.kb/2026-11-21-000-migrate-append-style-entries.kb/2026-11-21-003-chatfs-and-pnpm.md
---

# chatfs: four open items stranded in a 2026-07-20 addendum

**Parent:** <../2026-11-21-000-migrate-append-style-entries.md> (wave 2)

## Problem Statement

`penguin.kb/chatfs-cli-mockup-open-todo-sweep.kb/2026-07-20-000-claude-family-edit-pass-shared-core-split.md`
ends with a `## Next` list of four `- [ ]` items. Open work belongs in the
live entry (this directory's `CLAUDE.md`), and the live entry has none of
them. For each item, settle from ground truth (read only): the repo
`~/repo/github.com/bukzor/prototype.chatfs/` (the entry's `cwd:` is an
incubator there that graduated to `packages/chatfs-cli/`), every
`.claude/todo.md` and `.claude/todo.kb/` in it, and its git log.

- Done: no action in the live entry; record the evidence in Decisions.
- Still open and already tracked in the repo's todo: no action; record
  where it is tracked.
- Still open and untracked: add it to the live entry's open-work list
  (`- [ ]`), worded as it is now, not as it was on 07-20.

Leave the addendum itself unchanged; it is a record.

**Scope (only these files):**

- `/home/bukzor/.claude/sessions.kb/penguin.kb/chatfs-cli-mockup-open-todo-sweep.md`
- this handoff file

## Steps

- [x] Read the four items and the repo's todo files, git log, devlogs
- [x] Settle each item from ground truth
- [x] Record; no live-entry edit needed

## Decisions

All four items are Done; the live entry gains no `- [ ]` line. Repo is
`~/repo/github.com/bukzor/prototype.chatfs/`; evidence per item:

1. Sweep chatgpt/aistudio against the claude template: done. Devlogs
   `design-incubators/chatfs-cli-mockup/devlog/2026-07-21-000-chatgpt-family-edit-pass-package-imports.md`
   and `...-001-aistudio-family-edit-pass-package-imports.md`; commits
   `8d6ca8c`, `497106b` (2026-07-21). The umbrella's
   `module-shape-refactor.md` marks the step `[x]`.
2. Chatgpt-splat's home: decided twice. 07-21 devlog: stays external;
   then folded in by commit `75b98a2` (2026-08-16, "chatgpt: fold
   conversation-splat into chatfs.provider.chatgpt"). Residual question
   (fate of `bukzor.chatgpt-export`'s `har2jsonl.py`) is tracked in the
   repo's `.claude/todo.md` and `todo.kb/2026-08-17-000-bukzor-chatgpt-export-package-fate.md`.
3. README "Run it": done twice over. Landed with the aistudio edit pass
   (module-shape-refactor, "Update the incubator README's Run it" `[x]`);
   later superseded: the incubator README is a Historical banner (no
   "Run it" section), and the package README + `docs/how-to-chatfs.md`
   were re-cut at graduation (commit `f866f4f`, 2026-08-07).
4. Live end-to-end run: done 2026-08-08. module-shape-refactor's Success
   Criteria line is `[x]` (installed claude url-browse against a fresh
   cache); commit `5d5a1bd` "Close graduation child 000: live url-browse
   verified".

## Open Questions

None.

## Final report

No file but this one changed, so no commit of the entry and no validate
run on it; the addendum is untouched. The entry's `.md` still carries no
open-work list, correctly: its remaining backlog lives in the repo's
`packages/chatfs-cli/.claude/todo.md`.
