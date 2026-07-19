Part of `../apply-migrations-kb-backlog.md`.

# 2026-05-27: done this session

- strict-schema-propagation advanced to `verified` (propagated the
  missing schemas, gated the validator's MISSING false-positive, added
  `closeout:` to the todo schema and re-propagated byte-equal).
- ownership->managed-by: cleared the legacy tag from the one in-scope
  file the new schema surfaced; added `managed-by` to a second.
- Authored `migrations.jsonschema.yaml`; the whole collection validates.
- Added the "Working the backlog" guide to migrations.kb/CLAUDE.md.
- Spun the sessions.kb schema drift into its own entry,
  `~/.claude/sessions.kb/reconcile-sessions-kb-schema-drift.md`.
- Authored migration `2026-05-27-000-skill-notation-to-agent-skill-uri`
  (planning): sweep `Skill(xxyy)` -> `agent-skill://xxyy`. Created the
  canonical ADR `2026-05-18-000-agent-skill-uri-scheme` and deduped the
  scheme decision out of the `schema-reuse-with-ref` todo (removed a live
  contradiction: the todo still said `Skill()` "stays as-is"). Committed
  these three as one unit.

The agent-skill:// unit is committed. The rest of the tree (earlier
schema-propagation work + unrelated in-flight debolding) remains
uncommitted and intermixed.
