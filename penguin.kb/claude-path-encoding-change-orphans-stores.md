---
cwd: /home/bukzor
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 9db82d95-5657-42af-a999-79de22ee0ca2
    - 1f386728-d6ea-46ca-addc-04505b6895b2
  started: 2026-07-27T16:20:39-05:00
  ended: null
---
# Claude-Path Encoding Change Orphans Git-Localhost-Store Stores

The encoding `git-localhost-store` names its stores by is now one
published function: **`claude-code-slug` 0.1.0 on PyPI**, providing the
`claude-slug` and `claude-path` console scripts. Every character that is
not ASCII alphanumeric becomes exactly one `-`.

The question this entry opened — revert to the pre-2026-07-05 rule, or
adopt the new one — is settled as **adopt, and freeze**. Nothing migrates:
store directories are *named* by the function, so an "improvement" to it
orphans stores rather than renaming them. 31 of 53 live relocated
worktrees still carry legacy keys and keep working, because the encoding
is consulted only when a store is created or recovered.

Ported under proof, not by inspection: 26 differential bash-vs-python
cases (unicode, empty string, bare dashes, dotted segments, nonexistent
paths) and all 53 live worktree paths, 0 disagreements; `coherence.py
--derived` byte-identical before and after.

State on disk:

- `claude-slug` / `claude-path` resolve to `~/.local/bin/*`, symlinks into
  the `bukzor-tools` uv-tool venv. `~/bin` holds neither.
- One implementation remains (`claude_code_slug/slug.py`); the four
  skills scripts, `claude-workspace-merge`, `claude-jsonl-{cwd,path}` and
  `bukzor-agent-skills/bin/claude-slug` all delegate.
- `coherence.py --shadow` exits 0.

The formal account lives in `~/claude/bukzor-packaging/` (kb) and
`bukzor-packaging.claims.kb/` (ledger), maintained by a parallel session;
`coherence.py` there is the standing check.

Open:

- [ ] Package `git-localhost-store` itself — see
      `package-git-localhost-store.md`. Until then the hook resolves a
      bare `claude-path` through PATH, so a correct encoder is installed
      but not *selected*.
- [ ] Watch the dotfiles reunification: `~/repo/github.com/bukzor/dotfiles`
      still carries a legacy `bin/claude-path`, and `~/bin` precedes
      `~/.local/bin`. Tracked in `~/.claude/todo.md`.

## Addenda

`claude-path-encoding-change-orphans-stores.kb/`
