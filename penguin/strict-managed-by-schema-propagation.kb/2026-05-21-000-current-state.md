Part of `../strict-managed-by-schema-propagation.md`.

# 2026-05-21: current state

Partial work-in-progress in the bukzor-agent-skills working tree
(uncommitted):

- `llm-subtask/skeleton/.claude/todo.jsonschema.yaml`: status block
  added, `additionalProperties: false` set. Missing required-reading
  / suggested-reading / related-effort additions.
- `llm-subtask/skeleton/.claude/ideas.jsonschema.yaml`: same.

These edits are a subset of step 1 and can be discarded or built
upon. The schemas they produce are coherent in isolation (the
skeleton's example files have only `managed-by` + `status`, so they
validate under `additionalProperties: false`), but they don't
acknowledge the cross-skill fields that real downstream files use.
