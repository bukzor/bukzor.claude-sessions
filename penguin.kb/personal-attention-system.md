---
cwd: /home/bukzor/claude/homedir-archeology
session:
  uuid:
    - cee48983-97b5-4479-86e8-085b12ba3d48
  started: 2026-05-22
  ended: null
cost-benefit-sweh:
  timebox:
    '@value': 6
    rationale: record the 3 unrecorded designs (~2h) + start the implementation ladder; stop and reassess after recording
    confidence: tentative
  benefit-2w:
    '@value': 1
    rationale: attention system targets the whole portfolio; near-term realizable value is the recorded designs
    confidence: hypothetical
  cost-of-delay-2w:
    '@value': 0.5
    rationale: 3 settled designs exist only in a 5-week-old transcript; recall decays
    confidence: tentative
---

# Personal Attention System — Design Conversation

Multi-day design session for a one-person-operator attention system
across wellness, family, revenue, customers, ops, deep tech, and
exploration. Originated from reviewing
`homedir-archeology/planning.kb/2026-05-22.md`.

Principal recorded artifact: **`bukzor-agent-skills/llm-vitals/design.kb/`**.
Read that for the design itself; nothing about the design is
duplicated here.

## Unrecorded conceptual designs

Settled in conversation but no permanent home yet. Each concerns
*items* in the user's existing task system, not vitals (categories).

- [ ] **Fallow item state + wake-condition taxonomy** (Active /
      Fallow / Closed; wake conditions; asymmetric review cadence).
      Likely home: extension of `llm-subtask`.
- [ ] **Closed resolution metadata** (`done | wontdo | superseded |
      moot | duplicate | split`). Same likely home.
- [ ] **"Culling is the prioritization" principle**. Premise
      underlying the architecture. Likely home:
      `homedir-archeology/.claude/principle.kb/` or with the fallow
      design.

## Open items currently in design.kb

Four entries are marked `status: proposal, blocked-on: discussion`,
each with an "Open questions" section. Enumerate them with:

```
grep -rl "^status: proposal" bukzor-agent-skills/llm-vitals/design.kb/
```

## Resume-from — implementation of llm-vitals

- [ ] Start journaling four wellness vitals weekly (no code; tests
      whether the operator will do the reporting)
- [ ] Record the unrecorded conceptual designs above
- [ ] Write `SKILL.md` + implement `claude-pick`, `claude-log`,
      `config.schema.yaml`, `day-log.jsonl` schema
- [ ] Hook into `/session-start` and `/session-end` skills
- [ ] Create wellness data dirs in `private.evan-family/vitals/`
- [ ] Create business data dirs in `private.bukzor-llc/vitals/`
- [ ] Backfill `vital:` frontmatter on existing tasks (multi-repo)

## Conversation thread

Long-form reasoning lives in the transcript. The design.kb entries
capture outcomes; the transcript is authoritative for *reasoning*
not recorded there.
