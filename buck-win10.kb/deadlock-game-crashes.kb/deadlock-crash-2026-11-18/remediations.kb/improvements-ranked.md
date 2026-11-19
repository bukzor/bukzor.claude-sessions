---
status: proposed
requires-sudo: false
---

# Improvements, ranked by leverage per cost

1. Restart DWM only when no game is running. Make the toast say so, and show
   DWM's own size so the leak is visible.
2. Update the AMD driver. 32.0.21043.5001 dates from 2026-03-02. A DWM VRAM
   leak plus TDR and WHEA history points at the driver first.
3. Cut co-resident VRAM while gaming: Chrome (about 430 MB at the incident),
   steamwebhelper (about 390 MB), AMDRSServ (137 MB).
4. Hardware, last: an 8 GB+ card, or a second display adapter so DWM leaves
   the 5600 XT.
