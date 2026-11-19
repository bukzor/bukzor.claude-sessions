---
status: likely
evidence:
  - ../evidence.kb/2026-11-19-017-livekernelevent-and-deadlock-hang-history-last-60-days.md
---

# Deadlock hangs/crashes recur; earlier WHEA hardware errors

WER recorded about 15 deadlock.exe hang/crash reports between 2026-09-25 and 2026-11-17. LiveKernelEvent 124 (WHEA_UNCORRECTABLE_ERROR, a hardware-reported error) fired on 09-29, 10-05 and 10-27. Today's 117 is the first TDR in the window. Status is `likely`: the hang reports have not been individually tied to the GPU.
