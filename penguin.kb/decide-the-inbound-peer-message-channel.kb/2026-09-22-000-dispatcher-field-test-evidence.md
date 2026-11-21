# 2026-09-22 -- dispatcher field-test evidence

Evidence from the dispatcher field test (session
`e234e82e`, analysis at L2860, never answered -- the session died in the
09-23 tmux crash). The four peers had already judged relevance: each
entry's "Offered back to X" / "Overlap with peers" section named its
addressee. The dispatcher only noticed X hadn't read it yet, at ~140
model turns and 4 unrewindable interrupts; the ratified postbox
(PULL_DELIVERY, POINTERS_ONLY, a silent-when-empty prompt hook) does the
same at ~8 turns and 0 interrupts, and a recipient reads only mail
addressed to it. Discovery stays with the sessions.kb "overlap suspects"
line or the owner; liveness was not load-bearing. Under the postbox,
pointer/conflict/hand-off all become inbox files, so `SendMessage`
shrinks to a wake phrase or goes -- which is this entry's question, now
with an answer to rule on. The other ruling it asked for lives in
`agent-harness-design.md`.
