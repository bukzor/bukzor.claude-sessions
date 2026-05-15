---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills/llm-kb
session:
  started: null
  ended: null
---
# Schema reuse with `$ref`

Distinct line of work surfaced during the skeleton-default session.
Full plan and rationale in
`.claude/todo.kb/2026-02-09-000-schema-reuse-with-ref.md`, with the
live drift surface enumerated at the bottom of that file.

## Current pressure

Five copies of the canonical idea/todo schemas now exist across
`llm-{kb,subtask,collab}` and `~/.claude/`. They were hand-installed
from `llm-subtask/skeleton/.claude/` per SKELETON-DEFAULT. Drift risk
is real and grows monotonically with edits.

## Likely shortcut

The validator already wraps `jsonschema.Draft202012Validator` (recently
extended for `date`/`instant` types). That library natively supports
`$ref` resolution through its `referencing` registry — the todo's
"add `$ref` resolution" step may be considerably smaller than written.
Investigate library defaults before implementing custom resolution.

## Tests are downstream

`llm-kb/tests/` are manual scenarios (movie-tracker), not automated.
Schema-reuse work can land without breaking those, but adding a
unit-test directory for the validator would be a defensible scope
extension while inside this code.
