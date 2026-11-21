# Addendum 2026-08-08

The `date`/`instant` types grew a declared, fetchable dialect identity:
`skill://llm-kb/jsonschema/dialect.jsonschema.yaml` (bukzor-agent-skills
`3c7de8a`, superseding `489562b`'s strip approach). Schemas using the
extension types now declare that `$schema` (or none — absent defaults to
it); stock-dialect declarations are honored and report extension types
as schema bugs. The type checker and the naive-datetime rationale moved
from `frontmatter_validate.py` to `lib/python/llmd/_jsonschema_adapter.py`.
