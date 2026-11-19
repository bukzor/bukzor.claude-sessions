---
status: likely
evidence:
  - user report 2026-11-18, chat
  - ../evidence.kb/2026-11-19-015-livekernelevent-restartmanager-dwm-full-text-19-15-19-22.md
---

# The user's dwm.exe kill was the trigger; GPU fragility is the cause

Winlogon did restart DWM (restart count 1). About 60 s later the GPU timed out
(117). Killing DWM normally costs only a screen flicker. This time, DWM
re-initialising the display stack while Deadlock held the GPU plausibly drove
amdkmdag into a hang, and the card could not recover from it. The prior WHEA 124
events and recurring Deadlock hangs show the card or driver was already fragile.
