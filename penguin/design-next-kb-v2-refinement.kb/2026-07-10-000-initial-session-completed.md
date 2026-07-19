Part of `../design-next-kb-v2-refinement.md`.

# 2026-07-10: initial session — ADR/devlog killed, kb-spec synthesis-file rename

- Killed ADR and devlog as artifact classes: a decision is a settled
  question (`design-next.kb/040-design.kb/decisions-are-settled-questions.md`),
  not a dated event; git owns "when did we decide."
- New goals: `designed-for-deletion` (domain-grouped units, not
  function-grouped — retirement is `git rm -r`) and `write-economy`
  (every durable write names its read-back), with the paired
  requirement `writes-name-their-read-back`.
- `kb-spec.md`: summary file renamed/reconceived as **synthesis
  file** (roll-up of a `$name.kb/`, relation specialized per
  domain — a question's synthesis is its answer, a task
  collection's is its live working set); spec's own elaboration
  seeded at `kb-spec.kb/` (self-application); Directives bullet
  added.
- `references-are-structured-data.md` filed as a `status: proposal`
  — a loose `references:` frontmatter map as `depends:`'s
  structured successor.
- Distilled two reusable principles mid-session:
  `llm-kb/SKILL.kb/self-audit.kb/bloat.md` gained a
  contrast-scaffolding ("X, not Y") check;
  `llm-design-kb/principles.kb/test-the-residue-not-the-bundle.md`
  is new (judge an artifact class by its unabsorbed residue, not
  its best-contents).
- Landed in commits `88118ef` and `5312635` (bukzor-agent-skills,
  pushed to origin/main — verify before assuming pushed if resuming
  cold).

