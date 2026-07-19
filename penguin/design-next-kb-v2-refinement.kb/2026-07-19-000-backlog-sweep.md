Part of `../design-next-kb-v2-refinement.md`.

# 2026-07-19: backlog sweep

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

