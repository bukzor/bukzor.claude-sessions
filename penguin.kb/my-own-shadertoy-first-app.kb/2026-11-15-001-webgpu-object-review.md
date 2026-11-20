# Findings (WebGPU-object review session ffde79d7, 2026-11-15..20)

- Commit df8e6e6, pushed: `describeObject` rejects iterables at the type
  level. Rulings: sets and objects are routed by static type, never by a
  runtime `Symbol.iterator` check; `constructor.name` over
  `Symbol.toStringTag`; function-valued properties are not filtered out.
- Recall from 509ca6b: item 1 half right (missed why the linter wants
  `void`), item 2 right, item 3 rejected by bukzor as presupposing its
  answer. df8e6e6 carries the miss forward and recasts item 3.
- The bank fired, but mid-session, when the root `CLAUDE.md` gained its
  stanza; `git rev-parse --show-toplevel` found it from the app subdirectory.
