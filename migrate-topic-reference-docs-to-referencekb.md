---
cwd: /home/bukzor/.claude
session:
  uuid: 8959e66c-8206-4ad4-b864-732377decdfc
  started: 2026-06-03T10:42:07-05:00
  ended: null
---
# Migrate Topic-Reference Docs to reference.kb

Continuing the `must-read.kb` → `reference.kb` split: triggers stay as thin
`before/when/after` docs; authoritative topic knowledge moves to `reference.kb`
and is pulled in via `requires:`. Tier A (clear movers + splits) is done and
committed (d24a3b1). Remaining: Tier B partial extractions
(`making-code-changes.md`, `claude-code-development.md`) and Tier C borderline
decisions (lean leave). An in-flight bash-conventions split is still untracked.

Brief: .claude/todo.kb/2026-06-03-000-migrate-topic-reference-docs-from-must-readkb-to-referencekb.md
