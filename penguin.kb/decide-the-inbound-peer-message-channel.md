---
cwd: /home/bukzor
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 315152a8-93a9-4305-8bf4-3dad30e4b8f3
  started: 2026-08-13T16:51:27-05:00
  ended: null
---
# Decide the Inbound Peer-Message Channel

Open operator decision: whether cross-session agent messaging stays
on. Raised 2026-08-13 after a three-message exchange with the
`bukzor-agent-skills-replication-run-72` session consumed roughly a
third of a context window. The operator's words: "uncontrollable", "i
don't have good ability to rewind it out of context", and the peer
context "leaks through in a way that's deeply unhelpful". All three
survive scrutiny.

The audit that produced the recommendation. What the channel bought
that day: a good notation proposal (`stale-when:`), the catch that the
peer's migration existed only in a sandbox worktree, and one label
rename. Against it: ~1500 words of outbound prose, three inbound
messages, a branch investigation, and three of five turns driven by
something the operator did not ask for. Two of the three benefits do
not survive: the proposal needed no live channel (a `todo.kb` entry
carries it, and the operator would have seen it first), and the catch
was the channel cleaning up a mess only the channel created -- no
comms, no orphaned branch to rescue.

The failure modes, stated precisely:

- **Unrewindable is structural.** Every other input to a context
  traces to an operator act -- their turns, tool results from calls
  they can deny, files read because they pointed somewhere. An inbound
  peer message is the only thing that writes to their context with no
  decision of theirs. There is no undo because there was no do.
- **The leak is priors, not tokens.** Turns spent reasoning about
  another project's experimental blind and stratification vocabulary
  become furniture that tints later answers, untraceably.
- **Denying `SendMessage` fixes the wrong half.** That governs
  outbound, which the agent already chooses. Whether *inbound*
  delivery can be disabled in this build is unknown and unverified --
  ask `claude-code-guide` before promising it.

Recommendation on the table, not yet ruled: kill inbound, keep the
repo as the bus. The peer and this session share a git remote and a
filesystem; every message sent could have been a commit, a `todo.kb`
entry, or a file -- all rewindable, inspectable by the operator before
the agent sees them, pulled rather than pushed, and durable past the
context. The only thing files lack is liveness, which was not
load-bearing: the peer held its migration for a day regardless.

Interim protocol adopted unilaterally this session, and **not
persisted anywhere enforceable** -- that gap is itself a follow-up:
treat an inbound peer message as a ticket, not a conversation. Read
it, verify any claim it makes about the repo against the repo, file
what is actionable, tell the operator in one line, do not reply in
prose. Applied retroactively to 2026-08-13 it removes roughly 80% of
the cost and still catches the sandbox-only migration, because that
catch came from reading `git log`, not from talking. If the channel
stays on, this protocol wants a home in `must-read.kb/when/` so it
binds future sessions rather than living in one transcript.
