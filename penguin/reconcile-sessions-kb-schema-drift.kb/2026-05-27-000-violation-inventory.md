# 2026-05-27: violation inventory

`bin/llm.kb-validate ~/.claude/sessions.kb` reports 11 of 28 entries
failing against `~/.claude/sessions.jsonschema.yaml`. The schema and the
corpus have diverged: entries adopted fields and value shapes the schema
never blessed, and the schema's `additionalProperties: false` now rejects
them.

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
