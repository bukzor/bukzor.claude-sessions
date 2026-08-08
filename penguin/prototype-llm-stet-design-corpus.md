---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.llm-stet
session:
  uuid: # chronological; append your uuid when picking this entry up
    - f4ba9d52-ef8d-4ec5-a7f3-1eb03b18f401
  started: 2026-08-08T09:00:00-05:00
  ended: null
---
# llm-stet — Design Corpus Serialized, Build Path Open

Serialized the "Building a reasoning audit system" conversation's claim
ledger into `docs/dev/design.kb/` (15 theories, claim-ledger format,
llm-design-kb layer ontology), audited it against the transcript, and
ruled claim texts down to final-state belief only. The corpus is the
project's own tracking system — open design questions live there as `?`
claims, not in todo files.

Deliberate protocol: no devlog, no todo scaffolding in the repo. The
corpus's RETURN-EXPERIMENT claim makes the first cold return a natural
experiment on resumption — re-enter through the root CLAUDE.md and the
corpus alone.

- [ ] RETURN-EXPERIMENT: on first amnesiac return, record the felt
      re-entry gaps — that list is the RESUME-OP spec
      (`docs/dev/design.kb/060-deliverables.md`)
- [ ] Build DOGFOOD-PATH: CAP-STORE then CAP-SERVE-MCP, ≈2 days
      (`docs/dev/design.kb/050-components.md`, `060-deliverables.md`)
- [ ] User to rule NAME-RULING?: llm- prefix durable or
      prototype-scoped (`docs/dev/design.kb/meta.md`)
