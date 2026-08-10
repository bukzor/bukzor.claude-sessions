---
cwd: /home/bukzor
session:
  uuid: # chronological; append your uuid when picking this entry up
    - c62b051a-257a-4370-b23c-b1ec75b1d691
  started: 2026-08-10T12:53:26-05:00
  ended: null
---

# Crostini Health — Keeping Penguin Alive

Standing line of work on this one machine: the ChromeOS host balloons the
`termina` VM out from under `penguin`, the container has no swap, and the
kernel OOM killer provably never fires, so the failure mode is a reclaim
livelock rather than an OOM kill. It hard-froze once (2026-08-08, a night
of 17 sessions lost) and has lost its OOM guard twice since. The record
lives in its own repo, `~/claude/crostini-health/` (no remote; gitignored
from dotfiles by `~/claude/.gitignore`'s `*/`).

Start there: `README.md` says what guards the machine now and what is
still exposed; `CLAUDE.md` states the organizing rule (present-tense
machine state at the top level, a past investigation's record inside its
incident).

## Completed this session

- Diagnosed the login-time `bootstamp: unknown OS` down to lxcfs dying in
  termina at 12:41:50, stranding ten FUSE mounts over `/proc` at
  ENOTCONN. earlyoom crash-restarted 171 times behind it; the OOM guard
  was down for the whole window and nothing said so.
- Installed the automatic correction the user asked for, all in
  `bukzor/dotfiles` (`0ce0956`, `1653c32`): user-scoped **monit** on a
  30s cycle, with `~/.local/share/health/{proc-readable,lxcfs-detach,notify}`
  and `~/.config/systemd/user/{monit,lxcfs-detach}.service`. It repairs
  stale lxcfs mounts outright and raises a ChromeOS notification when
  earlyoom is missing or crash-looping.
- Detached the lxcfs overlays for good: they virtualize nothing in this
  container (`memory.limit_in_bytes` is unlimited, `cpuset.cpus 0-7`,
  MemTotal already 14834464 kB) while being the single point of failure
  that had taken earlyoom down twice.
- Renamed `~/claude/vm-freeze-2026-08-08` → `~/claude/crostini-health` and
  pushed the investigation down under `incidents.kb/`, so the repo is
  scoped to the machine rather than to one outage.

## Live follow-ups

- [ ] Pick an endpoint for the off-machine dead-man's switch —
      `~/claude/crostini-health/todo.kb/off-machine-dead-mans-switch.md`.
      This is the highest-WSJF item here and the only one that covers the
      freeze itself; it is blocked purely on a user choice among
      healthchecks.io / self-hosted Uptime Kuma / scheduled GitHub Actions
      / a second machine.
- [ ] Get nohang working — `~/claude/crostini-health/todo.kb/get-nohang-working.md`.
      PSI is the signal earlyoom structurally cannot see. Feasibility is
      settled (`/proc/pressure` exists, world-readable, not lxcfs-overlaid;
      nohang is packaged in trixie). systemd-oomd stays permanently
      impossible here — termina binds every cgroup controller to a v1
      hierarchy.
- [ ] Watch for upstream replies: earlyoom#378, comments on earlyoom#214
      and lxc/lxcfs#695, ChromeOS issue 544148694. `~/bin/upstream-replies`
      nags at shell startup until acked by hand.

## Traps worth not re-deriving

- `Restart=always` + `StartLimitIntervalSec=0` means the unit **never**
  reaches `failed`, so `OnFailure=` cannot fire and `systemctl is-active`
  reads `active`/`activating` straight through an unbounded crash loop.
  Health checks must watch process liveness and uptime instead.
- monit's `set daemon 30 with start delay 240` applies the delay only to
  the first start after a system boot, not to later unit restarts
  (observed, not documented).
- Do not `set logfile syslog` in monitrc while systemd is already
  capturing stdout — every line lands in the journal twice.
