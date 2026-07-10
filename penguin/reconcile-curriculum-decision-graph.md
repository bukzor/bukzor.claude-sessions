---
cwd: /home/bukzor/claude/summer-programming-project/2026
session:
  uuid:
    - e1a78ee9-4c24-4c3f-a8ed-f382dcfa61ae
  started: 2026-07-09T17:07:29-05:00
  ended: 2026-07-10T17:17:00-05:00
---
# Reconcile Curriculum Decision Graph (Abby's Craft)

Audited `curriculum.kb/` (the Abby's Craft / pyxel curriculum) against the
project-root discourse graph and reconciled the tool-choice nodes for the
pgzero→pyxel pivot: new `pyxel-is-natural-successor.md` /
`why-pyxel.md` / `recommended-next-tool-pyxel.md`, old pgzero nodes kept
as a parked tablet-pivot contingency (not deleted — Pydroid has no pyxel
wheel), `resolved-next-tool-trial.md` rewritten in place to name pyxel.
Also repointed 5 broken root `*.jsonschema.yaml` symlinks (stale
`schemas/` path → `jsonschema/`). Committed as `ee697e2`, pushed.

Two follow-ups surfaced that need Buck's decision, not more agent work —
both already tracked as live nodes in the project's own discourse graph
(no separate todo needed, this project uses `Skill(llm-discourse-graph)`
for open work, not `.claude/todo.md`):

- [ ] `claims.kb/trial-execution-lacks-exit-ramp.md` — the curriculum's
  ~8-session arc has no trace of the bounded-trial/checkpoint structure
  `resolved-next-tool-trial.md` requires (1-2 sessions then a named
  "continue or back to Scratch" conversation). Needs either the checkpoint
  added to session-00/01, or an explicit decision that the trial already
  resolved informally.
- [ ] `questions.kb/what-game-to-build.md` — genre, character, and win
  condition were never decided live with Abby; the curriculum went ahead
  with defaults (Minecraft-like sandbox, no win condition, character
  punted to future-work). Needs either a retroactive session-zero
  conversation, or an explicit decision the defaults are fine.

Note, not tracked further: the broken-symlink pattern found here
(`schemas/` vs `jsonschema/`) might exist in other repos using
`Skill(llm-discourse-graph)` — unconfirmed, low-impact (no observed
automation reads these root symlinks), not worth a dedicated sweep unless
it resurfaces.
