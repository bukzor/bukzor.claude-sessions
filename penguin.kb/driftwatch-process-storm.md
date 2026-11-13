---
cwd: /home/bukzor/claude/mitmproxy
session:
  uuid: # chronological; append your uuid when picking this entry up
    - ed347d77-bba5-491b-8a3e-31759bf1956b
  started: 2026-09-23T10:56:18-05:00
  ended: 2026-10-01T14:25:08-05:00
---
# Driftwatch Process Storm -- 130 Duplicate Monitors on penguin

Checking driftwatch status (`ps -efly --forest | grep -C10 driftwatch`)
turned up 130 live `./driftwatch.sh` processes instead of the one
persistent instance the "Standing maintenance" doctrine calls for.
Root cause: a six-day-old maintenance session re-armed
`Monitor(driftwatch.sh)` on every notification instead of only
genuine 30-minute expiries, and because the script always prints on a
fresh process's first pass, each re-arm manufactured its own
notification -- a self-sustaining loop (124 iterations in 12 minutes)
that likely drove the memory pressure behind a kernel OOM kill at
10:44:45 local. Fixed with a `flock` guard in `driftwatch.sh`
(`86f3373`, committed and pushed); the 129 duplicates and their
orphaned `inotifywait` children killed, the legitimate instance
restarted to pick up the fix, system recovered and verified.

Investigation: `driftwatch-process-storm.kb/driftwatch-process-storm-2026-09-23/`.

## Open

- [x] Find what spawned ~130 duplicate driftwatch.sh instances -- traced
      to session cc47a367 re-arming Monitor on every notification (not
      just expiries) from 15:30:55Z, self-sustained by driftwatch.sh's
      own print-on-first-pass; see root-cause.md
- [x] Confirm the storm has actually stopped -- last spawn 10:42:57
      local, none since; load average back to normal as of 11:14
- [x] Kill the 129 duplicate processes without disturbing the legitimate
      one -- done 2026-09-23T12:13 local; also had to kill 129 orphaned
      `inotifywait` children separately and restart the legitimate
      instance so it picks up the flock fix (`remediations.kb/kill-duplicate-processes.md`)
- [x] Decide/install a safeguard -- flock guard added to driftwatch.sh,
      committed and pushed (`86f3373`, `remediations.kb/flock-guard-in-driftwatch-sh.md`)

tmux's death and the OOM kill are timing-correlated but not log-proven
as the same event -- not closeable with data on this machine, left as
a standing caveat rather than open work
(`findings.kb/tmux-death-correlated-not-proven.md`).

## Addenda

Full investigation, evidence, and findings:
`driftwatch-process-storm.kb/driftwatch-process-storm-2026-09-23/`.
