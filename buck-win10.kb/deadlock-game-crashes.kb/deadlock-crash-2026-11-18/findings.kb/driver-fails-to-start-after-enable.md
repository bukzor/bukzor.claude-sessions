---
status: confirmed
evidence:
  - ../evidence.kb/2026-11-19-020-post-enable-failure-problem-status-livekernelevent-codes-system-events-since-19-32.md
---

# After re-enabling, amdkmdag cannot bring up the RX 5600 XT

The device reports problem code 31 (CM_PROB_FAILED_ADD) with status 0xC0000001
(STATUS_UNSUCCESSFUL). Windows logged LiveKernelEvent 0x1b0
(VIDEO_MINIPORT_FAILED_LIVEDUMP) twice and 0x117 once. The GPU is still wedged
after a warm hard reset. The RX 5600 XT is a Navi 10 card, a family known for
not resetting cleanly without a full power removal (the "AMD reset bug").

**Update 19:36:** removing the device and rescanning fixed it without a power
cycle (evidence 021). So the card was not wedged in hardware, and the Navi 10
reset-bug explanation is weakened. The failed state lived in the device node's
software state, and a fresh enumeration cleared it.
