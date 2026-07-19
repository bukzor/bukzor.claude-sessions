Part of `../strict-managed-by-schema-propagation.md`.

# 2026-05-21: field landscape

Frontmatter field counts across todo+ideas in llm-subtask, llm-collab,
llm-kb (from `awk` over all `.claude/{todo,ideas}{,.kb/*}.md`):

| Field | Count | Status |
|-------|-------|--------|
| `cost-benefit-sweh` | 14 | in schema |
| `managed-by` | 11 | in schema (const) |
| `suggested-reading` | 3 | needs schema definition |
| `status` | 3 | added by this session |
| `required-reading` | 3 | needs schema definition |
| `related-effort` | 3 | needs schema definition |
| `anthropic-skill-ownership` | 2 | deprecated → migrate |
