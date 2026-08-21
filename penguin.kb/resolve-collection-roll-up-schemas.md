---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 98f2be37-22fa-46b2-9fa4-b6ffc757274d
  started: 2026-08-21T16:01:20-05:00
  ended: null
---
# Resolve Collection Roll-Up Schemas

`llm.kb-validate` now takes `X.md` with `X.kb/` (a collection is both),
so thirteen roll-ups report `No schema found` and the live tree reads
`540 files, 13 errors`. Every one is true; none is resolved. This
session works each against the three ways out in
`llm-kb/references/frontmatter-outside-a-collection.md` -- push the file
down into a collection, rename the parent to `X.kb/`, or remove the
frontmatter -- **per file**, which the session that surfaced them did not
do. It instead asserted, three times and without checking, that the
three run out at a synthesis file. Treat that assertion as unsupported,
not as a finding.

Facts to start from, so the check does not begin from scratch:

- six are `.claude/todo.md` (`managed-by`, mostly `cost-benefit-sweh`);
  three are a skill's own `design.claims.md` and two more are
  `docs/dev/*.claims.md`
  (`label`/`standing`/`ontology`/`stale-when`/`last-updated`);
  `docs/dev/strata.replication.md`,
  `incident-forensics/skeleton/root-cause.md`, and
  `llm-kb/complete-example/decorations.md` carry `last-updated` alone.
- renaming the parent is available for `docs/dev/`, `skeleton/`, and
  `complete-example/`, and not for `.claude/` or a skill root -- Claude
  Code fixes both by name.
- eleven of the fourteen already satisfy the schema beside them; the
  three that don't are `strata.replication.md` and `decorations.md`
  (`last-updated` forbidden) and `root-cause.md` (`status` required).
  That is data about the files, not an argument for pairing them.

Open work:

- [ ] Work all thirteen against the three resolutions, one file at a time
- [ ] Settle `llm-kb/complete-example/` against itself:
      `food.jsonschema.yaml` documents `last-updated` as "Required for
      summary files", `decorations.jsonschema.yaml` forbids it, and
      `decorations.md` carries it. The file the fleet learns the pattern
      from should not teach both ways
- [ ] Decide whether `Skill(llm-claims-kb)` should assert that a ledger
      root is a claim, rather than llm-kb's lookup inferring it from the
      shared name -- already filed as
      `llm-kb/.claude/todo.kb/2026-08-18-000` (dispatch specialized-kb
      checkers); the five `*.claims.md` here are its motivation

Details and per-file counts:
`/home/bukzor/repo/github.com/bukzor/bukzor-agent-skills/.claude/todo.md`
Reasoning:
`/home/bukzor/repo/github.com/bukzor/bukzor-agent-skills/docs/dev/devlog/2026-08-21-001-A-checkmark-for-a-file-nobody-checked.md`
