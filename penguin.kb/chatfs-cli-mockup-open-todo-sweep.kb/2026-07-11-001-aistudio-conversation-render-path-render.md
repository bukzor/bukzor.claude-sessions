# 2026-07-11 addendum (evening: conversation render/path_render)

Landed Immediate plan steps 2 (accepted done-for-now) and 3 (done) in
one sitting — see the Immediate plan section above for what shipped.
Two things worth a future pickup's attention, both recorded as open
questions in
`devlog/2026-07-11-001-aistudio-conversation-render-linear-chain.md`
rather than as todo items (neither is scheduled work, just caveats):

- The "AI Studio editing discards history, never forks" claim
  (`dev.kb/claims.kb/aistudio-jspb-prompt-shape.md`, "Turn order is
  linear") is inferred from data shape (no parent/child field
  anywhere), not a captured edit/regenerate round-trip. If a future
  live sitting captures an edited prompt, check whether this holds and
  promote the claim's status from `observed` to `settled` (or refute
  it — a fork would need real `chatfs_aistudio_conversation_render.py`
  rework, not just a status flip).
- `chatfs_aistudio_conversation_render.py`'s heading timestamps are
  computed at render time (epoch seconds → local wall clock via
  `.astimezone()`), unlike claude/chatgpt whose local-time-with-offset
  is baked into the message filename once, at splat time. Re-rendering
  `chat.md` on a machine in a different timezone than the original
  capture would show a different wall-clock hour for AI Studio only.
  Accepted as-is (chat.md is gitignored/regenerated freely; AI Studio's
  deliberately id-less, index-led basenames have nowhere to bake a
  timestamp without either changing that naming scheme or writing a
  synthetic field into the otherwise-raw per-turn `.json`) — revisit
  only if it ever causes real confusion.

Not committed by this session's end. No session-end-only commit policy
is established here: `git add` aggressively whenever code is "better",
commit freely whenever code is better *and* test+lint is clean.
