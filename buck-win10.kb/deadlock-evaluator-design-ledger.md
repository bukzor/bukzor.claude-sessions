---
cwd: /home/bukzor/claude/deadlock
session:
  uuid:
    - cd601ea7-5c0a-48fb-b795-360a30559d21
  started: 2026-11-16T17:19:55+00:00
  ended: null # set only when no more sessions are expected (~= about to delete this file) -- not "my conversation ended"
---
# Deadlock Evaluator Design Ledger

Design of `packages/deadlock-evaluator`: decompose the nonlinear build-to-win
relationship into composable layers (compile, economy, engage, observe,
measure, generic operators, applications), recorded as a claim ledger with
standing marked. The ledger is `packages/deadlock-evaluator/docs/dev/claims.md`
and `claims.kb/`; its docs guide is `docs/dev/CLAUDE.md` beside it. The
package has no code yet beyond two claim witnesses and a `boon-deadlock`
dependency; `data/tools/boon.d.do` vendors the parser and
`data/replays/default.dem.do` fetches public match demos.

Plan `docs/dev/close-open-claims.md` (five sub-agent units, all done) closed
every `standing: open` claim by measurement; its handoff kb
`close-open-claims.kb/` stays until the owner reviews.

## Open

The owner's rulings are parked in `~/claude/deadlock/.claude/todo.md` (top
entry, four sub-tasks): plan review then `git rm -r` of the handoff kb; ground
six `standing: user` goals; two agent rulings open to veto (Outcome summary
vs trace, scripted micro-policy first); the vis import edge (3.14 vs 3.12
workspaces, code owned by the vis-app session, `deadlock-vis-app.md`).

- [ ] First code: `compile` over `data/gamedata.tsv/`, seeded by the vis
      timeline (`claims.kb/architecture.kb/vis-timeline-seeds-compile-and-engage.md`),
      once the workspace question is ruled
- [ ] `observe`: Parquet export of a demo via boon, DuckDB over it
      (`claims.kb/tooling.kb/json-and-python-suffice-except-the-corpus.md`);
      33 finished local bot demos sit in the install's
      `replays/discarded/replays/` (`docs/dev/environment.kb/game-install-paths.md`)
