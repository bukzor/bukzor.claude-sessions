---
status: refuted
evidence:
  - evidence.kb/2026-09-23-000-full-process-tree-around-driftwatch-raw.md
  - "driftwatch.sh read in full 2026-09-23: no internal fork/exec/setsid/nohup/self-invocation"
---

# User's hypothesis: excess forking in the process tree

Tested directly against the user's question ("how did those processes
lose their parent? Or did they, even? ... avoid fork ... helps this
kind of problem a lot"). Refuted: each individual `driftwatch.sh`
instance's tree is minimal and clean -- one bash wrapper -> one
`driftwatch.sh` -> exactly one `inotifywait` child (evidence.kb/000,
every triplet in the forest). `driftwatch.sh` itself has zero internal
`fork`/`exec`/`setsid`/`nohup`/self-invocation; it is a single `while
true` loop that shells out to two tools and blocks in `inotifywait`.

The "lost parent" is real but by design, not a crash: `Monitor` detaches
its process at launch (Claude Code's background-task mechanism), so
each instance's immediate parent is `systemd --user` (PID 269, the
container's subreaper), confirmed for every instance in evidence.kb/000
(`PPID 269` on the wrapper). This reparenting happens once, at normal
launch, identically for the legitimate long-lived instance (PID 20370,
alive since Sep 11) as for every duplicate -- it is not what produced
130 of them. See `root-cause.kb/excess-forking-in-driftwatch-process-tree.md`.
