Part of `../design-next-kb-v2-refinement.md`.

# 2026-07-12: T2 session, v2.2 direction settled

- **Baselined the tower**: most of design-next.kb had never been
  committed (index-only since v2.0) — now committed as `757b46b`,
  with llm-design-kb principles (`7c0c1d1`) and an unrelated llm-kb
  prototype (`bd4ce5a`).
- **v2.2 direction settled** (operator: v2.0 was "largely an
  overcorrection"): kb system = four kinds — spec, engine
  (class-blind), class (the deletion/adoption unit), data. Class
  packages carry conventions/schema/templates/triggers/checks,
  reaching core only as runtime data. Invariant: nothing below a
  class names the class. Layer numbers dropped entirely. Delivery
  machinery leaves kb core — boundary settled; packaging (peer
  standard vs in-suite package) deferred to T4 after one walk-back
  (trigger banks *are* kb collections, so full mutual ignorance would
  force a restated collection spec; one-way triggers→kb-spec citation
  is the clean shape).
- **040 blast radius fully classified** (incl. two entries the
  original T2 scope missed: memory-policy is runtime-coupled — a
  defect even under v2.0's own coupling rule — and
  cross-reference-notation carries layer vocabulary).
- **T2 execution pipeline encoded** in-repo: brief at
  `.claude/todo.kb/2026-07-12-000-Land-v2-2-core-and-classes-rework--T2-.md`;
  todo.md is ordered so an in-order agent runs haiku rename sweep →
  fable drafts → fresh-context adversarial review (three named
  targets) → land. Review-before-land is deliberate: this session's
  two big moves were each ratified within a single turn.

