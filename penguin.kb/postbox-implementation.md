---
cwd: /home/bukzor/claude/how-to-claude-code
session:
  uuid:
    - c80a6431-2ca1-41a9-82ee-b01b7f91a4dc
  started: 2026-08-28T10:24:49-05:00
  ended: null
---

# Postbox Implementation — Files, Not SendMessage

The 21-day usage-review session
(`~/claude/how-to-claude-code/findings/2026-08-28-usage-review.md`)
spawned a house convention for inter-session messaging: files as
messages, delivery by Read at task boundaries — replacing SendMessage
and the `claude agents` interface, both owner-vetoed. The design is
fully ruled (2026-08-28..29), nothing implemented.

- [ ] Implement the postbox convention. Sub-project (owner ruling
      2026-08-29): `~/repo/github.com/bukzor/prototype.llm-postbox/` —
      work queue in `.claude/todo.md`, cold-agent re-entry in
      `docs/dev/claims.kb/design.md` (the claim ledger is the design's
      single home).
