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

**Resolved (2026-07-09):** the `failed` branch (`0c8127c`, a prior larger
"Abbycraft" attempt) is ruled out of scope by the user — no further mining,
no action needed. Environment facts already salvaged from it live in
`docs/dev/background.kb/pgzero-mechanics.md`.

Task tracking for this project lives in `docs/dev/design/060-deliverables.kb/`
(`status: not-started|done` per file) and `docs/dev/discourse.kb/questions.kb/`
— not `.claude/todo.md` (project doesn't depend on `Skill(llm-subtask)`).

2026-07-09: all three discourse follow-ups resolved by the user and
promoted into the design tree:
- [x] Session 2 splits into 2a (`session-02-the-world-is-a-list.md`, the
      loops/dict/nested-list load) + 2b (`session-02b-trees-and-treasure.md`,
      pure play, no new concepts) — rationale: oversized sessions are hard
      to fix mid-session, undersized ones can always be merged back.
- [x] Session-5 clickable buttons demoted to stretch-only, but not
      pre-decided in the doc — it's a live just-in-time question posed to
      Abby after the keyboard build lands ("want buttons too?").
- [x] Opening ritual adopted (run `main.py`, read last commit aloud,
      narrate one thing) in `session-facilitation-protocol.md`; cadence set
      to weekly, same day if possible, in `session-arc-and-pacing-design.md`.

Also still open: the whole `project-bootstrap.md` first-tasks list (smoke
test, `checkpoints/session_00.py`, replace `README.md`, seed `ideas.md`,
gitignore `trash/`) — `status: not-started`, nothing done yet.
