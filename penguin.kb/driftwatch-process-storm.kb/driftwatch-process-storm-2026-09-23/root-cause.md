# Root cause: confirmed (leak), likely (OOM link)

`driftwatch.sh` (this repo's `Monitor`-armed standing-maintenance
watcher) has no internal defect -- every instance's process tree is
minimal, and losing its immediate parent to `systemd --user` at launch
is `Monitor`'s normal background-task detachment, not a crash artifact
(`root-cause.kb/excess-forking-in-driftwatch-process-tree.md`,
refuted).

The actual defect is at the invocation layer, in one long-running
maintenance session (`cc47a367`, open since 2026-09-17). For six days
it correctly re-armed only on genuine 30-minute expiries. At
2026-09-23T15:30:55Z it started re-arming after *every* notification,
including plain all-clears -- and because `driftwatch.sh` always
prints on a fresh process's first pass (by design, so arming reports
any backlog), every re-arm manufactured its own immediate
self-notification, closing a loop that needed no external input to
sustain itself. `Monitor` neither kills nor dedupes a prior task
watching the same command on re-arm, so each of the loop's ~124
iterations over 12 minutes left one more `driftwatch.sh` process
running permanently
(`root-cause.kb/rearm-leak-plus-shared-watch-cascade.md`, confirmed).

Those duplicates are individually cheap (~3MB RSS, idle in
`inotifywait`), but `driftwatch.sh` watches `system-prompts.kb` --
which its own promotion pass writes into on success -- so ~124
concurrent watchers of the same paths turned one real change into a
mutual-wake cascade of concurrent survey/gc subprocesses. That is the
most likely (not directly observed at its peak) proximate driver of
the memory pressure behind the kernel OOM kill at 10:44:45 local,
which removed PID 14326 (`claude`, oom_score_adj 200) -- probably, not
provenly, `cc47a367`'s own process, which would explain why the loop
stopped on its own rather than being corrected.

tmux's restart 3 minutes later is timing-correlated with this same
crisis but not logged as a direct casualty
(`findings.kb/tmux-death-correlated-not-proven.md`) -- an open question
this kb cannot close further with data already on the machine.

Losing candidates, kept in `root-cause.kb/` for the record: excess
forking inside `driftwatch.sh` (refuted -- the user's own hypothesis,
directly tested), and an unrelated cron/replay harness (refuted -- an
mtime-filtering artifact, not a real match).

See `findings.kb/` for the evidence-backed claims and
`remediations.kb/` for what was done and what remains open.
