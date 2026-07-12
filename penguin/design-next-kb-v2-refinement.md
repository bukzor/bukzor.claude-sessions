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

## Completed 2026-07-12 (T2 session, "v2.2")

- **Baselined the tower**: most of design-next.kb had never been
  committed (index-only since v2.0) — now committed as `757b46b`,
  with llm-design-kb principles (`7c0c1d1`) and an unrelated llm-kb
  prototype (`bd4ce5a`).
- **v2.2 direction settled** (operator: v2.0 was "largely an
  overcorrection"): kb system = four kinds — spec, engine
  (class-blind), class (the deletion/adoption unit), data. Class
  packages carry conventions/schema/templates/triggers/checks,
  reaching core only as runtime data. Invariant: nothing below a
  class names the class. Layer numbers dropped entirely. Delivery
  machinery leaves kb core — boundary settled; packaging (peer
  standard vs in-suite package) deferred to T4 after one walk-back
  (trigger banks *are* kb collections, so full mutual ignorance would
  force a restated collection spec; one-way triggers→kb-spec citation
  is the clean shape).
- **040 blast radius fully classified** (incl. two entries the
  original T2 scope missed: memory-policy is runtime-coupled — a
  defect even under v2.0's own coupling rule — and
  cross-reference-notation carries layer vocabulary).
- **T2 execution pipeline encoded** in-repo: brief at
  `.claude/todo.kb/2026-07-12-000-Land-v2-2-core-and-classes-rework--T2-.md`;
  todo.md is ordered so an in-order agent runs haiku rename sweep →
  fable drafts → fresh-context adversarial review (three named
  targets) → land. Review-before-land is deliberate: this session's
  two big moves were each ratified within a single turn.

## Live Follow-Ups

All tracked in-repo (`bukzor-agent-skills/.claude/todo.md` +
`.claude/todo.kb/2026-07-11-000-settle-task-grain-and-store-count-for-design-next.md`):

- T2 pipeline (supersedes the old "rework function-grouped entries"
  line; see the in-repo brief): haiku genre→class sweep, fable
  drafts, fresh-context review — decision 3 (class-local code =
  consumer status) still needs operator ratification there.
- T4: trigger-subsystem design session (condition vocabulary,
  compilation model, packaging verdict).
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
