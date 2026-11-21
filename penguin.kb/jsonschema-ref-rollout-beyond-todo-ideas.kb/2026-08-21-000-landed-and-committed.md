# Landed and committed (session 531674aa)

## The finding

Not a design problem -- an unfinished rollout. The seven clusters are the
exact complement of the 2026-07-07 sweep's hardcoded two-category scope.

## Landed


- **A** (`2026-08-21-000`, `complete`): copies-to-stubs generalized to
  nine categories via `categories.tsv`. 18 files stubbed across 7
  projects; 69 OK / 2 ALIAS / 1 EXTENDER / 9 CANON-OK / 14 DIVERGED.
  Six canonicals had a closed root with no `#base` and were converted to
  the two-entry-point form (the entry predicted one). All 14 DIVERGED
  judged 2026-08-21: 11 stale -> stubbed, 1 -> `#base` extender, 2
  genuinely rival -> standalone with the reason written into the file.
- **B** (`2026-08-21-001`, `complete`): six incident-forensics schemas out
  of `skeleton/` into `jsonschema/`, three sites stubbed.
- **C** (`2026-08-21-002`, `complete`): 271 of 271 `why:` refs rewritten
  from slugs to paths across 175 files in 8 towers; layer schemas bound to
  the new canonical. Idempotency demonstrated by md5 diff, not asserted.
  The last 3 were ambiguous by prose and settled by distribution: 13 of 13
  sibling refs in that layer target `030-requirements.kb/` and none
  targets a 040 sibling.
- **Cluster 6**: new `llm-sessions` skill; `~/.claude/sessions.jsonschema.yaml`
  is now a stub onto it.
- **D** (`2026-08-21-003`, `complete`): 30 schema *symlinks* to `$ref`
  stubs across 7 repos. An eighth cluster the census missed outright --
  it swept for copies, and a symlink is not a copy. Five were already
  dangling at `llm-discourse-graph/schemas/` (renamed to `jsonschema/`
  with nothing to report it).
- **Canonical**: `llm-design-kb/jsonschema/layer-entry.jsonschema.yaml`,
  designed by a frontier agent, ratified with one amendment (`minItems: 1`
  struck, `default: []` added -- a schema must not reject its own default).

## Committed

All lanes committed and pushed, one commit per lane per repo, all via
path-scoped `git commit-files`. Granularity settled as per-migration-entry.

- `1cd1c4c` layer-entry canonical + its decision entry
- `2709afe` six canonicals converted to two-entry-point form
- `06bf19d` migration A entry, scripts, parent todo
- `048cbba` incident-forensics rename pairs + migration B entry
- `db10642` the `llm-sessions` skill
- `3bf96a1` the sub-kb journal entries + repo-scope sessions todo
- `5afbe10` the `cli.py` find-dispatch fix, in `2026-05-19--task-archeology`
- `42d4cd1`, `08a2c93`, `bdd18c8` migration C: entry, scripts, 15 towers
- `d80b1c9` migration D entry + the eighth-cluster row
- `d7cf317` `4c25192` `104f9c2` `1b9d191` `8d7d86e` `8097f53` `f30bf2a`
  migration D, one per repo
- plus ~14 single-repo commits in the consuming projects

Two repos hold committed work that cannot be pushed for want of a
configured remote: `~/claude/meta-reasoning` (2 stubs) and
`~/claude/crostini-health` (6 stubs, backed by a localhost store). Neither
is a failure of the migration; both are worth a look.
