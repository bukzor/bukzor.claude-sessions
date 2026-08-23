# 2026-08-22: penguin.jsonschema.yaml regressed to a flat inferred schema, restored to the $ref stub

The 2026-08-13 ruling left `llm.kb-validate ~/.claude/sessions.kb` at 94
files, 0 errors. By today it was failing *every* entry with
`session: {...} is not of type 'string'` -- surfaced when a session-end
went to validate a new `penguin.kb/` entry.

Cause: commit `8188613 "add schema for penguin.kb collection"` (landed
after `55038e6` renamed `penguin/` -> `penguin.kb/`, which is what first
made the collection need a sibling `penguin.jsonschema.yaml` at all)
wrote that sibling as a **flat, auto-inferred** schema -- `type: object`,
`additionalProperties: false`, and `session: {type: string}` among
data-inferred `enum`s (`color: [pink, yellow]`, `parent:
[backlog-triage-with-cost-of-delay.md]`). Inferred from the corpus, it
got `session` wrong (it is a nested `{uuid, started, ended}` object in
the template and all entries) and so rejected all of them.

The prescribed form -- skill `llm-sessions` and this repo's own
`CLAUDE.md` ("copy `penguin.jsonschema.yaml`, which just `$ref`s the
shared schema") -- is a one-line stub:

    # yaml-language-server: $schema=https://json-schema.org/draft-07/schema
    $ref: "../sessions.jsonschema.yaml"

`../sessions.jsonschema.yaml` is `~/.claude/sessions.jsonschema.yaml`
(the home repo, one level above this submodule), itself a stub `$ref`ing
`skill://llm-sessions/jsonschema/sessions.jsonschema.yaml` -- the
canonical this ruling widened. Restored to that stub, the collection is
back to 0 errors (105 files, having grown from 94).

Guardrail: every host `X.jsonschema.yaml` here MUST stay a `$ref` stub.
Do not let a schema-inference/regeneration step emit a flat schema over
it -- that is exactly what broke all 105 entries once, silently, until
someone next validated.
