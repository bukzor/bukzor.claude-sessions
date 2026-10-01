---
cwd: /home/bukzor/repo/github.com/bukzor/2026-05-19--task-archeology/claude-code-holistics
session:
  uuid:
    - c5730239-0cf8-4a44-b2a6-dfa39f247341
  started: 2026-09-04T13:15:05-05:00
  ended: null
---
# Sub-agent Dispatch: Isolation, Orchestrator Cost, and Abandoned Jobs

Deriving an approach to the four dispatch problems the 2026-09-03 68-job run
surfaced in `claude-code-holistics/`: workspace isolation is requested but not
enforced (P1), dispatcher context cost grows with job count (P2), a claimed
job that dies is invisible (P3), and instruction can still be authored at
spawn time (P4). The brief states problems and acceptance criteria only; its
Proposed Solution is deliberately null and filling it is the first step.

Taskfile:
`/home/bukzor/repo/github.com/bukzor/2026-05-19--task-archeology/claude-code-holistics/.claude/todo.kb/2026-09-04-000-Sub-agent-dispatch--isolation--orchestrator-cost--and-abandoned-jobs.md`

## Findings

- P3 is not merely structural: `work/` right now holds three markers that are
  both in `_claimed/` (08:35:24) and re-queued (08:35:53). `jobs.py map`
  rebuilds the queue without consulting or clearing `_claimed/`, so a rebuild
  resurrects in-flight jobs. That crosses the brief's "sole writer per output"
  constraint, not just its P3 criteria.
