# INCIDENT -- Investigation kb

The daily `pnpm-upgrade-g` anacron job on this machine failed every run
from 2026-09-12 through 2026-09-16 with `Error: Cannot find module
'/home/bukzor/.cache/node/corepack/v1/pnpm/12.4.1/bin/pnpm.cjs'` at the
`corepack use pnpm@latest` step. Root cause confirmed and fixed
(`root-cause.md`): `~/bin/corepack` routed the job through a stale,
volta-bundled corepack (0.34.0, predates the pnpm-v11/v12 `.mjs` fix)
instead of the separately-installed, kept-current pnpm-managed corepack
(0.36.0). Which one won was a PATH-order question decided by whether
direnv's hook had fired for `$HOME` -- not "interactive vs. cron" as
first framed (`findings.kb/direnv-masks-the-bug-by-reordering-path.md`).
Fixed 2026-09-17: `~/bin/corepack` removed outright, the stale corepack
cache entry cleared, and `.envrc`'s redundant `prefix/pnpm/bin` entry
deduplicated -- all applied and verified end-to-end (`remediations.kb/`,
`evidence.kb/2026-09-17-00{3,4}-...md`). Upstream comment posted to
`nodejs/corepack#775` (`reports.kb/corepack-775-comment.md`,
`status: posted`).

Collections, one per information type:

- `timeline.kb/` -- dated events of the incident; `timeline.md` synthesizes
- `evidence.kb/` -- raw captures; append-only, never rewritten
- `findings.kb/` -- conclusions distilled from evidence, status-tracked
- `root-cause.kb/` -- candidate explanations; `root-cause.md` is the decision point
- `environment.kb/` -- static machine context (topology, resources, monitoring)
- `remediations.kb/` -- prevention/recovery measures and adoption status
- `reports.kb/` -- outbound upstream contributions and posting status
- `todo.kb/` -- next actions, Skill(llm-subtask) conventions

Maintenance:

- New evidence lands as a new dated file in `evidence.kb/`; then update the
  `status`/`evidence` of affected findings and root-cause candidates --
  never edit a capture to match a conclusion.
- When the root cause closes, rewrite `root-cause.md` to state the answer;
  keep `root-cause.kb/` as the record of why alternatives lost.
- Update `last-updated` in `README.md`/`timeline.md` when their content changes.
