---
status: confirmed
evidence:
  - ../evidence.kb/2026-11-19-012-minidump-exception-faulting-module-all-three-dumps.md
  - ../evidence.kb/2026-11-19-002-steam-gameprocess-log-tail.md
---

# All three post-reboot crashes are the same WARP null read

Each crash is EXCEPTION_ACCESS_VIOLATION reading address 0xb8 at d3d10warp.dll+0xdc991, about 10 s after launch. The failure is deterministic: it will recur on every launch while the GPU stays disabled.
