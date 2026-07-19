---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 5547c56a-1044-4855-bd1e-a9e1e74d60e3
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

## Live Follow-Ups

All tracked in-repo (`bukzor-agent-skills/.claude/todo.md` +
`.claude/todo.kb/2026-07-11-000-settle-task-grain-and-store-count-for-design-next.md`):

- **Resolved 2026-07-19:** T3 settled — all three axes recorded in
  `class-task.md` (+ two 070 entries); sessions.kb dated-prefix sweep
  moved to the reconcile-sessions-kb-schema-drift session.
- T4: trigger-subsystem design session (condition vocabulary,
  compilation model, packaging verdict). Same shape as T3 — needs a
  real session.
- Goals-level review (opened 2026-07-19, post-T3): settle the
  ecosystem-goals framing, then assess v2.2 against it. Claude's
  framing delivered, operator reaction pending; queued under the
  green-light gate in `.claude/todo.md`.
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
  mechanically-decidable items were resolved (see
  `design-next-kb-v2-refinement.kb/2026-07-19-000-backlog-sweep.md`).
  Still open per-skill, none blocking:
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
  Sharper open question resolved by the T3 session (2026-07-19):
  minimal-core-forever — the core's commitment is stable conventions;
  ranking-shaped needs stay externally built; `kb query` remains
  behind `structured-query.md`'s three-occurrence trigger.

## Addenda

Dated pickup write-ups (2026-07-10 through 2026-07-19) moved to
`design-next-kb-v2-refinement.kb/` — one file per addendum, `ls` for
the full chronological list. Latest: 2026-07-19 (-002), post-T3
review — `class-task.md` corrected to the final two-pair state
(`ideas.md` synthesis); goals-level v2.2 review opened.

## Delete When

design-next.kb reaches `status: accepted` across the layers touched
here and the v1 skills are actually being rebuilt against it (or the
whole effort is abandoned) — i.e. when the todo.md lines above are
either done or superseded by build-phase tracking.
