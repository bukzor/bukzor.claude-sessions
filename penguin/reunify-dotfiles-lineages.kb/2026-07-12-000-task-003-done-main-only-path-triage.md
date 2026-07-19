Part of `../reunify-dotfiles-lineages.md`.

# 2026-07-12: task 003 done, main-only path triage

Task 003 (main-only path triage) is done. User flipped the task's default
bias mid-session: from "subtract, delete when unsure" to "keep by
default, delete only what demonstrably breaks/conflicts" — reasoning
that main-only paths are inert additions and `bukzor/dotfiles` is
already public, so nothing gains new exposure by surviving into the
merged tree. Swept every remaining main-only directory (~225 files, two
parallel forks) against that bar. Four real conflicts found and
resolved, all deleted on main (commits `9534d37`, `1b59dd1`) with
matching svelte-side action where needed:

- `bin/claude` + `.local/bin/claude` — verified live: would have broken
  the `claude` CLI itself on this machine (macOS-path symlink shadowing
  the real, working install).
- `.config/direnv/lib/stdlib.sh` — broken macOS-path symlink; direnv is
  actively hooked on every prompt here, would have errored on first use.
- `bin/vim` — would have shadowed the alternatives-managed vim launcher;
  deleted so main matches svelte (which has no `bin/vim`) exactly.
- root `CLAUDE.md` — old, self-declared override-everything convention
  set, incompatible with the live `~/.claude` system. (`.claude/CLAUDE.md`
  nested is a separate, same-path divergence, not main-only — corrected
  mid-session, bounced to 004.)

Caught and corrected two of my own research errors this session, both
after the user pushed back rather than me catching them proactively: (1)
a sub-agent sweep misclassified `.vim/pack/invented-here/start/
{cursorline,diffmode,osc52}/` as main-only and I relayed it without
verifying — user asked "don't we have a lot of that in svelte-crostini?"
and was right, these already exist on svelte (two byte-identical, one
trivially divergent, already tracked in 004). (2) `bukzor.readline`
(main-only `lib/python/bukzor/`, 23 files) — user said keep it as an
improvement and wire up `PYTHONSTARTUP`; did that, but initially left it
as a second PYTHONPATH root (`lib/python` alongside the existing
`lib/pythonpath`) instead of noticing the redundancy myself. User asked
which name should win; folded into the established `lib/pythonpath/
bukzor/` (zero filename overlap, clean merge) on both branches
(svelte `732f73b`, main `23cb2ea`). Verified at every step: merged
namespace-package imports, `PYTHONSTARTUP` firing in a real
`python3 -i` session, full shell test harness green throughout.

Also noticed a live concurrent-writer signal: commit `f3f19e3` ("todo.kb/
Task.md: gc 4 completed items") landed in `~` mid-session, authored by
the user with Claude co-authorship, timestamped ~1 minute after this
session's `/session-end` began — confirms another session was active in
the same `~` checkout concurrently. No path overlap with this session's
work, no conflict, just worth knowing another writer was live.

003 is now fully closed (`status: done`): dropped the permanent
dangling-ref check script (temporary concern, not worth CI investment),
re-ran the final path-list regen for real (caught a stale
`origin/svelte-crostini` ref mid-check) — exact reconciliation: 373
original main-only paths − 5 deleted − 25 converged (the ported
`bukzor.readline` package) = 343 remaining, all deliberately kept.

Next: 005 (zsh port) is next per execution order (000's success criteria
are all met; 005 was the reason its one remaining item was deferred).
004 (hand-merge true divergences) is independently available too —
003 escalated a few small items to it this session (`.claude/CLAUDE.md`,
the trivial `diffmode.vim` divergence).
