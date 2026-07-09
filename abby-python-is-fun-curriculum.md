---
cwd: /home/bukzor/claude/scratch.pygame-zero
session:
  uuid: 293f1f98-1212-4df4-aa38-63c693aa7a49
  started: 2026-07-08T22:21:19-05:00
  ended: null
---
# Abby Python-Is-Fun Curriculum

Design and run a "learning Python is fun" experience for Abby (10, Scratch
background): a pgzero Minecraft-like ("Abby's Craft") built across ~8 short
sessions. This session: review the curriculum draft and refine the plan.

Brief: /home/bukzor/claude/scratch.pygame-zero/CURRICULUM.md

Decisions: editor is vim + tmux (mouse-enabled, adult alongside); vim taught
via reps inside session 0, not a separate session; misconception #6 (Scratch
autosaves, files don't) added to the bridge.

2026-07-09: CURRICULUM.md was decomposed into a layered `docs/dev/*.kb`
structure (`Skill(llm-design-kb)` + `Skill(llm-kb)` + `Skill(llm-discourse-graph)`;
root `docs/dev/CLAUDE.md`). Reviewed the decomposition against the source —
faithful throughout, one real gap found and fixed: the "Operating manual for
the Claude assistant" section (hint-giving protocol, after-session checklist)
had no home in the new authoritative form; added
`docs/dev/design/060-deliverables.kb/session-facilitation-protocol.md`. Also
folded hard-won pgzero/environment facts (key/mouse constants, the 3.14/
SDL_image trap, a headless smoke-test command) from the abandoned `failed`
branch into `docs/dev/background.kb/pgzero-mechanics.md` before they were
lost. Nothing yet committed to git as of this note.

**Important, needs user confirmation:** this repo has a `failed` branch
(`0c8127c`) — a prior, much larger attempt ("Abbycraft": 12 sessions to
mobs/save-load, a pre-built `mentor/reference.py` ground-truth game, sprite
tooling), authored by a different assistant persona, that got `git reset`
away from `main`. The current lean 8-session-core + expansion-menu design
looks like the deliberate correction, but I'm inferring that — I haven't
confirmed with the user *why* it failed or whether anything else from that
branch (beyond the environment facts already salvaged above) should be
carried forward. Worth a quick check before that branch is deleted.

Task tracking for this project lives in `docs/dev/design/060-deliverables.kb/`
(`status: not-started|done` per file) and `docs/dev/discourse.kb/questions.kb/`
— not `.claude/todo.md` (project doesn't depend on `Skill(llm-subtask)`).

Open follow-ups (user hasn't ruled; tracked as formal discourse-graph
questions now, see `docs/dev/discourse.kb/questions.kb/`):
- [ ] pre-plan session 2 as 2a/2b split
- [ ] demote session-5 clickable buttons to explicit stretch
- [ ] opening ritual (run game, read last commit, narrate) + cadence note

Also still open: the whole `project-bootstrap.md` first-tasks list (smoke
test, `checkpoints/session_00.py`, replace `README.md`, seed `ideas.md`,
gitignore `trash/`) — `status: not-started`, nothing done yet.
