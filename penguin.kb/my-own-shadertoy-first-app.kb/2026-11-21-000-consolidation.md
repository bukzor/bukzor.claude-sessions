# Findings (consolidation session 6307adfb, 2026-11-21)

- The first `CONSOLIDATION` session: history reread, THIRD_USE (none due),
  job statements, docs made true, tripwires, breadcrumb witness (passed),
  and a revision-scarring sweep (none found). Commits through 3c65d61,
  pushed.
- The milestone ladder is a collection: roll-up `milestone-ladder.md`,
  one file per milestone in `milestone-ladder.kb/`, and a schema whose
  `first-uses: [{use, evidence: [path:func]}]` records what bukzor
  confirmed at landing. 0.1 carries 17.
- FIRST_INSTANCE accepted. Its bar is "relevant and learning", not "is
  WebGPU" (`window.isSecureContext` counts). Its check is bukzor's
  confirmation of `first-uses:` at landing. The `Co-Authored-By` trailer
  can't be the check: it marks "not bukzor's sole work", and bukzor's
  commits often carry a little of Claude's help.
- CLAUDE_RELUCTANT and every group's `CLAUDE.md` now decline first uses
  in any group, throwaway ones included.
- UNDERSTANDING_HAS_A_HOME replaces the planned `webgpu.kb`: each recall
  item names a durable artifact, and an item with none is the occasion
  to write one. ERROR_HANDLING certified by bukzor (f80d2d0).
- Process rulings: subagent-handoffs only when the unit saves net parent
  context. md-frontmatter-set is for scripts; agents edit frontmatter
  directly when that's cheaper.
- Declined for later by bukzor: the four recall items, and two upstream
  notes for bukzor-agent-skills (llm-kb validates a roll-up against its
  parent's schema, contrary to `frontmatter-outside-a-collection.md`;
  subagent-handoffs' Pitfalls contradict the net-savings rule).
