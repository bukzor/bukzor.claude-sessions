# 2026-11-10: three lineages, per-branch workspaces, per-host runit

First reunify pickup on buck-win10, four months after penguin's last one
(2026-07-13, task 004 at 7/10 themes). The plan had only ever known two
lineages; this host's `~` was on a third.

**Findings.** `master` here was main as of 2023-07 (`4b003ef`) plus 9 commits:
Windows/WSL integration and a 2026-06 content copy of svelte's `.claude/`.
It merges into main with 5 conflicts and into svelte with 95, so it now
folds into main first (new task 2026-11-10-000), ahead of 004's
claude-config theme. Since 2026-07-13, main ↔ svelte grew from the planned
~0 conflicts to 26: 004's four open themes, 11 paths of svelte-side drift
main never got (mechanical fast-forwards), and a new `bin/alert`
symlink-vs-file split. The `bin/claude-path` hazard from dotfiles `b47f8f6`
is gone (no branch tracks it).

**User rulings** (recorded in the plan and `~/.config/CLAUDE.md`):
`master` → `wsl-buck-win10`; per-branch workspaces at
`~/repo/github.com/bukzor/dotfiles--${branch}/`, with a host's live `~` as
its own branch's workspace; `arch-svelte` archived as tag
`archive/arch-svelte`; the `.config/windows` AppData mount is kept, now as a
runit service in a per-host tree `~/.config/runit/<hostname>/` that
`/etc/service` links to.

**Branch cleanup.** Deleted from GitHub after checking each was fully
contained elsewhere: `testing/new-branch`, `zsh-support`, `verified-is-it`,
`bukzor/unbreak-control-backend-test`, `bukzor/sh-to-py` (a getsentry
tacos-gha history, contained in that repo's main), and two 2013 stray refs
stored outside `refs/heads/` (`refs/remotes/origin/{master,work}`). The
remote now holds `main`, `svelte-crostini`, `wsl-buck-win10`, and the
archive tag.

**Mistakes, both caught.** (1) The first "deleted on svelte" check used
`--diff-filter=D`, which misses renames, so renamed paths read as wsl-only
additions (135 of 216 were gone, not 49); a phantom "keep or drop
`docs/default-context/`" decision reached the user before it was caught.
Count renames as deletions (`--no-renames`) when asking whether a path
survives. (2) Folding a file into an already-pushed, non-HEAD commit was
done with plumbing (temp index + `commit-tree` + compare-and-swap
`update-ref`) to avoid stashing a dirty `~` shared with a live peer; the
first attempt's author env was mangled by word splitting, so read each
field with its own `git log -1 --format=%an|%ae|%ad --date=raw`.
