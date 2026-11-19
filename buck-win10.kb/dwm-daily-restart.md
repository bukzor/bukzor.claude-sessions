---
cwd: /home/bukzor/claude/deadlock
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 526a26d1-4ab2-4f04-b27d-4065dc87930a
  started: 2026-11-19T21:08:54+00:00
  ended: null # set only when no more sessions are expected (~= about to delete this file) -- not "my conversation ended"
---
# DWM Daily Restart

Restart dwm.exe about once a day to shed its VRAM leak, but never while VRAM
is contended (a restart under a full card hung the GPU on 2026-11-18; see
`deadlock-game-crashes.kb/deadlock-crash-2026-11-18/`). Built and running.

## How it works

- runit service `~/.config/runit/buck-win10/dwm-daily-restart/` (dotfiles):
  every 10 min, `dwm-probe.ps1` reports dwm's age and per-process dedicated
  VRAM; when dwm is >=24h old and non-dwm VRAM is <2048 MB it runs the
  Windows task. Stateless -- dwm's own CIM `CreationDate` is the clock.
  Log: `~/.local/state/dwm-daily-restart.log` (root-owned; runsvdir's own
  stdout is /dev/null). Quiet until dwm is due.
- Windows task `\dwm-restart` (`/rl highest /it`, principal worki), from
  `install-windows-task` (one UAC). Action: `taskkill /F /IM dwm.exe`;
  winlogon respawns dwm.

## Findings (signed: this session)

- WSL interop is Medium integrity: `taskkill dwm.exe` -> Access denied.
- A `/rl highest` task registered by worki is startable from WSL via
  `schtasks.exe /run` with **no UAC prompt** -- verified (dwm PID changed,
  user saw the black flash). This contradicts nothing but extends
  `~/claude/windows-forensics/environment.kb/privilege-model.md`, which
  says each elevation costs a prompt; that repo's owner may want the fact.
- Non-elevated `Get-Process dwm` hides `StartTime`; CIM `Win32_Process`
  `CreationDate` is readable.
- Both decision branches tested in a runsv-like env (`env -i`, root ->
  `chpst -u bukzor`): contended -> "deferred", due -> restart, age reset.

## Open

- [ ] After ~2026-11-20T21:15Z, confirm the live service logged its first
  real "restarting" line (only test copies have fired so far).
- [ ] Suggest to the crash-kb owner: mark `remediations.kb/improvements-ranked.md`
  item 1 ("restart DWM only when no game is running") as done by this service.
