---
cwd: /home/bukzor/.claude
session:
  started: null
  ended: null
---
# Reconcile sessions.kb Schema Drift

`bin/llm.kb-validate ~/.claude/sessions.kb` reports 11 of 28 entries
failing against `~/.claude/sessions.jsonschema.yaml`. The schema and the
corpus have diverged: entries adopted fields and value shapes the schema
never blessed, and the schema's `additionalProperties: false` now rejects
them. This session decides, per category, whether the schema is behind
(extend it) or the entries are wrong (fix them), then makes the corpus
validate clean.

## Violation inventory (2026-05-27)

Schema-unknown fields (rejected by `additionalProperties: false`). These
look like deliberate conventions the schema never caught up to -- the
likely resolution is to bless them in the schema:

- `parent` -- link to the spawning session. (4 entries)
- `spawned` -- links to child sessions this one spun off. (2 entries)
- `prior-sessions` -- predecessor sessions in a chain. (3 entries)
- `cost-benefit-sweh` -- WSJF-style rating carried on the session itself.
  (2 entries) Note: this overlaps the todo/ideas rating schema; decide
  whether sessions are rated and, if so, reuse that definition.

Value-shape violations (likely fix the entries, maybe loosen the schema):

- `session.uuid: null` written explicitly on planned sessions. The schema
  makes `uuid` optional and type `string`, so an explicit null fails.
  Decide: omit `uuid` when absent, or allow null. (4 entries)
- `session.started` as a bare date (`2026-05-22`) rather than an
  `instant`. (1 entry)
- `session.ended` as `2026-05-21T11:55-05:00` -- a datetime lacking
  seconds, so not a valid `instant`. (1 entry)
- `move-skill-triggers-to-must-read-kb.md` omits the `session` block
  entirely, which the schema requires. (1 entry)

## The decision

Two directions, applied per-field:

1. Extend `sessions.jsonschema.yaml` to bless `parent`, `spawned`,
   `prior-sessions`, and (if sessions are rated) `cost-benefit-sweh`.
   These encode a real session-graph the user maintains.
2. Normalize the malformed values: drop or null-allow `uuid`, and
   re-emit `started`/`ended` as full RFC3339 instants. Add the missing
   `session` block to the one entry lacking it.

Done when `bin/llm.kb-validate ~/.claude/sessions.kb` is clean and the
schema documents whatever new fields it gained.

## Why a separate session

Touching the shared sessions schema affects every entry and the
session-start tooling that writes them. Distinct blast radius from the
migrations.kb work that surfaced it.
