---
status: confirmed
evidence:
  - ../evidence.kb/2026-11-19-003-windows-video-controllers.md
  - ../evidence.kb/2026-11-19-004-pnp-display-devices.md
  - ../evidence.kb/2026-11-19-011-amd-gpu-device-properties.md
---

# The RX 5600 XT is disabled, not failed

Problem code 22 is CM_PROB_DISABLED, and ConfigFlags=1 is CONFIGFLAG_DISABLED, a persistent registry flag. It survives reboots until someone re-enables the device. This differs from code 43 (the driver reported failure).
