---
cwd: /home/bukzor/claude/mitmproxy
session:
  uuid: # chronological; append your uuid when picking this entry up
    - d9c01051-1ea5-4762-b3c7-2b4465ba068d
  started: 2026-08-21T11:30:00-05:00
  ended: null
---
# llm-subtask's ideas.jsonschema.yaml `$ref` points nowhere

Every project's `.claude/ideas.jsonschema.yaml` (per `llm-subtask`'s own
"No schema found" guidance, copied from its skeleton) contains:

```yaml
$ref: "skill://llm-subtask/jsonschema/ideas.jsonschema.yaml"
```

`find ~/.claude/skills/llm-subtask -iname '*ideas*'` turns up nothing —
the referenced schema file does not exist anywhere in that skill. This
makes `llm.kb-validate` fail on any `ideas.kb/` entry with a `status:`
field (e.g. mitmproxy's `.claude/ideas.kb/2026-08-20-000-Audit-heading-anchored-match-md-templates-for-self-referential-collision-risk.md`,
`status: Exploring`), even though the content is correct per the skill's
own documented lifecycle (`Exploring` → `Promoted`/`Rejected`).

Fix belongs in the shared `llm-subtask` skill: either add the missing
`jsonschema/ideas.jsonschema.yaml` (defining the `Exploring`/`Promoted`/
`Rejected` enum the skill's SKILL.md already documents) or correct the
`$ref` skeleton to point at wherever that schema is actually meant to
live. Out of scope for the mitmproxy session that surfaced it — this repo
doesn't own the skill.

Delete this file once the skill's schema is fixed (or the skeleton `$ref`
is corrected) and downstream projects re-validate clean.
