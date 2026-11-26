---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills
session:
  uuid:
    - 59b55f01-a707-409f-9f4b-78bea5090043
    - cdc9b664-6121-4cf6-bdb4-2545c2f46953
  started: 2026-11-25T14:00:00-06:00
  ended: null
---
# Llm-Claims Quality Audits

A quality-assurance reference for claim ledgers (`llm-claims`,
`llm-claims-kb`, and `llm-design-kb`'s rungs), modeled on
`llm-kb/skill.kb/self-audit.{md,kb/}`: one audit per file, each a way a
ledger rots, the scan that catches it, and what a finding means, plus
an index and a before-commit trigger. Started 59b55f01 (2026-11-25):
the laws and four audits landed; open below is what remains.

## Prior art

- `llm-kb/skill.kb/self-audit.kb/`: 13 generic `.kb` audits, an index
  (`self-audit.md`), and `must-read.kb/before/marking-kb-work-done.md`.
- `llm-claims-kb/skill.kb/self-audit.kb/`: confinement, graph-health,
  stamp-freshness, standing-honesty. No index, no trigger.
- `llm-claims/claims.kb/design.claims.kb/good-smells.kb/`: smells of
  the notation itself, not of a ledger written in it.
- `subagent-handoffs` `HOMES` (ruled 97605ccb): one home per fact.

## Gaps, from my-own-shadertoy's 2026-11-23..25 sessions (59b55f01)

Each a failure that happened and no existing audit caught.

- [x] Level (lens, `llm-design-kb` `each-rung-says-only-what-its-question-asks`): a claim over-defined for its rung, in plain words that
      confinement cannot see (the mission listed what understanding
      is, and that names are looked up).
- [x] One home (`llm-kb` audit `one-home`, which also covers trim losses): a conclusion or its reasoning stated in two files (a
      filing rule written into four).
- [x] Ruling fidelity (`llm-claims-kb` audit, fleet `SCOPE_KEPT`): a body paraphrasing a ruling narrower or wider
      than its quote ("or some higher requirement" dropped).
- [ ] Grounding (law landed: `llm-design-kb` `REACH`; no scan yet): every requirement reaches a goal through `why:`;
      graph-health checks dangling arrows and cycles, not reach.
- [x] Trim orphans (folded into `llm-kb`'s `one-home` audit): a cut drops a fact with no other home (atomics,
      when `API_COVERAGE`'s feature list was trimmed).
- [x] Derivation (`llm-claims-kb` audit `corollaries`, fleet `DERIVED_RECORD`): a rule that follows from higher principles but is
      filed as if it stood alone, with no `why:` to its premises. Filed
      as a corollary citing them, it is fine: derivable is not the same
      as practically unneeded (bukzor, 59b55f01).

First receipt: run the set on my-own-shadertoy's `docs/dev/claims.kb/`.

## Is ledger QA documented and triggered? (59b55f01, 2026-11-25)

No. The same concern -- claim and kb quality -- is met six ways, each
shaped differently:

- prospective lenses, triggered: `llm-claims` `must-read.kb/before/`
  (writing, signing, changing a claim), `llm-design-kb`
  `skill.kb/principles.kb/` (one `when/` trigger), the fleet's
  `authorship.kb/` (from `~/.claude/must-read.kb`);
- retrospective audits: `llm-kb` (index, tiered sweep, before/after
  triggers -- the only complete one) and `llm-claims-kb` (audits only:
  no index, no trigger bank, no sweep; reached by `SKILL.md` mentions);
- a per-claim tripwire, `stale-when:`, that nothing evaluates;
- periodic passes, project-level only (my-own-shadertoy's
  `CONSOLIDATION`, its `BREADCRUMBS` witness);
- the smoothing passes of 59b55f01 (walk the graph top-down and
  bottom-up, adjusting nodes and edges until a pass changes nothing):
  persisted nowhere, so not reiterable.

## Status (59b55f01, 2026-11-25)

The pattern is ruled and filed in the fleet ledger,
`docs/dev/claims.kb/design.claims.kb/authorship.kb/` (`NO_WAIT`,
`PASS_AT_OCCASION`, `PASS_NAME`, `OCCASION_LADDER`, `SKILL_KB`, struck
`FLATTEN`, `REFERENCE_KB`, `LAYOUT`, `SMOOTHING`, `FROM_NOW_ON`). `llm-kb`'s
definition now counts "kb" as a type. The burn-down is
`.claude/todo.kb/2026-11-25-000-Quality-passes-for-claim-ledgers.md`, for a
fresh session with `/subagent-handoffs`; its mechanical wave is
`llm-kb/migrations.kb/2026-11-25-001-skill-kb-quality-passes-and-reference-kb.md`.

- [ ] Burn down the taskfile above. cdc9b664 (2026-11-25) coordinated it
      with `/subagent-handoffs`: all six waves are done and pushed. The
      receipt passed "fires untold". It dispositioned 5 of the 6 trespasses
      and missed `goals.kb`'s `milestone`. Open: the plan's Open Questions
      (bukzor's rulings), then Close (record the range, `git rm` the kb).
