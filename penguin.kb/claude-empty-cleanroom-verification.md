---
cwd: /home/bukzor/repo/claude-empty
focus:
  - CLAUDE.md
  - .claude/todo.md
session:
  uuid:
    - 430f8c97-9648-4ea5-ab03-da3113d69c13
  started: 2026-08-10T18:32:37Z
  ended: null
---
# Claude-Empty Cleanroom Verification

Establishing, by probe, what a Claude Code session actually reads and writes
in the disposable `$HOME` at `claude-empty/home/`, and recording each finding
in `background.kb/` scoped to the version it held under. Settled this session:
project settings load from the working directory only (no walk to the parent
or the git root), and an interactive start writes nine paths that `claude -p`
never produces. The ignore rules were flipped from a `/*` allowlist to naming
only observed exhaust, so new pollution reports itself in `git status`; an
empty tracked `home/.claude/settings.local.json` is the tripwire for anything
writing settings into the room.

Open work lives in `/home/bukzor/repo/claude-empty/.claude/todo.md`:

- [ ] Find whether the plugin-marketplace clone can be suppressed
- [ ] Settle whether a permission granted "always" writes into the room --
  the tripwire is armed, but no session has granted one yet

The next pickup should re-run `testing.kb/smoke-test-the-room.md` first: the
room auto-updates its own binary, so a claim's `version:` can go stale with
no tracked file changing.
