---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.llm-postbox
session:
  uuid:
    - c80a6431-2ca1-41a9-82ee-b01b7f91a4dc
    - c269ada4-0acb-4d1d-898a-b366887d63a5
  started: 2026-08-28T10:24:49-05:00
  ended: null
---

# Postbox Implementation — Files, Not SendMessage

The 21-day usage-review session
(`~/claude/how-to-claude-code/findings/2026-08-28-usage-review.md`)
spawned a house convention for inter-session messaging: files as
messages, delivery by Read at task boundaries — replacing SendMessage
and the `claude agents` interface, both owner-vetoed. The design is
fully ruled (2026-08-28..29); nothing implemented.

The ledger now runs to 63 claims in 8 theories. 2026-08-31 added TRUST
(the design bounds accident, not intent — so a mechanism resting on
convention is admissible) and MARKING (the `<callout tag="@claude"/>`
privilege drop), with ENFORCEMENT nested under it for the wrapper that
writes the marker. Cold-agent re-entry stays
`docs/dev/claims.kb/design.md`; that pass's narrative and its vetoable
judgment calls are in
`docs/dev/devlog/2026-08-31-000-Marking-and-trust-theories-filed.md`.

- [ ] Implement the postbox convention. Sub-project (owner ruling
      2026-08-29): `~/repo/github.com/bukzor/prototype.llm-postbox/` —
      work queue in `.claude/todo.md`, cold-agent re-entry in
      `docs/dev/claims.kb/design.md` (the claim ledger is the design's
      single home).
- [ ] Rule on the agent-standing batch: 28 files under
      `grep -rl '^standing: agent' docs/dev/claims.kb/design.kb`, plus
      the calls listed in that devlog's "Judgment calls open to veto".
      The load-bearing one is whether TRUST and MARKING belong inside
      the postbox ledger at all — the chat render had them as POSTBOX's
      siblings, disk has them as its children, which inverts the
      support relation.
