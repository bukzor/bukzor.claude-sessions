---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor.garden
session:
  uuid: [] # planned 2026-08-30, not yet started; append your uuid on pickup
  started: null
  ended: null
---

# STTT Bot Existence Proof — Doable, by Buck, in Static Rust-WASM

20%-time session. Attempt a proof-of-existence argument that a *good*
STTT bot is buildable — by Buck, in a static rust-wasm setting (no
server compute) — before any code is written. The point is to put Buck
at ease about the 2026-02→03 stall, on argument rather than vibes.

Shape of the argument to develop or refute:

- The 2026 beam-search bot died on the untrusted evaluation function.
  MCTS replaces the eval with playouts, so that failure does not
  forecast this approach — make that rigorous, not hand-wavy.
- Budget arithmetic: sttt-engine playouts/sec in wasm × tolerable
  per-move latency (~100ms–1s) → is the playout count in strong-play
  territory? Cite browser-wasm MCTS precedent.
- Free byproduct if it holds: the playout budget is the difficulty
  dial the V0 list already wants.

Constraints: this is play, expressly out of ship scope — the support
button waits on none of it (ruling:
`~/repo/github.com/bukzor/private.bukzor-llc/strategy.kb/products.kb/sttt.md`).
Materials: `packages/sttt-engine` (warm through 2026-08); idea entry
`private.bukzor-llc/.claude/ideas.kb/2026-08-30-000-sttt-good-bot-in-static-rust-wasm-20pct-play.md`;
the stall-arc chat titles in llc devlog 2026-08-30-001; Buck offered to
pull chat bodies on request.
