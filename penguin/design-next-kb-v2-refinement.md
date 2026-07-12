---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills
session:
  started: 2026-07-10
  ended: null
---
# design-next.kb v2 refinement (2026-07-10)

Multi-session collaborative redesign of the skill ecosystem
(`llm-kb`, `llm-collab`, `llm-must-read-kb`, `llm-subtask`,
`llm-design-kb`) into a leaner v2. First derived the underlying
purpose from first principles (many-whys), independently converged
with a prior "v2.0" session already captured in
`design-next.kb/`, then spent this session (nicknamed "v2.1"/"v2.2"
in conversation) reconciling and sharpening it against v2.0.

## Completed

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

## Live Follow-Ups

All tracked in-repo (`bukzor-agent-skills/.claude/todo.md` +
`.claude/todo.kb/2026-07-11-000-settle-task-grain-and-store-count-for-design-next.md`):

- Rework function-grouped design-next entries (`five-layer-stack`,
  `kb-engine`, `plugin-delivery`) against `designed-for-deletion`.
- Land the "kb class" rename (confirmed) across `genre-*.md` →
  `class-*.md` and wording.
- Rename "summary" → "synthesis" everywhere outside `kb-spec.md`.
- Discuss `references-are-structured-data.md` (still a proposal).
- Session-log residue test — decides whether any session-narrative
  class survives in v2 at all.
- `llm-design-kb/principles.kb` charter has outgrown "design.kb
  authoring" scope; widen or rehome (rated tier-4 by user).
- Task-domain redesign (grain/horizon/scope) — the strategic
  todo.kb entry above.
- **Resolved:** the v1 task-rating system (`wsjf-rank` /
  `task-list.wsjf.toon` in the separate `task-archeology` repo) is a
  real consumer, not landfill — operator confirmed it drove a real
  decision. Reframed per operator correction: treat it as a *case
  study* for "extensions must be supportable," not as a primary use
  case dictating task-genre schema — don't canonize `sweh`'s fields.
  Sharper open question left for the T3 session: does "supportable"
  mean the core engine eventually grows `kb query`
  (`structured-query.md`), or does the core stay minimal forever and
  ranking-shaped needs stay externally-built, as task-archeology
  already demonstrates works?

## Delete When

design-next.kb reaches `status: accepted` across the layers touched
here and the v1 skills are actually being rebuilt against it (or the
whole effort is abandoned) — i.e. when the todo.md lines above are
either done or superseded by build-phase tracking.
