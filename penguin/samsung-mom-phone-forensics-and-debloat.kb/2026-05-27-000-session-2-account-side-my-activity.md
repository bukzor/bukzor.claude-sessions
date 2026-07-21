# 2026-05-27 (session 2): account-side My Activity cracked it open

Two captures (live scrape + Takeout export, parsed by new
`scripts/myactivity_takeout.py`) show the adware was an **~80-package PPI bundle,
Play-Store-installed**, that **detonated 2026-05-18** as a single-day
store-deeplink burst (onset 07:09:27; gone from device by 05-25). The
seed/controller is **off-Play** — the 04:53→07:09:27 trigger window is silent in
every retained source — leading candidate **`com.open.web.ai.browser`** ("AI
Browser": sideloaded, Samsung-Device-Care-flagged, ties to a Chrome Yahoo
search-hijack), but **undated/unconfirmed**. The Tencent APK is downstream, not
the enabler. New: `timeline.kb/` (full chain) and a **data-preservation wipe
gate** in `mission.md`. README is current — read it first.
