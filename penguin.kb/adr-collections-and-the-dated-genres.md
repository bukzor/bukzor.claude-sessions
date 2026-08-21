---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 98f2be37-22fa-46b2-9fa4-b6ffc757274d
  started: 2026-08-21T16:01:20-05:00
  ended: null
---
# ADR Collections and the Dated Genres

`llm-discourse-graph` is the only skill in the fleet whose dated docs
carry frontmatter: nine ADRs with `date`/`status` (two also
`supersedes`/`superseded-by`), and one devlog of four with a bare
`date`. Every other skill's `adr/` and `devlog/` are prose-only.

That is a homogeneous collection wearing a plain directory, so the fix
is `git mv adr adr.kb` plus `adr.jsonschema.yaml` -- resolution two in
`llm-kb/references/frontmatter-outside-a-collection.md`. No change to
the walk is needed; it already descends into `.kb/`. The lone devlog
`date:` is likely vestigial and just goes.

The reason this is its own session rather than a quick fix: making
`adr.kb/` here proposes a fleet convention for a dated genre, and the
repo currently rules the opposite way -- `docs/dev/devlog/` and
`docs/dev/adr/` are named as *the* dated genres in the top-level
`CLAUDE.md`, and neither is a `.kb/`. Decide whether ADRs are a
collection everywhere or nowhere before renaming one skill's.

Open work:

- [ ] Decide: are `adr/` and `devlog/` collections fleet-wide, one
      skill at a time, or neither?
- [ ] If collections: `adr.jsonschema.yaml` needs a `status` enum, and
      `supersedes`/`superseded-by` want the path treatment
      `llm-vitals` just got (commit `08a2c93`, why-slugs to paths)
- [ ] If not: drop the frontmatter from llm-discourse-graph's nine ADRs
      and one devlog, matching every other skill
