---
status: open
evidence:
  - ../evidence.kb/2026-11-19-013-setupapi-dev-log-sections-since-2026-11-01.md
  - ../evidence.kb/2026-11-19-014-all-kernel-pnp-and-application-events-17-27-19-22-on-2026-11-18.md
---

# What set the disable flag is unknown

No setupapi.dev.log or Kernel-PnP record mentions disabling VEN_1002&DEV_731F. DWM still named the AMD card as primary at 19:20:31, so the disable happened between 19:20:31 and the 19:22:45 boot, or was applied at boot. Candidates: the user, in Device Manager, trying to recover the frozen display; AMD software; another tool.
