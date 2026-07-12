---
cwd: /home/bukzor
session:
  started: null
  ended: null
---
# Settle sessions.kb conventions (planned)

Several conventions surfaced during the must-read.kb rollout but
weren't decided. They affect how every future session is captured.

## Open questions

### 1. When does `session.ended` transition from null to a timestamp? — RESOLVED by convention (2026-07-12)

Settled in practice, not by explicit discussion: `.template.md` now carries
`ended: null # set only when no more sessions are expected (~= about to
delete this file) -- not "my conversation ended"`. That's the "leave null
until manual cleanup" option, formalized inline where every new entry
copies from. Not written into `sessions.kb/CLAUDE.md` itself, but the
template counts as "documented... elsewhere" per this file's own
Delete-When clause.

### 2. Task.md untracked-by-convention rule — RESOLVED, premise was false (2026-07-12)

Checked git tracking directly: both current Task.md files
(`CLAUDE.integrate-sessions-kb-into-llm-subtask.Task.md`,
`CLAUDE.move-skill-triggers-to-must-read-kb.Task.md`) are tracked, not
ignored (`git ls-files` shows both, `git check-ignore` matches neither).
The three files this question cited as "all untracked" have since been
deleted (task completion), so the premise can't be re-checked against
them directly, but current practice is unambiguous: Task.md files are
tracked.

### 3. Task.md vs sessions.kb entry relationship — RESOLVED, converged by attrition (2026-07-12)

Both remaining Task.md files now use the same prefix
(`CLAUDE.<slug>.Task.md`) — the two `CLAUDE.Task.<slug>.md`-style
outliers (`extract-sessions-kb-to-own-repo`, `restructure-must-read-dirs`)
were deleted as completed work this session, not renamed. Convergence
by accident of timing, not a deliberate pick — worth noting if a third
Task.md ever reintroduces the other prefix, but nothing left to rename
today.

### 4. Forward-looking (speculative)

User noted: "in practice, less than half of sessions may have a
taskfile. And it's possible the session files entirely supersede the
taskfile concept in future." If pursued, the Task.md → sessions.kb
relationship inverts.

## Delete When

Each of #1–#3 decided and documented in sessions.kb/CLAUDE.md
(or elsewhere). #4 either pursued or rejected.

As of 2026-07-12: #1–#3 resolved (see above). Only #4 remains — needs
an explicit pursue/reject call, not more convergence-by-accident.
