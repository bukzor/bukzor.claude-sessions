---
cwd: /home/bukzor/claude/summer-programming-project/2026
session:
  uuid:
    - e1a78ee9-4c24-4c3f-a8ed-f382dcfa61ae
    - 47beb7b1-c26a-4227-827b-bb8813bd10d5
  started: 2026-07-09T17:07:29-05:00
  ended: 2026-07-11T11:24:40-05:00
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

**2026-07-11 session:** extended the reconciliation to the whole graph.
Compared `curriculum.kb/` against root questions/claims/deductions,
surfaced 4 real conflicts + a premise-honesty gap, handed the user a
markdown worksheet (their preferred format over `AskUserQuestion` — see
below), then implemented every decision:

- Trial checkpoint added to end of session 1
  (`design/060-deliverables.kb/session-01-blocks.md`) and
  `session-facilitation-protocol.md` — resolves the first follow-up below.
- Cadence reconciled: daily-aspiration / 2-3-day-floor / 2-4-week horizon,
  fixed across `recommended-cadence.md`, `why-this-cadence.md`,
  `frequent-cadence-balances-retention-fatigue.md`, and curriculum's
  ritual doc (old "weekly" preserved in a collapsed `<details>`, not
  deleted).
- Session zero merged into session 00 (one logical session, planning then
  build, may spill across two calendar sittings without renumbering); two
  new goal-tower principles added —
  `design/020-goals.kb/her-domain-stays-hers.md` and
  `design/020-goals.kb/name-the-choice-dont-pin-it.md` — replacing a
  pre-filled agenda with "name the choice, don't pin it." Partially
  resolves the second follow-up below.
- Mission docs (`design/010-mission.kb/problem-and-beneficiaries.md`,
  `background.kb/abby-profile.md`) corrected: the game/mechanic is her
  enthusiasm + explicit pick, the Python-over-Scratch switch is the
  adult's goal with reluctant consent — was overstated as "something
  Abby asked for."
- Whole Android/Pydroid/Termux track moved to new root `archive.kb/` (13
  claims, 4 deductions, 4 sources, `installing-termux.kb/`,
  `abbys-device-log.kb/`), all ~25 cross-references fixed both
  directions — see `penguin/installing-termux-steps.md` for the path
  update. Per user: it was "confusing agent to no end" left live.

Cross-project, not this repo: drafted a "Decision Points" lifecycle
section in `Skill(llm-kb)` (`$ITEM.md` + `$ITEM.kb/`, resolve →
summarize → keep-or-clean-up), cross-linked from
`Skill(llm-discourse-graph)`'s Roll-up section, and a new must-read
trigger (`must-read.kb/before/using-claude-code-tool/AskUserQuestion.md`)
favoring worksheet files over `AskUserQuestion` for multi-decision/prose
answers — both motivated by how well the worksheet format worked this
session. Uncommitted in `~/repo/github.com/bukzor/bukzor-agent-skills/`
and `~/.claude/` as of this update.

Both original follow-ups now addressed:

- [x] `claims.kb/trial-execution-lacks-exit-ramp.md` — checkpoint added,
  claim marked `status: resolved`.
- [x] `questions.kb/what-game-to-build.md` — not decided by fiat (that
  would repeat the original mistake); instead the mechanism to decide it
  live with Abby now exists (`claims.kb/session-zero-agenda.md` names
  genre/character/win-condition as explicitly her call). Abby hasn't
  actually had that conversation yet — real-world follow-up for Buck, not
  agent work, so not tracked further here.

Note, not tracked further: the broken-symlink pattern found in the prior
session (`schemas/` vs `jsonschema/`) might exist in other repos using
`Skill(llm-discourse-graph)` — unconfirmed, low-impact, not worth a
dedicated sweep unless it resurfaces.
