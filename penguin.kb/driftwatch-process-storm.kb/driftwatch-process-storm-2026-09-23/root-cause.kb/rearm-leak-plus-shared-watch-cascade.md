---
status: confirmed
---

# Re-arm-on-every-notification leak, amplified by a shared-watch cascade, into OOM

Two coupled mechanisms, established in `findings.kb/`:

1. **The leak** (`rearm-on-every-notification-not-just-expiry.md`,
   `first-pass-always-prints-manufactures-self-notification.md`,
   `monitor-does-not-dedupe-on-rearm.md`): session `cc47a367` began
   re-arming `driftwatch.sh` after every notification instead of only
   genuine 30-minute expiries at 2026-09-23T15:30:55Z. Because
   `driftwatch.sh` always prints on a fresh process's first pass, every
   re-arm manufactures its own immediate "event," closing a
   self-sustaining loop with no external input needed. Because
   `Monitor` neither kills nor dedupes against a prior task watching
   the same command, every loop iteration leaves one more permanent
   `driftwatch.sh` process running. 124 iterations in 12 minutes ->
   124 duplicate processes, matching the observed count.

2. **The amplifier** (`shared-watched-paths-amplify-into-oom.md`):
   `driftwatch.sh` watches `system-prompts.kb`, into which its own
   promotion pass commits. With ~124 concurrent watchers of the same
   paths, one instance's commit wakes every sibling, each spawning its
   own survey/gc subprocess -- turning idle duplicates (individually
   cheap) into a burst of concurrent heavier subprocesses sized to the
   duplicate count.

That burst is the most likely proximate cause of the memory pressure
that led the kernel to invoke its OOM killer at 10:44:45 local,
killing PID 14326 (`claude`, `oom_score_adj:200`) -- likely (not
proven) `cc47a367`'s own process, per
`findings.kb/oom-victim-likely-the-storm-sessions-own-process.md`.
