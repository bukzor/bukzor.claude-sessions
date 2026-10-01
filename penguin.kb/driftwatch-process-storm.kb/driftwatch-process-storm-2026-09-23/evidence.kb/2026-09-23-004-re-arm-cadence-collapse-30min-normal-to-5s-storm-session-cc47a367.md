---
captured: "2026-09-23"
method: ./2026-09-23-004-re-arm-cadence-collapse-30min-normal-to-5s-storm-session-cc47a367.sh
---

# Re-arm cadence collapse: ~30min normal to ~5s storm (session cc47a367)

```sh
'python3' '/home/bukzor/claude/mitmproxy/trash/rearm_cadence.py'
```

```
total Monitor re-arm calls for driftwatch.sh in session cc47a367: 384
first: 2026-09-17T20:35:36.706Z
last: 2026-09-23T15:42:55.882Z
gap seconds: min 4.206 max 42902.383
gaps <10s (storm-like): 124
gaps >600s (normal ~30min-cap cadence): 254
first sub-10s gap: 2026-09-23T15:30:55.039Z -> 2026-09-23T15:31:00.815Z 5.776 seconds
```
