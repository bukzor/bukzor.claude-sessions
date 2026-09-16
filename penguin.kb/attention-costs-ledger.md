---
cwd: /home/bukzor
session:
  uuid:
    - aa519804-1454-4c53-a29d-ed29bdb3a27c
  started: 2026-09-16T09:33:00-05:00
  ended: null
focus:
  - .claude/docs/dev/claims.kb/attention-costs.md
---

# Attention Costs — Ledger and Tooling

Measured what Claude Code actually costs across this machine's whole
transcript corpus, worked out how an agent should estimate prospective
cost, and persisted the result as a claim ledger at
`~/.claude/docs/dev/claims.kb/` (`Skill(llm-claims-kb)`).

Read `attention-costs.md` first — it carries the poset, the three
load-bearing conclusions, and a "Making an estimate" recipe in three
tiers. Nothing about the findings is duplicated here.

## What landed

- `~/bin/claude-tokens{,-wire,-cost,-histogram,-params}` — transcripts
  and mitmproxy capture to a costed TSV, then the parameter tables.
  `claude-tokens-params` regenerates every constant the ledger asserts;
  each claim's `verify:` names its section.
- `claude_code_archeology.provenance` — authorship of user-role records
  (`Typed(author, text)`), since a `type: user` record is often the
  harness or another agent.
- 37 claims in 6 theories: 26 bare, 12 agent, 3 user, 1 open.
- Corrected `Skill(claude-code-archeology)` on `logicalParentUuid`.

## Open work

- [ ] **Rule on the 12 agent-signed claims.** These are vetoes —
      silence lets them stand. Scan:
      `grep -rl 'standing: agent' ~/.claude/docs/dev/claims.kb/`.
      The eight substantive ones are `QUOTE_THE_STRIP`,
      `MODES_ARE_REVIEW_RATE`, `OVERSUPERVISION`,
      `REVIEW_SCALES_WITH_ARTIFACT`, `REVERSIBILITY_GATES`,
      `ELICITATION_BLOCKS`, `HUMAN_ERROR_UNCATCHABLE`,
      `DEBT_DOMINATES`; the other four are the theory carve-up.
      `OVERSUPERVISION` is the one most worth contesting — it claims
      session check-ins run 4x more often than pays, and the model
      prices review as pure overhead when it is also where the operator
      steers.
- [ ] **Settle `HUMAN_MINUTES`** (the ledger's only open claim). Every
      threshold is a ratio against the operator's time and only the
      agent side is measured; transcripts cannot answer it.
      **Lead: the debt-estimation machinery may already exist** —
      `cost-benefit-sweh` frontmatter (`benefit-2w`, `cost-of-delay-2w`)
      on sessions.kb entries is exactly the debt side `DEBT_DOMINATES`
      says is the binding constraint. See
      `backlog-triage-with-cost-of-delay.md` and
      `~/claude/homedir-archeology/.claude/decision.kb/sweh-cost-of-delay-field.md`.
      Joining the two would ground the half of the comparison that is
      currently a guess.
- [ ] **Decide whether "attention" collides.** This ledger stipulates
      *attention* = tokens the model spends plus minutes the person
      spends. `personal-attention-system.md` already uses the word for
      the operator's focus across life domains. Plausibly one concept
      extended rather than two — but it was not checked with the owner,
      and the ontology entry is load-bearing.
- [ ] **Is `Skill(claude-code-archeology)` the right home for the
      "What it cost" section?** Added there because the tools parse
      `~/.claude/projects/`, but "what did this cost" is not an
      archeology trigger. Still draft-marked.
- [ ] Episode cost distribution (mean $1.87, median $0.95, top decile
      = 42% of spend) was measured but never made it into the ledger.
      Candidate claim: cost is right-skewed enough that the mean is not
      the typical exchange.
- [ ] `flow2jsonl.py` could emit `flow.id`, making wire request/response
      pairing exact instead of unpairable. One line; would let
      `claude-tokens-wire` read effort off the wire rather than joining
      it back from transcripts.

## Declined, with reason

- **Exact tokenization via the `count_tokens` endpoint.** Would replace
  the estimated 2.9 chars/token in `TYPED_AMPLIFICATION`. It is an
  outward send of the operator's own prompt text; permission was asked
  and never granted, so it was not done. Do not send without an
  explicit ruling — the conclusion is not sensitive to the conversion
  anyway.
