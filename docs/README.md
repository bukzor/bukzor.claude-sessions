---
last-updated: 2026-07-11
---

# bukzor.claude-sessions

Session index for Claude Code: tracks planned and in-flight coding-agent
sessions across cwds, repos, and skills, so the next session can recover
open lines of work. See `CLAUDE.md` for the full collection conventions
(what belongs, per-host layout, push/pointer-bump cadence, lifecycle).

## Origin

Extracted from `bukzor/dotfiles` (2026-07-09) via `git filter-repo`, to
isolate this high-churn working journal's file-level history from
dotfiles' log/blame. A full symmetric split: this repo got the complete
extracted history (`bukzor.` prefix so forks default to
`<forker>/bukzor.claude-sessions`, preserving the "by bukzor, for
bukzor, open-sourced" signal a bare `claude-sessions` name would lose);
`.claude/sessions.kb` was in turn stripped entirely from dotfiles' own
history (force-push rewrite of the shared `svelte-crostini` branch,
confirmed landed by 2026-07-11). Public, not private — sessions.kb was
already public inside `bukzor/dotfiles`, so the split creates no new
exposure, and public repos keep GitHub Actions minutes unmetered if CI
is ever added. Wired back into dotfiles as a **git submodule**, not a
gitignored plain clone, mirroring the existing `repo/scratch` submodule
convention.
