# 2026-07-12: task 005 done, zsh port

Task 005 (zsh port) is done: svelte-crostini had zero interactive zsh
support (just a cargo line in `.zshenv`); it's now fully wired onto the
`.config/sh` structure from task 000 (new `zshrc.d/`, `.zshrc`, real
`.zshenv`, `.zprofile` symlinked to `.profile` matching main's own
2017 convention), mirrored to main, both pushed (svelte `0881278`,
main `8efa600`).

One mid-task decision needed your input and got it: the task file's
own checklist ("port cross-shell PS1 from main's `.sh_rc` into `rc.d`")
conflicted with its own success criterion ("bash behavior unchanged"),
since `rc.d` is shared between both shells. Asked directly; you chose
to widen scope -- main's colored, multi-line PS1 now replaces bash's
plain Debian-style prompt too, for both shells. Recorded in the task
file as a deliberate supersession of that criterion, not an oversight.

Test-first paid off finding two real bugs, not just main-parity gaps:
`zkbd`'s interactive terminal-detection wizard has no committed keymap
matching this host's actual terminal, and needs a real controlling
terminal to complete -- without one (CI, non-interactive invocations)
it stalled ~10s then corrupted keybindings (every `$key[...]` bind
failed with "cannot bind to an empty key sequence"). Fixed by gating
the autoload attempt on `tty -s` and guarding every zkbd-derived
binding. Also found `rc.d/direnv.sh`'s new zsh branch erroring ("bad
math expression") when `precmd_functions` had never been declared --
fixed with `typeset -ga` before the subscript search.

Chased a flaky version of the new `zsh-startup_check.sh` through a
real debugging rabbit hole before landing on the actual cause: this
host has two different `zsh` binaries (homebrew's, `$VENDOR=pc`, vs.
the apt-packaged system one at `/usr/bin/zsh`, `$VENDOR=debian`) that
disagree, and the check's hermetic setup was computing `$VENDOR` using
the wrong one relative to which binary the restricted-PATH test
invocations actually resolved. Once fixed, verified deterministic
across repeated runs. Also caught and fixed a second portability bug
this same debugging pass surfaced: the check assumed `$repo/.cargo`
exists, true in a real homedir but not in an arbitrary clone (broke
when I ran the same check against the main-reunify clone) -- now
stubs `.cargo/env` instead of relying on it being present.

One deliberate deviation from the task's own checklist: main's
`.sh_lib` was NOT retired (checklist said retire it alongside
`.sh_env`/`.sh_rc`/`.sh_advanced_rc`/`.sh_plugins.d`). Found `bin/
gcpenv` (already byte-identical on both branches) independently
sources `.sh_lib/minimal.sh` -- deleting it would have broken a real,
working tool on main. It's already broken the same way on svelte
(pre-existing gap, unrelated to this task). Filed as a new follow-up
in the task file rather than silently deleting or silently expanding
scope to fix gcpenv too.

Also corrected mid-session, twice, on things I got wrong: reflexively
reached for the vendored `.local/share/redo/do` (meant for CI/bare
checkouts per its own docs) instead of checking whether real `redo` was
installed here first (it was) -- you caught this immediately. And an
early "full suite green" claim was false -- redo had silently skipped
a batch of `*.tested`/`*.checked` targets it considered externally
modified ("you modified it; skipping"), left over from that vendored-do
run; you caught this too. Cleared the stale certificates and reran for
a real pass both times after.

Next: 004 (hand-merge true divergences) is next per execution order
(000/001/002/003/005 all done now); 006 (final merge + switchover) is
strictly last, waiting on 004.
