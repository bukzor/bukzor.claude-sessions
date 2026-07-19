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

## Completed 2026-07-18 (post-T2 cleanup pass)

Worked the top-level `todo.md` backlog in order, resolving everything
mechanically- or quickly-decidable; left the items needing a real
dedicated session or operator collaboration alone (see Live
Follow-Ups). Commits `e17867e`..`9972588`, pushed.

- `decisions-are-settled-questions.md` rewritten to cite `kb-spec.md`'s
  synthesis-file element instead of restating it; fixed the dangling
  "supersedes the decision sub-type" sentence (`class-record.md` never
  had one to supersede).
- "summary" → "synthesis" rename swept across the whole llm-kb /
  llm-design-kb / design-next.kb tower (SKILL.md, self-audit.kb file
  rename, references, test fixtures, a couple of stale todo.kb/ideas.kb
  mentions). Devlogs and unrelated skills (llm-collab,
  llm-chat-librarian, llm-discourse-graph, llm-vitals) deliberately
  left untouched.
- `llm-design-kb/SKILL.md`'s `why:` teaching example was still bare-slug
  style, stale since the 2026-07-13 file-relative-path decision.
  Operator call: propagate the convention into llm-design-kb generally
  (its own `technical-policy.jsonschema.yaml` already treated `why:` as
  untyped paths, so nothing else relied on slugs).
- `references-are-structured-data.md`'s two open questions
  operator-ratified: `references:` labels are kebab-slugs (not free
  strings, matching every other identifier in the tower); no separate
  hardened-label registry (the promoted key's own schema entry is the
  record). `blocked-on: discussion` cleared; still `status: proposal`.
- Session-log residue test run for real: skimmed 3 actual devlog
  entries (llm-collab, llm-kb). Verdict: **cut** — every section
  (narrative-of-failure, decisions/alternatives, conventions
  established, open items) already has a better v2 home (incident,
  design entries, principles/procedures, task entries respectively);
  no residue, no nameable read-back moment. `class-record.md` and
  `core-and-classes.md` updated to drop the session-log sub-type.
- Chatfs-harmonization coordinator's own checklist was stale: the
  llm-kb `.d → .kb` rename child is actually done (verified — no
  `.d/` dirs, ADR Accepted) but was still shown unchecked.

## Completed 2026-07-19 (backlog sweep)

Worked the top-level `todo.md` ordering again: T3/T4/principles-rehome
still genuinely blocked (operator answer / dedicated session), so
moved to the next unblocked items — chatfs-harmonization's scoping
pass, then the shared-code-between-skills investigation, then a
survey of all four per-skill `todo.md` backlogs, resolving what was
mechanically- or investigation-decidable via three parallel forks
(reviewed and committed individually, not blindly). Commits
`4e3cdfb`..`44730df`, not yet pushed.

- Two pre-existing uncommitted drifts from 2026-07-13/18 (never part
  of this session) landed first, separately: `llm-kb`'s
  `cross-kb-cooperation-conventions.md` idea filing, and a stale-hash
  fixup in the T2 landing brief.
- chatfs-harmonization: confirmed `llm-design-kb` does **not** cover
  `milestones.kb/` (only `design.kb/`) — the llm-collab skeleton child
  task is not superseded, still needed as scoped. Its user-sign-off
  gate stands untouched.
- shared-code-between-skills: **decided**, with real `uv 0.11.29`
  experiments (not speculation) — per-skill `pyproject.toml` + `uv
  run` project mode, matching `llm-kb`'s existing shape. `--script`
  mode confirmed to ignore nearby `pyproject.toml` sources entirely.
  Forward-looking convention only; no current script needs migrating.
- `llm-must-read-kb`: wrote `references/create-new-trigger.md`
  (8-step canonical procedure), clearing the blocker on the
  must-read-slash-command idea (command itself still unbuilt).
- `llm-subtask`: batched three UX-flow fixes — trimmed todo.kb/ideas.kb
  skeleton boilerplate, added "default to lightest tier" guidance,
  added a "Cross-Repo Ownership" section.
- `llm-kb`: routed `distilling-from-a-raw-source.md`'s generic audit
  portion through `run-self-audits.md`; verified the post-rewrite
  SKILL.md coherence check (no change needed); **declined** the
  `reconcile-case-study.md` move — its "parallel to post-mortem move"
  premise was checked against git history and found wrong (commit
  `577702a` deliberately kept it skill-internal). Left as a real open
  question, not closed mechanically.

## Live Follow-Ups

All tracked in-repo (`bukzor-agent-skills/.claude/todo.md` +
`.claude/todo.kb/2026-07-11-000-settle-task-grain-and-store-count-for-design-next.md`):

- T3 (task-domain redesign: grain/horizon/scope) — needs the operator
  to answer the rating-system read-side question first, then a real
  dedicated session per axis. Not squeezable into a quick pass.
- T4: trigger-subsystem design session (condition vocabulary,
  compilation model, packaging verdict). Same shape as T3 — needs a
  real session.
- `llm-design-kb/principles.kb` charter has outgrown "design.kb
  authoring" scope; widen or rehome (rated tier-4 by user, still
  unresolved).
- Chatfs-harmonization: the `llm-collab` skeleton-update child is
  still genuinely open (~3h estimated, "pending user sign-off on
  tentative steps" per its own file). **Resolved 2026-07-19:** not
  superseded by `llm-design-kb` (checked — it only covers
  `design.kb/`, no `milestones.kb/` concept). Still needs the sign-off
  before the 3h gets spent.
- **Resolved 2026-07-19:** `shared-code-between-skills.md` — decided
  per-skill `pyproject.toml` + `uv run` project mode via real
  experiments; forward-looking, nothing to migrate yet.
- Four per-skill `todo.md` backlogs (`llm-kb`, `llm-collab`,
  `llm-subtask`, `llm-must-read-kb`) surveyed 2026-07-19; the
  mechanically-decidable items were resolved (see "Completed
  2026-07-19" above). Still open per-skill, none blocking:
  `llm-kb` (`.claude/settings.json` permissions migration, two
  ideas.kb entries, `reconcile-seed-case-study.md` — has its own
  sessions.kb entry, substantial), `llm-collab` (HACKING.md fate for
  kb-only repos, blocking-pattern doc, ideas.kb pattern doc,
  devlog-reevaluation and todo/todo.kb-relationship items under
  Later), `llm-subtask` (milestone/phase planning pattern gap —
  discussion invited), `llm-must-read-kb`
  (`todo.kb/2026-05-15-000-must-read-slash-command.md` — now
  unblocked, could be built next).
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
