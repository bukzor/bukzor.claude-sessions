---
cwd: /home/bukzor/claude/binary-messaging
session:
  uuid:
    - fcf01cf5-ce51-4df5-8abb-90280a711835
  started: 2026-08-31T13:00:00-05:00
  ended: null
---
# Binary-Messaging — Compression Pilot & Delegation-Fidelity Follow-ups

Founded the repo from the idle curiosity "how close can an
LLM-intuitive message format get to xz -9?". Answered it (pilot
measured; ~1.5x tokens / ~2x bytes is the intuitive ceiling; xz+base64
is 3.4x *worse* than plaintext in tokens), drafted the
`compress-message` writer skill, and persisted everything as a design
ledger (`docs/dev/claims.kb/`). Orientation for pickup: repo
`CLAUDE.md`, then `.claude/todo.md`.

Open work (all awaiting user ruling — see the ledger's `standing: open`
claims):

- [ ] RESEARCH_PROGRAM: go/no-go on the delegation-fidelity program
      (harvest real briefs from `~/.claude/projects`, A/B receivers,
      diff actions; est. 2-3 sessions)
- [ ] NEXT_APPROACH: pick the pilot constraint to relax (agent ranks
      genre schemas first)
- [ ] PROMOTE_SKILL: graduate compress-message to `~/.claude/skills/`
- [ ] Repo has no git remote; decide whether/where to publish
