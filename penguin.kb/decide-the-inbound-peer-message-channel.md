---
cwd: /home/bukzor
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 315152a8-93a9-4305-8bf4-3dad30e4b8f3
    - 3ed32159-83e5-49e1-9da5-89236fbbfb4d
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
  outbound, which the agent already chooses -- and the same tool
  resumes subagents, so a blanket deny breaks delegation. Inbound has
  its own control (verified against the docs 2026-10-01, v2.1.287):
  `crossSessionInbound` = `accept` | `hold` | `refuse` in settings
  ([cross-session-messaging]). An explicit `hold` never expires and
  releases only when an `accept` applies; `refuse` drops. Unset, as
  in `~/.claude/settings.json` today, an auto-mode session delivers.

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

**2026-09-19**: the interim protocol now has its enforceable home --
`Skill(llm-collab)` reclaimed as the cross-session collaboration domain,
with `skill.kb/must-read.kb/after/receiving-a-peer-message.md` (ticket,
not conversation), `before/sending-a-peer-message.md` (pointer /
conflict / hand-off only), and `when/peer-sessions-work-overlapping-ground.md`
(the `sessions.kb/` entry is the digest; pull at checkpoints). ADR:
`bukzor-agent-skills/docs/dev/adr/2026-09-19-000-llm-collab-owns-peer-session-coordination.md`.

- [ ] `sessions.kb/CLAUDE.md` / `.template.md`: mention the peer-facing
      sections an entry carries (findings as signed claims, open questions,
      overlap suspects, wants).

**2026-09-22**: evidence from the dispatcher field test (session
`e234e82e`, analysis at L2860, never answered -- the session died in the
09-23 tmux crash). The four peers had already judged relevance: each
entry's "Offered back to X" / "Overlap with peers" section named its
addressee. The dispatcher only noticed X hadn't read it yet, at ~140
model turns and 4 unrewindable interrupts; the ratified postbox
(PULL_DELIVERY, POINTERS_ONLY, a silent-when-empty prompt hook) does the
same at ~8 turns and 0 interrupts, and a recipient reads only mail
addressed to it. Discovery stays with the sessions.kb "overlap suspects"
line or the owner; liveness was not load-bearing. Under the postbox,
pointer/conflict/hand-off all become inbox files, so `SendMessage`
shrinks to a wake phrase or goes -- which is this entry's question, now
with an answer to rule on. The other ruling it asked for lives in
`agent-harness-design.md`.

**2026-10-01** (session `3ed32159`): agent recommendation, unruled --
set `"crossSessionInbound": "hold"` in user settings now, and move to
`refuse` once peers have a pull channel. `hold` restores the operator
act the 08-13 failure lacked: a held message reaches the model only
when an `accept` applies, and the notices keep visible what would have
arrived -- evidence on whether liveness is ever load-bearing. Leave
`SendMessage` allowed: it also carries subagent resumes.

- [ ] Rule `hold` / `refuse` / `accept`, then set it in
      `~/.claude/settings.json` (owner's edit)
- [ ] `~/.claude/settings.json` lists `SendMessage`, `ListAgents`,
      `TaskStop` under `permissions.questionable`, not a documented
      Claude Code permission category; confirm whether it gates anything

[cross-session-messaging]: https://code.claude.com/docs/en/cross-session-messaging#control-inbound-messages
