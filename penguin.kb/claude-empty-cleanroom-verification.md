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

The sharpest finding is that the room is not hermetic in the one dimension
it cannot inspect: `PATH` is untouched by the redirect and `~/.local/bin/claude`
is an absolute symlink into the real `$HOME`, so upgrading Claude Code
anywhere on the machine silently changes what the room runs. The room's own
install attempt fails and is never selected.

Open work lives in `/home/bukzor/repo/claude-empty/.claude/todo.md`:

- [ ] Re-run the upgrade procedure: the machine is on 2.1.227 and every
  claim says 2.1.226, established hours before the upgrade landed
- [ ] Check whether every interactive start re-downloads 61 MB it cannot use
- [ ] Find whether the plugin-marketplace clone can be suppressed
- [ ] Settle whether a permission granted "always" writes into the room --
  the tripwire is armed, but no session has granted one yet

Take the first of those before trusting anything else here.
