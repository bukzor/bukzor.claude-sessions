---
cwd: /home/bukzor/.claude
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 315152a8-93a9-4305-8bf4-3dad30e4b8f3
  started: 2026-08-13T12:34:44-05:00
  ended: null
---
# sessions.kb Frontmatter Has Drifted From Its Schema

`llm.kb-validate ~/.claude/sessions.kb` reports 14 errors across 93 files,
every one of them frontmatter the schema forbids rather than prose. The
schema sets `additionalProperties: false` at both levels, and writers have
been adding fields anyway: `cost-benefit-sweh` (8 entries), `prior-sessions`
(2), `parent` (2), `spawned` (1). Three more are shape errors --
`session.started` written as a bare date where the schema wants an instant
(2 entries), and one entry with no `session` block at all.

Each added field was presumably wanted by the session that added it, so the
work is a ruling per field, not a cleanup: adopt it into
`~/.claude/sessions.jsonschema.yaml` (with a type and a description), or
strike it from the entries that carry it. `cost-benefit-sweh` and
`prior-sessions` both look like adoptions -- they encode something the
template has no place for -- while `parent`/`spawned` overlap the existing
uuid list and may be redundant with it.

Worth doing because the count is load-bearing: an `llm.kb-validate` that is
permanently red teaches its reader to skip it, which is exactly the
ergonomics complaint that drove the 2026-08-13 validator work in
`claim-ledger-skill-and-epistemics-realm.md`. Under half an hour.
