Part of `../reunify-dotfiles-lineages.md`.

# 2026-07-11: task 000 closed, main-only .sh_env content folded in

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
