# 2026-07-23 pickup: frontier ratification; puppeteer-core migration todo

Reviewed the capture-implementation-frontier survey (agent-generated,
user-unreviewed prior to this pickup) alongside this thread's two
`2026-07-23-*` todos. Discussed the trade-offs explicitly rather than
taking the survey's table at face value: its axes aren't equally
weighted — this project's own requirements
(`crash-durability`, `unblocked-sessions`) rank silent-miss and
crash-durability above owned-LOC, which the "frontier-optimal" tagging
alone doesn't capture. Measured the current implementation's actual
owned-LOC split to ground the comparison in fact: ~667 lines total in
`src/`, ~180 of which exist only to fight Playwright (UA probe/cache
subsystem, Crostini launch workarounds, popup-attach race machinery).

**Ratified:** two winners, not one, because they answer different
deployment contexts —

- Near-term: `puppeteer-core` (or chromiumoxide, if the rust port
  proceeds) as the capture host. Same architecture as the survey's
  `pure-cdp-spawned.md`, library-mediated instead of hand-rolled.
- Longer-term: the `browser-extension-tap.md` candidate
  (`chrome.debugger` in the user's daily browser) as the eventual
  production surface — gated on the capture-semantics layer (ledger,
  drain, barrier) being stable first, since MV3 service-worker lifecycle
  adds a new completeness hazard the cut model would need to absorb.

The current Playwright implementation is dominated: largest middleware
footprint of any frontier candidate, while its page-automation value
goes unused in production (the human drives) and both open completeness
todos already route around it.

## What changed on disk

- New strategic todo
  `todo.kb/2026-07-23-002-Migrate-capture-host-to-puppeteer-core.md` —
  the medium-term host migration. Gated on a "host seam" precondition
  (added as a new implementation step to `2026-07-23-000-*`: while
  rewriting the drain, isolate "CDP sessions + events per target" behind
  one small interface) and triggered/timed by `2026-07-23-001-*`'s venue
  spike (a can't-carry verdict escalates it to immediate priority; a
  can-carry verdict just removes the urgency, not the rationale).
- `todo.md`: reordered/reworded the three related bullets; folded the
  standing `.mjs`→`.ts` bullet into the migration todo's implementation
  steps (`tsconfig.json` strictness tightening is *not* subsumed — its
  TS7016 `playwright-core` stub survives the migration, since Playwright
  stays a devDependency for tests).
- Fixed two false claims the frontier survey's prose made against its
  own frontmatter numbers: `mitm-proxy.md`'s "least owned code of any
  candidate considered" (false against its own `~250` vs. others'
  `~0`/`~50`/`~150`) and `pure-cdp-spawned.md`'s "most owned code of the
  three frontier-optimal candidates" (there are four, not three — a
  leftover from when candidates lived in one document).
- Brought `060-deliverables.kb/m1-m3` off stale HAR-file acceptance
  criteria (`out.har`, "Playwright handles HTTP-level compression") onto
  current JSONL-stream ground truth
  (`src/cdp_to_har.mjs`, `tests/har.spec.mjs`, `toy_pluck.sh`).
- Fixed two small pre-existing defects found while verifying the prior
  session's synthesis: a missing `../` in a body link in
  `design.kb/040-design.kb/capture-cut-model.md`, and a stale layer-range
  ("060-deliverables" → "070-future-work") in the package `CLAUDE.md`.

## Open, unresolved

- `design.kb/070-future-work.kb/capture-implementation-frontier.md`'s
  generated comparison table is stale against a concurrent session's
  rewrite of `capture-implementation-frontier.sh` (now emits per-candidate
  YAML, not a markdown table). Not this pickup's call — filed as a
  `todo.md` bullet for whoever reconciles it.
- Two broken links unrelated to any work here, noticed incidentally via
  `llm.kb-validate-links .`: `dev.kb/rust-port.kb/commits.kb/1300-retire-node.md`
  and `dev.kb/rust-port.kb/handoffs.kb/CLAUDE.md`. Filed as a `todo.md`
  bullet, not fixed blind (out of scope, unfamiliar design area).

Devlog: `docs/dev/devlog/2026-07-23-002-Frontier-ratification--doc-accuracy-pass--todo-restructuring.md`.
