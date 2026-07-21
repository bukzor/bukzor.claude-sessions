# 2026-07-11 addendum (Immediate plan step 4: unification)

Closed the Immediate plan (all 4 steps) — see step 4 above for what
shipped. Also touched `packages/bukzor.chatgpt-export/` (outside this
incubator) for the `<details>`-wrapping requirement.

Two mistakes, both recovered clean, full account in the devlog
(`devlog/2026-07-11-002-...`):

- Used `git stash` mid-session (project convention explicitly bans it)
  to A/B basedpyright's warning count; `basedpyright` exits 1 on any
  warning, which under the Bash tool's `set -e` skipped the paired
  `git stash pop` in the same compound command. Caught via `git stash
  list` before starting new work; recovered with a standalone `git
  stash pop`. Nothing lost, but a reminder to run stash push/pop (or
  better, not stash at all — throwaway-branch commit is the house
  convention) as fully separate commands, never chained.
- An `har-browse` stub for smoke-testing AI Studio's new
  `path_browse.py` read its replay source from the same path
  `capture()` was about to `unlink()`, clobbering the only real AI
  Studio demo fixture (`chatfs.demo/`, gitignored — no git history to
  restore from). Recovered via `aistudio.cdp.jsonl` (a root-level
  capture of the same prompt from the 2026-06-20 session) replayed
  through the real pluck → massage → place_meta → path_render
  pipeline by hand; verified restored (`chat.md` back to 439
  lines/15 turns). Lesson carried into the rest of the session's
  smoke tests: an external-tool stand-in must read from a path
  outside anything the code under test is about to write to.
