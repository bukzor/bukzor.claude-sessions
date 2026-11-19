---
status: leading
---

# GPU TDR, then the device was left disabled

The RX 5600 XT hung (TDR 117) and took down the session. After the hard reset the device was disabled, and Deadlock deterministically crashes in WARP. This explains every observed crash. It leaves open why the device got disabled and why the GPU hung.
