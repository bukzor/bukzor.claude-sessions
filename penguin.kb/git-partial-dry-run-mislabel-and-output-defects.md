---
cwd: /home/bukzor/repo/github.com/bukzor/git-partial.prototyping
session:
  started: null
  ended: null
---
# git-partial: dry-run mislabel and output defects

Follow-ups surfaced 2026-09-10 while using `git commit-staged` /
`git commit-files` from a dotfiles session (that session's own work —
a `must-read.kb` entry for headless `git add --patch` — is done and
pushed as dotfiles `05ba082`).

Details live in this repo's own `.claude/todo.md`, which owns them;
this entry exists so a session starting in `~` can still see the line
of work.

## Open work

- [ ] Dry-run prints `M` for a path the index holds as `A` — the
      wrong-scope guard can't distinguish add from modify
- [ ] Commit output prints the tool name where git prints the branch
      (`[commit-staged 05ba082]`)
- [ ] Stale `.git/index.commit-staged.*` temp indexes — 9 here, 0 in
      three other repos; all predate 2026-02-04, so not an ongoing
      leak. Probably just delete them; the unreachable cleanup on the
      `exec()` success path is a separate call

## Notes for the next session

`.claude/todo.md` frontmatter still asserts `'zero residual: all inline
items done'`. That was already false before this session (an
uncommitted `--take-worktree` item preceded mine) and is more so now.
Re-rate it when someone runs the cost-benefit pass; I declined to mint
confidence values I had no basis for.

That repo also carries two unrelated uncommitted edits (`.claude/todo.md`
three-version-bail item, `.claude/todo.d/2025-12-15-000-generate-manpage.md`
status frontmatter) belonging to another session. Left untouched; my
commits staged only my own hunks.

The fourth item this entry once carried — renaming
`discovered-constraints.kb/no-git-plumbing-for-hunks.md` to scope its
claim to reading — is done, and never needed the ruling it was filed as
awaiting. The bullet asserted "the rename is free" and escalated anyway;
that escalation was minted by the agent, not requested. No law was added
for it: `Rename aggressively` already licensed the act, and Standing
Defaults already said a prior todo is a guess, not a ruling.

## Cross-references

- Sibling git-partial follow-up: `fix-git-partial-commit-staged-rename-pair.md`
- The staging technique these bugs turned up under:
  `~/.claude/must-read.kb/before/git/staging-part-of-a-file--git-add-p.md`

## Delete When

All three items are resolved, or folded into the repo's own tracking and
no longer worth surfacing from `~`.
