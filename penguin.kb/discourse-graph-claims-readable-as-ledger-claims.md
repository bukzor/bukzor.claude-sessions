---
cwd: /home/bukzor/repo/github.com/bukzor/ideation.epistemics
session:
  started: null
  ended: null
parent: kb-dynamics-ledger-debt-harness.md
focus:
  - mission.md
  - claims.kb/warrant-by-field-presence.md
  - kb-dynamics/docs/dev/claims.kb/imported-terms.md
---
# Discourse-Graph Claims Readable as Ledger Claims

Planned. Pose the problem and the acceptance criteria; the way forward
is to be considered with the owner, not chosen here.

## Problem

The realm's root `claims.kb/` is a discourse graph
(`Skill(llm-discourse-graph)`: `status:`, `live:`, no `standing:`).
The ledger tools (`Skill(llm-claims-kb)`: grounding, flatten,
mentions, ownership) read only ledger claims (`label:`, `standing:`,
`why:`). A ledger that imports a word coined in the discourse graph
cannot go bare on it, because the fold meets a file with no standing
and stops. kb-dynamics carries three such imports signed `+` for that
reason alone (`IMPORTED_CERTIFIED`, `IMPORTED_STIPULATED`,
`IMPORTED_OBLIGATION`, resting on `warrant-by-field-presence.md`,
`two-base-statuses-not-four.md`, `obligation-is-derived-not-stored.md`),
and they head its grounding queue at forty-plus dependents each: the
top of that ledger's review is tooling debt, not a design question.

The realm's `mission.md` ranks the repo-weight rung second and calls it
the highest leverage available; `.claude/todo.md` item three is the
landing of {TL, RN} at repo weight. This is the piece of that landing
the ledger tools are blocked on.

## Acceptance criteria

- [ ] `llm-claims-kb-grounding kb-dynamics/docs/dev/claims.kb` shows the
      three imports as `bare` with an effective standing read from the
      outer claim, not as `agent` judges
- [ ] No discourse-graph node loses information: `status:`, `live:`,
      `superseded-by:` and the five node types survive whatever mapping
      is chosen, or the loss is ruled by the owner per field
- [ ] The mapping is stated once, in one of the two skills, and both
      tools' readers consult it; no per-ledger shim
- [ ] `kb-dynamics/docs/dev/claims.kb/imported-terms.md` no longer needs
      its paragraph on the three exceptions
- [ ] The realm's own `claims.kb/` still validates under
      `llm.kb-validate`

## Ways forward, for discussion only

Not chosen. Convert the discourse graph to a ledger (the migration
`acs-counterfactual.md` frames); teach `ledger.py` to read a
discourse-graph claim as a ledger claim at the boundary (a projection,
`status:` to `standing:`); or give the discourse graph a `standing:`
field alongside `status:` (the two-field reading the skill's own "What
this is not" section already draws). Each has a cost the owner should
weigh against `preservation-audit.md`.
