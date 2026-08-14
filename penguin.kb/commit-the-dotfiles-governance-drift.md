---
cwd: /home/bukzor
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 315152a8-93a9-4305-8bf4-3dad30e4b8f3
  started: 2026-08-13T16:51:27-05:00
  ended: null
---
# Commit the Dotfiles Governance Drift

`/home/bukzor` has roughly two days of uncommitted edits to the files
that govern how every session behaves, and that -- not any repo's
commit log -- is what "so much has changed and I can't tell what's
better versus broken" is describing. The skills repo writes a devlog
per arc and prints a validator count; the dotfiles repo has been
edited in place with no message, no diff to read, and nothing to
bisect. The fog is exactly where the record isn't.

**Do not `reset --hard` or `checkout --` here.** The work is
uncommitted, so there is no reflog to recover it from. Two days of
edits to CLAUDE.md, must-read.kb, and settings.json would be gone. The
instinct to "reset everything to two days ago" is safe in
`bukzor-agent-skills` (all committed and pushed) and destructive here.
That inversion is the single most important fact in this entry.

Inventory as of 2026-08-13T16:51 (last commit before it: `43e96c1`,
08-11 14:05):

- Modified, 11 governance files, +114/-116: `.claude/CLAUDE.md`
  (mtime 08-13 12:42, mid-session, possibly another session's work in
  flight), `.claude/settings.json`, `.claude/hooks/bash-preamble.py`,
  `must-read.kb/before/running-ANY-Bash-commands.md`,
  `must-read.kb/before/using-claude-code-tool/Monitor.md`,
  `must-read.kb/when/redesigning-something-that-already-exists.md` (a
  73-line rewrite), `reference.kb/git/conventions.md`,
  `reference.kb/python/style.md`, `.claude/ideas.kb/CLAUDE.md`,
  `.claude/todo.jsonschema.yaml`, `.claude/.gitignore`
- Deleted, uncommitted: `bin/CLAUDE.md` (69 lines),
  `.claude/CLAUDE.integrate-sessions-kb-into-llm-subtask.Task.md`,
  `.claude/system-prompt-patches.d/strip-help-feedback/search.md`,
  `.claude/tool-description-patches.d/Agent/upstream.d/long-form.md`
- Added, staged: `.envrc`, `.config/sh/env.d/claude.sh`,
  `bin/prettier-markdown`
- Untracked, ~50 entries: all of `.claude/agents/`, fourteen skills in
  the `.claude/skills/` symlink farm (`llm-claims`, `llm-claims-kb`,
  `llm-must-read-kb`, `llm-triggers`, `formalize`, `deformalize`,
  `walled-web`, ...), `.claude/keybindings.json`,
  `claude-alignment-2026-04-29.{jsonschema.yaml,kb/}`, plus real
  scratch (`system.mhtml`, an `.apk`, `empty/`, `scratch/`)

Recommended path, and the reason it is not "just commit it": the
governance files are the operator's own, several are mid-edit, and at
least one was touched by another session 40 minutes before the
inventory. So walk the diff file by file *with the user* and commit in
labeled pieces -- after which every piece is individually revertible
and the fog becomes a list. Do not commit `.claude/CLAUDE.md` or
`.claude/settings.json` without the user reading those diffs first.
The untracked pile wants triage in three buckets, not one commit:
legitimate new content (the skills, `.claude/agents/`), gitignore
candidates (`.elan/`, `.grip/`, `.config/Thonny/`), and scratch to
move to `trash/`.

Cross-check while doing it: `.claude/skills/` is a symlink farm into
`~/repo/github.com/bukzor/bukzor-agent-skills/`, so an untracked skill
there may be a link whose target is already committed elsewhere --
untracked in the dotfiles repo does not mean unsaved.
