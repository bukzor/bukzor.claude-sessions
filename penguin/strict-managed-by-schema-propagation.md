---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills
session:
  uuid: []
  started: null
  ended: 2026-05-21T11:55-05:00
parent: skeleton-default.md
---
# Strict `managed-by` + Skeleton Schema Propagation

Done (2026-05-21) — see Addenda below. Spun out that day during the
wsjf-rank tool-gap cleanup,
after the user clarified that:

- `managed-by` is intended to be **fully jsonschema-controlled and
  required via a `const` definition**.
- `anthropic-skill-ownership` is deprecated and replaced by
  `managed-by`.

The `skeleton-default.md` session (2026-05-13 → 2026-05-15) installed
schema copies at each consuming skill's `.claude/` but shipped them as
**permissive** (no `managed-by` block, `additionalProperties: true`)
rather than strict-with-const. This planned session closes that gap
and migrates the remaining data files to match.

## Why the gap matters

Without `managed-by` required-via-const, schemas can't enforce the
"this file follows the `llm-subtask` todo-file convention" contract.
With `additionalProperties: true`, schemas can't catch typos or
deprecated field names. Both leave the validator unable to flag the
exact drift this work is meant to prevent.

## Scope

### 1. Skeleton schemas (canonical)

`llm-subtask/skeleton/.claude/{todo,ideas}.jsonschema.yaml` —
update to the strict shape:

- Add `status` property (oneOf: `open`/`done`/`template`) with a
  per-const description so the lifecycle states are
  self-documenting.
- Add `required-reading`, `suggested-reading`, `related-effort`
  property definitions (these fields are already in real files;
  3 occurrences each across llm-collab/llm-kb todo+ideas).
- `required: ["managed-by"]` (already present in skeleton).
- `additionalProperties: false` (currently `true`).
- todo and ideas schemas should be byte-identical to each other.

### 2. Downstream copies

`llm-subtask/.claude/ideas.jsonschema.yaml`,
`llm-kb/.claude/ideas.jsonschema.yaml`,
`llm-collab/.claude/todo.jsonschema.yaml` —
replace contents byte-identical to the skeleton. The `managed-by`
const value is **invariant**: `Skill(llm-subtask)` everywhere, since
llm-subtask owns the todo/ideas file-format convention regardless of
which skill hosts the files.

### 3. Data-file migration

Two classes of fix, 8 files total:

**A. `anthropic-skill-ownership: llm-subtask` → `managed-by: Skill(llm-subtask)`** (2 files):

- `llm-kb/.claude/ideas.kb/2026-04-17-000-design-process-for-new-kb-structures.md`
- `llm-kb/.claude/ideas.kb/2026-04-17-001-codify-tables-lists-smell-as-kb-promotion-heuristic.md`

**B. Add `managed-by: Skill(llm-subtask)` to files that have other
frontmatter but lack the field** (6 files):

- `llm-collab/.claude/todo.md`
- `llm-collab/.claude/todo.kb/2025-11-26-001-add-ideasd-pattern-to-llm-collab-docs-skill-with-helper-script.md`
- `llm-collab/.claude/todo.kb/2025-11-26-003-clarify-the-relationship-between-todomd-and-todod-in-subtask-skill.md`
- `llm-collab/.claude/todo.kb/2025-11-29-000-reevaluate-devlog-purpose-and-structure.md`
- `llm-collab/.claude/todo.kb/2025-11-29-001-document-blocking-pattern-in-subtask-skill.md`
- `llm-collab/.claude/todo.kb/2025-12-03-000-pivot-from-d-to-kb-naming-convention-for-llmd-skill.md`

(Empty-frontmatter files are not affected — the validator skips
files without frontmatter, so no `managed-by` is required there.)

### 4. Validation

`llm-kb/bin/llm.kb-validate llm-subtask llm-collab llm-kb` should
report 0 errors when the migration is complete.

### 5. Drift-surface note

Update the `Drift surface` section of
`llm-kb/.claude/todo.kb/2026-02-09-000-schema-reuse-with-ref.md`:

- Record that 5 schemas are now byte-identical (was: 2 hash families,
  skeleton-with-managed-by + skill-local-without).
- Pre-existing pressure for `$ref` work intensifies: any further field
  addition now requires 5 hand-edits instead of 5 different surgeries.

## Suggested execution order

1. Update skeleton schemas (1 commit per skeleton file or one for both).
2. Migrate 8 data files in one commit.
3. Propagate skeleton → 3 downstream copies in one commit.
4. Validate as the final step; if green, update the drift surface
   note in a separate commit.

Splitting commits this way lets a partial revert keep the most
valuable piece (schema improvement) while undoing the more invasive
piece (data migration) if needed.

## Related

- Parent: `~/.claude/sessions.kb/skeleton-default.md` (predecessor that
  installed the permissive copies).
- Related-effort: `~/.claude/sessions.kb/schema-reuse-with-ref.md`
  (planned $ref work that would obsolete the hand-propagation done
  here).
- Todo file: `bukzor-agent-skills/llm-kb/.claude/todo.kb/2026-02-09-000-schema-reuse-with-ref.md`
  ("Drift surface" section).
- Decision: `bukzor-agent-skills/llm-kb/.claude/decision.kb/agent-skill-uri-scheme.md`
  (the URI scheme for the eventual cross-skill $ref).

## Addenda

Dated pickup write-ups (2026-05-21) moved to
`strict-managed-by-schema-propagation.kb/` — one file per addendum,
`ls` for the full chronological list. Latest: the result — completed
in four commits on `main`, validation clean (81 files, 0 errors); one
follow-up remains open (`$ref` consolidation, tracked in
`schema-reuse-with-ref.md`).
