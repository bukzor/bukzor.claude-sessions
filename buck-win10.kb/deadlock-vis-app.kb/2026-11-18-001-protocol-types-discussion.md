# Discussion 2026-11-18T19:03–20:25 (session 7bdf94e8, no code)

How to share the protocol's types between Python and TS. Outcome: idea
`2026-11-18-010-vis--one-JSON-Schema-for-the-protocol-s-Python-and-TS-types.md`
(commit `ead2f1b`). It records the user's ruling (a JSON Schema third source;
no run-time-loaded protocol) and the open problems.

Overlap suspect: a peer session was writing idea
`2026-11-18-015-vis--the-protocol-s-kind-key-means-two-things.md` (an untracked
skeleton at 20:20). 010's schema uses `kind` as the line tag
(`discriminator: kind`), so a rename from 015 changes 010's tag field. Settle
015 first, or together with 010.
