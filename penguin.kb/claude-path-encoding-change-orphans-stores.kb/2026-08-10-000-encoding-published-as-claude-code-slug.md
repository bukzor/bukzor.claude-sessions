# 2026-08-10: the encoding became a package, and the copies went away

Four steps, in the order the user set: get dotfiles clean, make a
package, install it, delete the duplicates.

1. **Committed and fixed in place first.** `~/bin/claude-slug` had been
   untracked since 2026-07-05 while being the live encoder; committed
   as-is (`c879ca1`) so the port had a baseline. `~/bin/claude-path` lost
   its legacy inline `sed` and its `--relative-to=.` branch (`d983aad`),
   and `claude-workspace-merge` lost a third inline copy (`b8559b5`).
2. **Ported under proof.** 26 differential cases plus all 53 live
   relocated worktree paths, bash vs. python, 0 disagreements;
   `coherence.py --derived` byte-identical before and after (53
   worktrees, 19 match / 31 legacy / 3 moved, 1012 store dirs).
3. **Installed, then deleted, in one session** (`922d325`) — the order is
   load-bearing: `git-localhost-store` calls a bare `claude-path` on every
   hook firing in ~50 relocated repos, so a gap between delete and install
   breaks `git commit` everywhere.
4. **Published** so other repos could declare it, rather than copy it.

## What the release taught

- **`release-pypi.yml`, not `release.yml`.** The user caught that I had
  violated their own written policy (`template.python-project`
  `docs/dev/technical-policy.kb/least-privilege-grants.md`): a trusted
  publisher binds `(owner, repo, workflow-file, environment)`, so the
  workflow file *is* the grant, and one registry per file. Package stays
  a tag parameter (`<dist>-v<version>`); registry is the file. Caught
  before registration, which matters — OIDC claims pin the filename and
  PyPI honors no rename redirect.
- **A rehearsal that TestPyPI cannot give you.** `workflow_dispatch`
  builds any member, skips the upload, and mints an OIDC token at
  `pypi.org/_/oidc/mint-token` — proving *this* registration works. A
  TestPyPI dry run exercises a different publisher against a different
  index, so it proves nothing about the one you are about to use.
- **The irreversible step is the successful upload, not the attempt.** A
  failed publish uploads nothing and burns no version; the same tag
  re-runs. So metadata review belongs before the first tag, and
  rehearsals are cheap.
- Name availability is squashed-name equality against every existing
  project, not a 404: `claudecodeslug` matched none of 862,370.

## Corrections worth keeping

- I claimed a dangling symlink in `git-localhost-store/bin/` would fail
  `git commit` in ~50 repos. False: line 33 calls a *bare* `claude-path`
  through PATH, so that symlink binds only under the test harness. What
  breaks ~50 repos is the command missing from PATH entirely.
- I claimed dotfiles was unpushed. It wasn't — `origin/svelte-crostini`
  already had the cutover commits.
- The parallel session's finding, which I agree with: **a declared
  dependency fixes provisioning, not selection.** The hook still says
  `claude-path`, and `~/bin` still precedes `~/.local/bin`.
- The parallel session retracted a claim on my evidence: PEP 723 gives
  standalone operation *and* a declared dependency, so "a caller who
  wants to work standalone is refusing to declare" was false.

## Shipped

`claude-code-slug` 0.1.0 (bukzor-tools `e018acf`, `b575309`, tag
`claude-code-slug-v0.1.0`); `bukzor-agent-skills/bin/claude-slug` as a
PEP 723 script (`ba513bc`); git-localhost-store's own docs corrected to
the rule that actually runs (`34e8291`).
