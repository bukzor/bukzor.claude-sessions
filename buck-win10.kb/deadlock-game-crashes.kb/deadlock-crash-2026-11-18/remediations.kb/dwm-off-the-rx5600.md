---
status: proposed
requires-sudo: false
---

# Get DWM's VRAM off the RX 5600 XT

- **Zero VRAM:** DWM always composites with D3D on the adapter that drives the
  monitor, and there is no software-composition mode. The Ryzen 5 3600 has no
  iGPU. The only way to zero is a second display adapter (a cheap GPU, or a
  G-series APU) driving the monitor, with deadlock.exe set to "High
  performance" under Settings > Graphics. Windows then copies each finished
  frame across adapters.
- **Shrink it:** DWM measured 263 MB idle with 6 windows, 461 MB at the
  incident. Close windows, disable transparency effects, keep the Parsec
  virtual display inactive.
- **Caveat:** Deadlock's texture streaming sizes itself to the GPU's memory
  budget (`r_texture_budget_dynamic`=true, threshold 0.9; developmentonly, so it
  can't be tuned in retail; data/dlls/convars.tsv). VRAM that DWM frees is
  likely reclaimed by the game's texture pool, so event 500 may keep firing.
