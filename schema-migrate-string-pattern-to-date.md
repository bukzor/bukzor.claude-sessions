---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills/llm-kb
session:
  started: null
  ended: null
---
# Migrate date schemas to the new `date` / `instant` types

Commit 5d64413 added `type: date` and `type: instant` to KbValidator.
Existing `type: string` + pattern workarounds for date fields can now
be tightened.

## Files

- [ ] `SKILL.jsonschema.yaml` -- `last-updated` (currently `type: string`
  + pattern `^\d{4}-\d{2}-\d{2}$`). `SKILL.kb/self-audit.md` is the one
  corpus file using this schema today (quoted `"2026-05-13"` -- needs
  unquoting alongside the schema change).
  `complete-example/food.jsonschema.yaml`'s `last-updated` is already
  `type: date` (done previously, untracked here); that's the model to
  copy.
  Note (2026-07-09): `bin/llm.kb-validate` only walks files inside
  `.kb/` directories -- top-level `$CATEGORY.md` summary files (e.g.
  `complete-example/decorations.md`) aren't checked at all regardless
  of this migration. Separate gap, not this follow-up's scope.
- [x] `docs/dev/case-studies.jsonschema.yaml` -- `date` (same pattern)
  migrated to `type: date`; both corpus entries unquoted to match
  (2026-07-09, commit pending in bukzor-agent-skills/llm-kb)

## Caveat

Quoted-string entries in the corpus (e.g., `last-updated: "2026-05-13"`)
will fail under `type: date` -- YAML parses them as strings, not dates.
Either:

1. Unquote the corpus entries first, then tighten the schema, or
2. Use `type: [date, string]` + pattern as a transitional compromise.

Option 2 keeps the corpus working but defers full migration; it is the
lower-risk path if there is no immediate need to enforce the type.

## Reference

`lib/python/llmd/frontmatter_validate.py` (KbValidator definition,
including the rationale for rejecting naive datetime).
