---
cwd: /home/bukzor
session:
  uuid:
    - 545f4138-cfb5-410d-b6f4-2d73afd7856a
    - 58689610-0fee-4260-ac2f-eccd37c487f8
    - 21220341-2ef8-4c38-81ce-050119106309
  started: 2026-07-06T18:30:00-05:00
  ended: null # set only when no more sessions are expected (~= about to delete this file) -- not "my conversation ended"
---
# Reunify Dotfiles Lineages (supertask)

Umbrella for the multi-session effort to converge svelte-crostini ↔ main
(disjoint histories, no merge base; 58 shared paths differ) to identical
content, merge with zero conflicts, and live on main. The planning session
(uuid above) produced the full plan; execution spans several future sessions.

Plan of record — do not duplicate here:

- Goal, execution order, operating loop:
  `~/.claude/todo.kb/2026-07-08-000-Reunify-dotfiles.md` (pointed to from
  `~/.claude/todo.md`)
- Task files (one per session/commit-group): `~/.claude/todo.kb/2026-07-08-000-Reunify-dotfiles.kb/`
- Working agreements (topology, single-writer-per-branch, file ownership):
  `~/.claude/todo.kb/2026-07-08-000-Reunify-dotfiles.kb/CLAUDE.md`

See sibling session entry `shell-function-unit-testing-and-ci-regression-harness.md`
for the CI/testing-foundations pairing.

Delete this file when the supertask's todo.kb entry is fully checked and
006's switchover is done.

## For User Review (2026-07-12, latest -- task 003 done)

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

### Earlier 2026-07-11 work (superseded/resolved, kept for context) -- task 002 done

