# 2026-07-11: task 001 done, mechanical file fast-forwards

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
