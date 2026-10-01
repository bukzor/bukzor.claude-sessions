---
status: refuted
---

# Excess forking / process-tree complexity in driftwatch.sh itself

The user's initial hypothesis: that the processes "lost their parent"
through some pathological forking pattern within `driftwatch.sh`, and
that simplifying the tree (more `exec`, less `fork`) would address it.

Refuted directly: `driftwatch.sh` (read in full) has no internal
`fork`/`exec`/`setsid`/`nohup`/self-invocation -- a single `while true`
loop, two `report()` subshells, one `inotifywait` blocking call. Every
instance's tree, storm duplicate or not, is identically minimal
(evidence.kb/000). The reparenting to `systemd --user` (PID 269) that
prompted the question is `Monitor`'s own background-task detachment at
launch, applied uniformly and by design -- not a defect in this script
and not something `exec`-ing more inside it would change. See
`findings.kb/individual-process-tree-is-not-the-defect.md`.