Task 002 (stale-seed adjudication) is done: 2/9 files were genuine
stale-seed (`.config/gh/.gitignore`, `.config/pnpm/rc` — took main's
side), the other 7 turned out **not** to be stale-seed at all on
closer read. The task file's date-based classifier ("main's
2025-08-20 pass is presumptively ahead") missed: content that moved
rather than went stale (`.vimrc`'s logic lives in `.vimrc.d/*.vim`
now, edited as recently as 2026-05-12), a file where svelte is
already strictly ahead (`.vim/init.lua`'s target, rewritten
2026-05-05 for nvim 0.11 vs. main's 2023 copy), and several
genuinely-mixed configs where a blind take-main would have silently
deleted live svelte content: `.gitmodules` (would drop the
sessions.kb submodule this very session runs on), `.config/gh/config.yml`
(would drop the `markdown-preview` alias backing the untracked
`.grip/` dir sitting in the tree), `.config/gcloud/.gitignore` (would
drop 5 gcloud-transient ignore patterns main lacks), `.ssh/.gitignore`
(main's `!*.pub.*` pattern is narrower than svelte's `!*.pub` and
wouldn't track svelte's actual key-naming convention),
`.config/kitty/kitty.conf` (svelte's 3-line file has a
crostini-specific `linux_display_server x11` main's 2251-line default
dump lacks, and main's file depends on a main-only theme submodule).
All 7 escalated to 004 with per-item findings recorded so it can
author the merges without re-deriving any of this. Also checked
content of every main-only `.ssh/` file this touches (7 pubkeys +
authorized_keys + client config) for secrets — none found, all public
material, though main's `.ssh/config` hardcodes macOS paths that will
need an OSTYPE guard when 004 gets there. Commits:
`a8793c4`/`a2b7ff2` (svelte, pushed); nothing needed on main for this
task. Full harness green.

Next: 003 (main-only path triage) is still fully open, not started
this session.

### Earlier 2026-07-11 work (superseded/resolved, kept for context)

Task 001 (mechanical file fast-forwards) is done: all 26 classifier-verified
paths are now byte-identical between main and svelte-crostini. Added a
permanent regression guard first (test-first): `mechanical-fast-forwards_check.sh`
at repo root, landed identically on both branches, using `redo-always` +
`git diff HEAD origin/<other-branch>` since branch tips aren't file deps;
required adding CI's `fetch-depth: 0` (both branches' `check-sh.yml`) so
`origin/main`/`origin/svelte-crostini` are both reachable. Verified red before
the fast-forwards, green after, on both branches (`redo -c test` clean
end-to-end). Commits: svelte-crostini `7ba94f2` (check), `fad2951`/`4e80e78`/
`7111ed5` (19 files, three thematic batches), `d54fc9a` (003 note), `57812e9`
(task-file checkoff); main `661e5ae` (check), `d84c30e` (7 files). All pushed.

One finding along the way, bounced to todo 003 rather than 004 (no same-path
divergence, just a main-only dependency): main's fast-forwarded `.pythonrc.py`
imports `bukzor.readline` from main-only `lib/python/bukzor/` (23 files) --
a separate namespace package from svelte's existing `lib/pythonpath/bukzor/`,
no filename overlap. Currently inert (`PYTHONSTARTUP` unset on svelte), so
not urgent, but 003 needs to decide keep/rename/delete for it.

Also caught and corrected my own mistake mid-session: a `git commit` (no
pathspec) on svelte-crostini swept in an unrelated pre-staged file
(`bin/prettier-markdown`) alongside the intended check-script commit.
Caught immediately via `git show --stat`, fixed with `reset --soft HEAD^` +
re-stage + `git commit -- <pathspec>` (twice, once per accidental file),
restoring `bin/prettier-markdown` to its original staged-not-committed state.
Lesson reinforced: always commit reunify work with an explicit pathspec,
given how much unrelated uncommitted/staged material sits in live `~`.

Next: 002 (stale-seed adjudication) and 003 (main-only path triage) --
mutually independent, both still fully open.

### Earlier 2026-07-11 work (superseded/resolved, kept for context)

Task 000 (shell config unification) is now fully closed except its one
deliberately-deferred item (delete superseded `.sh_env`/etc., waits on
005). Folded in main-only `.sh_env` content: ported CPUTYPE/OSTYPE,
macOS `path_helper`, TMPDIR selection, the private-dotfiles hook, and
TERM-fixing into five new env.d files + two functions.d helpers,
authored once, applied byte-identical to both branches. Commits:
`855ac0d` (svelte), `31b7c44` (main), task-file update `8fa804e`. Full
clean harness (`./.local/share/redo/do test`, all 4 shells): 137/137
assertions green on both branches, shellcheck clean.

Three adaptations beyond a literal port, all because env.d is
re-sourced by every shell (unlike main's interactive-session-scoped
`.sh_env`): TERM-fixing gated behind `tty`; path_helper's PATH output
routed through the existing idempotent `path()` function instead of a
raw `eval` (untestable here, no macOS -- verify live if it ever lands
on one); dropped main's `$PREFIX` TMPDIR candidate (name collision
with this tree's own, differently-scoped `$PREFIX`).

Two incidental fixes: a stale `test.did` marker was silently no-op-ing
local (non-CI) harness runs since 2026-07-08 (removed, CI itself
unaffected); main's nested `.gitignore`s were missing `*.did`/
`*.did.tmp` re-ignores alongside their existing `*.tested`/`*.checked`
ones (added). Also swept up two unrelated doc-drift fixes sitting
uncommitted in `.claude/todo.kb/` since before this session (wrong CLI
flag, missing `.kb` suffix in a path reference) — commit `74120d0`.

Next: 001/002/003 (mutually independent) are up per the execution
order.

### 2026-07-09 work (superseded/resolved, kept for context)

CI-foundations is now fully checked off (only remaining item, CI
`fetch-depth: 0`, is deferred to whichever of 001/006 writes the first
cross-ref check — not a blocker). Task 000 (shell config unification):
svelte-side done earlier; this session did the main-side mechanical
mirror — `.config/sh` tree + `.profile`/`.bashrc` + both test files copied
to `dotfiles--main-reunify`, all 20 shell-matrix cells + no-dead-paths
check green via the vendored zero-dependency harness. Commits: `d7dac7a`
(main), `1aedb00` (svelte, task-file updates).

Two narrow harness/gitignore gaps found and fixed while mirroring (both
additive, not the full ignore-scheme reconciliation 004 owns):
`test.do` on main predated `.bashrc_test.sh` (added on svelte after the
harness first landed) and silently skipped its whole shell matrix;
`.config/.gitignore`'s and `lib/.gitignore`'s un-ignore-everything-non-dotfile
rules were also un-ignoring generated `*.tested`/`*.checked` stamp
certificates — added re-ignores to both.

Decision made: main's homebrew PATH port keeps svelte's current
unconditional prepend, no OSTYPE branch (user chose this over adopting
main's original Linux-append rationale, to avoid a live PATH-ordering
change on this actual machine).

New finding, recorded in 003's task file: the main-reunify clone's root
`CLAUDE.md`/`.claude/CLAUDE.md` carry an old, different convention set
(TodoWrite-disabled/`bin/trash`/"REVIEW NEEDED:", self-declared as
overriding everything) — superseded by the current `~/.claude` system,
flagged as a concrete example under 003's already-planned `.claude/`
main-only-subset triage.

Still open in 000: folding in main-only `.sh_env` content (OSTYPE/CPUTYPE
exports, macOS `path_helper`, TMPDIR selection, private-dotfiles hook,
TERM-fixing) — plan written in the task file, TERM-fixing flagged as the
one fragile piece to scope carefully if it doesn't test clean.

### Earlier 2026-07-09 work (superseded/resolved, kept for context)

1. **Resolved (was flagged blocked, then corrected on your
   feedback):** I'd initially escalated "land the harness on main" as
   blocked on task-004-owned root `.gitignore`, presenting it as a
   decision only you/004 could make. You pointed out that was silly —
   the plan is amendable, not frozen because a file got assigned to a
   later task. Correct: the fix needed was a narrow, additive `!`
   opt-in for four new root files plus two new nested `.gitignore`s
   (`.github/`, `.local/share/redo/`), not the full ignore-scheme
   reconciliation 004 actually owns (main's deny-first vs. svelte's
   allowlist-of-ignores — still open). Landed directly: commit `b59d84f`
   in `dotfiles--main-reunify`, `./.local/share/redo/do -c test` green
   there. Noted the narrow/full split in 004's task file so it doesn't
   redo the slice.
2. **Portability gap, not yet a blocker:** `with_pty` (helper for
   task 000's `-i` startup tests) wraps `script -qec`, which is
   util-linux-only (`-e`/`--return`, added 2.35). BSD/macOS `script(1)`
   has no equivalent flag. Fine today — both runners (crostini, GitHub
   ubuntu-latest) are Linux — but if a startup test ever needs to run on
   macOS, `with_pty` needs a second implementation or an OSTYPE branch.
3. **Corrected a stale planning assumption:** CI-foundations' Open
   Questions claimed main's `.github/` carries Check Vim/Neovim/lint-lua
   to reconcile against svelte's check-sh.yml. Verified empirically
   (`git ls-tree origin/main -- .github` is empty; local `main` ==
   `origin/main`) — main has zero tracked `.github/` files. All four
   workflows exist only on svelte. Nothing to reconcile there for now;
   corrected in the task file.
4. Checked for a live collision risk (flagged an earlier session: a
   concurrent session once renamed a directory mid-edit under `~`).
   Grepped `sessions.kb` for other entries scoped to `cwd: /home/bukzor`
   with no `ended:` — one hit, `move-skill-triggers-to-must-read-kb.md`,
   but it has no `session.uuid` (never started, planned only). No active
   writer found — rechecked this session too, same result.
