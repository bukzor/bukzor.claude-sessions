Part of `../reunify-dotfiles-lineages.md`.

# 2026-07-09: CI-foundations checked off, task 000 main-side mirror

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
