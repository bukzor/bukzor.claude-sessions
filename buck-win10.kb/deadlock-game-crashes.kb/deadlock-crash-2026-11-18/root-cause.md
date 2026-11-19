# Root cause: proximate cause closed; upstream causes open

**Post-reboot crashes (3):** the AMD Radeon RX 5600 XT is disabled (code 22,
ConfigFlags=1). Windows falls back to the Microsoft Basic Render Driver, and
Deadlock hits a null read in d3d10warp.dll+0xdc991 about 10 s into every launch.
Confirmed: see findings.kb/gpu-disabled-code-22.md and warp-crash-deterministic.md.

**Trigger (user report):** the user killed dwm.exe's process tree after a
450 MB memory alert. See findings.kb/dwm-kill-triggered-tdr.md.

**Pre-reboot hang (1):** a GPU timeout that did not recover (LiveKernelEvent
117) at 19:21, which forced a hard reset. See findings.kb/pre-reboot-tdr-117.md.

**Resolved (19:36):** re-enabling the device gave code 31. Removing the device
and rescanning for hardware brought it back with Status OK (evidence 021).

Open:
- what disabled the device (findings.kb/disable-actor-unknown.md)
- why the GPU hung. The driver, hardware, or thermals/overclock are all
  plausible given the WHEA 124 history (findings.kb/recurring-instability.md).

Leading candidate: root-cause.kb/gpu-hang-then-disabled.md.
