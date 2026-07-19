Part of `../chatfs-cli-mockup-open-todo-sweep.md`.

# 2026-07-12: finished index rung, caught the branch up with main, fixed a stale todo bullet

Three pieces of work, in order:

1. **Finished Immediate plan step 2 for real.** The index-rung scripts
   (`pluck.jq`/`splat.py`/`browse.sh`) that 2026-07-11's write-up called
   "deliberately deferred" were actually already sitting uncommitted in
   the working tree, written and passing. User corrected the framing:
   not a new commit, an amend — "as if the work was done correctly the
   first time." Amended the 2026-07-11 index-rung commit in place (same
   author/date preserved), rewrote its message and the devlog to match,
   live-tested the browse script end-to-end with the user driving the
   actual browser interaction. See step 2's write-up above (rewritten
   this session; the old "still not done" version is git-blame-only
   now).
2. **Cherry-picked main onto the working branch (`post-hoc`) to catch it
   up post-hoc.** Main had progressed 11 commits past the pre-amend
   commit (render/path_render, the full unification pass, rosetta
   endpoint work) while this branch was doing the index-rung amend in
   parallel. `git cherry-pick <old-sha>..main` replayed all 11 cleanly
   except for `.claude/todo.md`/`todo.kb/...parity-ladder.md`, which
   conflicted three times — always the same two files, always because
   both branches had independently written competing "done" narratives
   for overlapping AI Studio work. Resolved by merging the narratives
   (keep whichever side reflects real landed work, drop stale "not
   written yet" text once superseded on either side) rather than picking
   a side wholesale. Zero code conflicts — `chatfs_aistudio_types.py`
   auto-merged clean even through the large unification commit. Verified
   after: `git diff main post-hoc --stat` showed exactly the 9
   index-rung files as the residual delta, nothing else diverged;
   basedpyright/pytest clean. User then renamed `post-hoc` → `main` (old
   `main` → `main.old`, later force-deleted once confirmed as pure
   history, no content loss) and force-pushed.
3. **Fixup + autosquash rebase for a stale todo bullet, and its
   knock-on hash-reference cleanup.** Asked "what's next" surfaced a
   genuinely stale `.claude/todo.md` line (`Rename incubator...` still
   `[ ]`/"in flight" — a leftover duplicate of Immediate plan step 1,
   which was already `[x]`). Root cause, found by bisecting the
   conflicts: the commit that introduced the "Immediate plan" section
   (`chatfs-cli-mockup: record the agreed execution plan and decisions`)
   wrote that stale "in flight" text onto the *old* duplicate bullet in
   the same breath it declared step 1 done in the *new* section — a
   self-inconsistency baked in at authoring time, not introduced later.
   Fixed via `git commit --fixup=<rename-commit>` + a non-interactive
   `GIT_SEQUENCE_EDITOR=true git rebase --autosquash`, which required
   resolving the same conflict shape three more times as the fixup
   replayed forward through history (each subsequent commit's diff
   still carried the stale text as unchanged context, since main never
   fixed it either). This is the *second* time in this repo's history a
   fixup-rebase has rewritten commit hashes out from under docs that
   cited them by SHA (see `0955d9b`, "Fix stale commit-hash references
   after yesterday's fixup rebase" — same failure, one day earlier).
   User's call this time: stop citing SHAs in these docs at all, switch
   to commit titles (verified unique on `main` first) — durable across
   future rebases where a SHA isn't. Landed as a follow-up commit
   ("docs: reference rebase-affected commits by title, not SHA").
   Force-pushed the rebased `main` at session end, confirmed by the user.
   basedpyright/pytest re-verified clean post-rebase.

Backlog is unchanged by any of this (see `.claude/todo.md`'s Next/Claude
gaps/Strategic/Later sections) — nothing here was scheduled work, it was
finishing already-in-flight work plus repo hygiene surfaced along the
way.
