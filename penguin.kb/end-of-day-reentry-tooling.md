---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-tools/packages/claude-code-archeology
session:
  uuid: # chronological; append your uuid when picking this entry up
    - f65fbdf3-2597-44a8-b099-ee0e9d546ed2
  started: 2026-09-10T12:35:48-05:00
  ended: null
---
# End-of-Day Re-entry Tooling

Session f65fbdf3 (2026-09-10) reconstructed a day of twelve parallel
sessions from `~/.claude/projects` to answer "what got done, what is
open, what do I actually want next" -- the owner had lost the thread
after a day diffused into infra work. The reconstruction needed no full
transcript reads and no subagents; everything came from indexes, tails,
and version control. What it needed and had to build ad hoc is the
tooling gap this entry tracks. The task's shape: reconstruct intent per
thread (first prompt), outcome from ground truth (commits across repos),
residue per thread (last exchanges, session-log entries), and the gap
between intent and outcome; then rank residue against goals only the
owner can state. Nothing here is built; the ad hoc versions live only
in that session's transcript.

- [ ] `claude-inventory` is mtime-based, so closing an old session with
      `i/exit` makes it look like today's work (30 listed, 12 real on
      2026-09-10). holistics' `members.py` already reads recency from
      the last record; inventory should do the same
- [ ] A session index by real time: span, cwd, user-turn count, first
      user prompt (intent), last exchange (handoff state), records
      since a cutoff. Neither the first prompt nor the closing assistant
      message is exposed by any tool, and both were decisive
- [ ] A cross-repo commit sweep since a timestamp, with dirty-file
      counts per repo: the ground truth for "done"
- [ ] A last-N-exchanges view of one session (the `claude-jsonl-peek`
      gap already in `~/.claude/todo.md`)
- [ ] Session-family grouping: two sessions with an identical first
      prompt (a fork or retry, e.g. e682fa8e and 10dfad2d) are one
      thread and should be shown as one
- [ ] Timezone: transcripts store UTC, inventory prints local, the
      ad hoc index mixed them; one tool should normalize
- [ ] `bukzor-homedir-archeology survey --days N` is dominated by
      `~/tmp/.../node-compile-cache`; add it to the prune list
