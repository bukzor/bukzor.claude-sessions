---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.llm-postbox
session:
  uuid:
    - c80a6431-2ca1-41a9-82ee-b01b7f91a4dc
    - c269ada4-0acb-4d1d-898a-b366887d63a5
    - 270dd94f-9d44-43b6-a0ac-ac57719ab44f
  started: 2026-08-28T10:24:49-05:00
  ended: null
---

# Agent-Harness Design — Postbox as First Component

The 21-day usage-review session
(`~/claude/how-to-claude-code/findings/2026-08-28-usage-review.md`)
spawned a house convention for inter-session messaging: files as
messages, delivery by Read at task boundaries. On 2026-09-03 that
postbox design was folded into a fresh design ledger for the wider
mechanism, one agent creating, constraining, observing, conversing
with, and judging others; the postbox is its components rung. The
repo still carries the postbox name and awaits the owner's rename;
`~/claude/agent-harness` is a symlink to it (2026-09-07). Nothing is
implemented.

The ledger runs to 151 claims over seven rungs plus an experience
theory. Cold-agent re-entry is `docs/dev/claims.kb/design.md`; the
work queue is `.claude/todo.md`; the passes' narratives and vetoable
judgment calls are the devlogs of 2026-08-31, 09-03, and 09-04. The
SendMessage veto was re-read on 2026-09-03 as a prior on fixes, not a
refusal to revisit; "can SendMessage be the channel?" is open as
CHANNEL_PICK, leaning to files for vcs/audit/control.

- [ ] Rename the repo for the mechanism rather than the component;
      owner picks the name, then re-point the symlink (todo.md).
- [ ] Rule on the agent-standing batch, 61 files under
      `grep -rl '^standing: agent' docs/dev/claims.kb/`; the per-pass
      lists are in todo.md's veto item and each devlog's judgment
      calls. The TRUST/MARKING placement question closed with the fold:
      trust sits under goals, marking under the postbox component.
- [ ] Settle CHANNEL_PICK: run REWIND and UNINTERRUPTED against both
      the postbox and SendMessage, then rule (todo.md).
- [ ] Implement the postbox convention once the architecture question
      closes; work queue in `.claude/todo.md`.
