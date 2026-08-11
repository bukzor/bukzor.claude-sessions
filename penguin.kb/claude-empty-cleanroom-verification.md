---
cwd: /home/bukzor/repo/claude-empty
focus:
  - CLAUDE.md
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

Nothing is scheduled, on purpose: the repo has no task list. Its three open
questions are `> [!QUESTION]` blocks inside the entries they belong to, and
each settles as a side effect of using the room rather than by anyone going
to work on it.

The one thing to do before trusting a result from the room is re-check the
claims under whatever version is in front of you --
`testing.kb/after-a-claude-code-upgrade.md`. Everything here was established
under 2.1.226, and the machine moved to 2.1.227 hours later.
