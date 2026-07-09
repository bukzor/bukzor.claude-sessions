---
cwd: /home/bukzor
session:
  uuid: 252c1bfb-8743-4ca6-8f1f-f722b19d32cd
  started: 2026-07-09T09:54:58-05:00
  ended: 2026-07-09T11:55:46-05:00
---
# Extract sessions.kb to private repo (planned)

Move `~/.claude/sessions.kb/` out of the dotfiles repo into a private
GitHub repo (`bukzor/bukzor.claude-sessions`), wired back in as a git
**submodule** at the same path (changed from a gitignored plain clone
— user already uses submodules extensively, e.g. `repo/scratch` →
`bukzor/scratch.git`, and prefers that pattern here too). Isolates the
high-churn working journal's file history from the dotfiles log/blame;
the gitlink pointer is bumped lazily/as-needed, not after every
sessions.kb-side commit, which is what keeps this from just
relocating the churn.

Procedure: `~/.claude/CLAUDE.Task.extract-sessions-kb-to-private-repo.md`.

## Status (as of 2026-07-09 session end)

All pre-flight decisions below are locked in. **Execution has not
started** — next session picks up at Task.md step 1 ("Create repo").
Also landed this session, unrelated to execution but adjacent: pushed
3 closed-session sessions.kb entries that were sitting uncommitted
(`implement-defaultunity3dddo-extraction.md`,
`reunify-dotfiles-lineages.md`,
`shell-function-unit-testing-and-ci-regression-harness.md` — commit
`42185eb`). Still uncommitted and deliberately held back: 3 live
(`session.ended: null`) sessions.kb entries
(`abby-python-is-fun-curriculum.md`, `installing-termux-steps.md`,
`pyright-clean-sweep-bukzor-agent-skills.md`) — not this task's
concern, belongs to their own sessions.

## Decisions (confirmed by user 2026-07-09)

1. Repo name: `bukzor/bukzor.claude-sessions` (private). The
   `bukzor.` prefix is deliberate — a fork keeps the repo name, so
   forks default to `<forker>/bukzor.claude-sessions`, preserving the
   "by bukzor, for bukzor, open-sourced" signal that a bare
   `claude-sessions` name would lose.
2. History, as an ideal: full symmetric split via `git filter-repo`.
   New repo gets sessions.kb's complete history extracted; dotfiles
   gets sessions.kb stripped from its history entirely — so that
   dotfiles' current `.git` contents equal the union of the two
   post-split `.git` contents. This is a real history rewrite of the
   shared `svelte-crostini` branch (68 of 358 commits touch
   `.claude/sessions.kb`, so most commits from the first touch onward
   get new SHAs) — **needs an explicit go/no-go separate from this
   plan**, since it force-pushes and invalidates other clones/hosts
   until they're reconciled too.
3. Per-host subdir layout confirmed: `sessions.kb/<hostname>/`. This
   host is `penguin`.
4. Wiring: **submodule**, not a gitignored plain clone (changed
   2026-07-09). Mirrors the existing `repo/scratch` submodule —
   ordinary `git submodule add`, checked out on a real branch (not
   detached), `active = true`. Churn mitigation: bump the dotfiles
   gitlink pointer only as needed (`git add .claude/sessions.kb &&
   git commit-files .claude/sessions.kb -- -m '…'`), not after every
   sessions.kb-side commit — dotfiles will often show the submodule as
   "modified (new commits)" between bumps, and that's fine.

## Working copy

Do the `git filter-repo` surgery in `~/repo/github.com/bukzor/dotfiles`
(a second clone of `origin` — disposable for history rewrites), not
directly in `~`. Canonical commits/pushes still happen from `~`; pull
into the working copy as/when needed to keep it in sync.

The submodule-add itself (step 5 in the task doc) has to happen in `~`
directly — it needs the real working tree, not a scratch clone.

## Branch note

`svelte-crostini` is an orphan branch in `bukzor/dotfiles` (no common
ancestor with `main` — confirmed via `git merge-base`, exits empty).
For this work, treat `svelte-crostini` as the effective main line and
ignore the branch literally named `main`.

## Risks

- Secrets in history; run `gitleaks detect` before pushing.
- Stripping sessions.kb from dotfiles history is a force-push rewrite
  of a shared branch — coordinate with/update any other host clones
  before or immediately after, or they'll diverge silently.

## Delete When

Extraction landed, all hosts wired up, Task.md absorbed into the new
repo's README. Or when the plan is abandoned.
