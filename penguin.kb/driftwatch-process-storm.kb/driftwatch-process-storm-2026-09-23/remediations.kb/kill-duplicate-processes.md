---
status: done
requires-sudo: false
---

# Kill the 129 duplicate driftwatch.sh instances

Recovery, not prevention (see `flock-guard-in-driftwatch-sh.md` for
that). As of 2026-09-23T11:14 local, 130 `/bin/bash ./driftwatch.sh`
processes are live: PID 20370 (parent 20368, started Sep 11 -- the
legitimate standing instance) plus 129 started between 10:26 and
10:42:57 today, all idle in `inotifywait` (confirmed: no
`survey-captures`/`gc-patch-failures` subprocess currently running), so
killing them loses no in-flight work.

Proposed command, keeping the oldest (20370) and everything outside
today's spawn window:

```bash
ps -eo pid,ppid,lstart,cmd | awk '/\/bin\/bash \.\/driftwatch\.sh$/ && $0 !~ /Sep 11/ {print $1}' \
  | xargs -r kill
```

Then re-verify the inotifywait children are gone too (they exit on
their parent's death) and that exactly one `driftwatch.sh` remains.

Applied 2026-09-23T12:13 local, user confirmed ("yes, good"). One
correction to the plan as proposed: `kill` on the 129 `driftwatch.sh`
parents did not kill their `inotifywait` children -- SIGTERM to a bash
process doesn't propagate to its already-forked children, so all 129
`inotifywait`s survived as orphans reparented to `systemd --user`,
briefly recreating a miniature version of this exact incident. Killed
separately (matched by non-legitimate PPID). Also restarted the one
legitimate instance (PID 20370, running since Sep 11): it was still
executing pre-patch code in memory (a `while true` bash loop doesn't
re-read its script file), so it did not hold
`remediations.kb/flock-guard-in-driftwatch-sh.md`'s new lock until
replaced. Settled state verified: exactly one `driftwatch.sh` (new PID
20072) with one `inotifywait` child, lock held, and a live re-check
confirms a second `./driftwatch.sh` invocation is correctly refused.
