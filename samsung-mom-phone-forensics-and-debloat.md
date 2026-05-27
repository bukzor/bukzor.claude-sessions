---
cwd: /home/bukzor/claude/bukzor.samsung-debloat
session:
  uuid: 24ad6496-1df7-4921-a76d-7aecc7052c12
  started: 2026-05-26T17:40:00-05:00
  ended: 2026-05-26T19:38:00-05:00
---
# Samsung Mom-Phone Forensics and Debloat

Mother's Galaxy S24+ (SM-S926U, hardware #2) arrived overrun with
zero-interaction adware popups. This session did read-only forensics before a
planned factory wipe + de-Samsung. Established: active malware already removed
by her uninstall spree; the Downloads dropper is Tencent 应用宝 (a secondary
payload); logcat is usable back to 2026-05-21 and shows a crashing fake-weather
app; TeamViewer is the user's own (intentional) support tool, now documented in
the repo. Full live state, findings, and gotchas are in the project task kb.

Task kb (read this first): /home/bukzor/claude/bukzor.samsung-debloat/.claude/current-task.kb/

## Open work

- [ ] Write `scripts/forensic-report.py` — reusable analyzer for a
  `forensics/<capture>/` dir (logcat coverage + package install/remove events +
  crashes; usagestats removed-app candidates; suspicious flags; Downloads
  anomalies). Do this FIRST — inline bash kept failing under `set -e -o pipefail`.
- [ ] Confirm **patient zero**: mine `logcat-events.txt` + usagestats, web-check
  the fake-weather package names, ask the user, and pull the Play Library.
- [ ] Account-side review (her Google account): Play **Library** (definitive
  removed-app list + install source), Play **Protect** history, purchase/
  subscription history, Google **Security Checkup** (card-fraud thread).
- [ ] **Factory wipe + de-Samsung**: reuse `scripts/master-debloat.adb.sh` as a
  *guide*; verify package names against Android 16 / One UI 8; reinstall
  TeamViewer Host as readiness.
- [ ] Prevention: re-enable Auto Blocker, set "install unknown apps" OFF for all
  apps, keep Play Protect on.
