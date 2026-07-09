---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.chatfs/packages/har-browse
session:
  uuid: null
  started: null
  ended: null
prior-sessions:
  - uuid: 8eb1d4e4-f6ef-4356-a1f9-196748934a4e
    started: 2026-05-21T10:46:43-05:00
    ended: 2026-05-21T12:31:28-05:00
    summary: |
      Meta-planning session that produced the decisions and principles
      driving this line of follow-up work. See workspace
      `.claude/decision.kb/` and `.claude/principle.kb/` for the
      canonical decisions.
cost-benefit-sweh:
  timebox:
    '@value': 6
    confidence: tentative
    rationale: |
      Three sequenced phases. C: cdp-jsonl + diagnostic-jsonl schema design (~1 SWEh doc-only). D: baseline HAR/JSONL capture, blackbox conversion of .spec.mjs, randomized-mode test infra, zero-side-effect gate (~2-3 SWEh, 1-2 sessions). E: mutation walk + diagnostic emission in Node + assertion augmentation (~2-3 SWEh, 1-2 sessions). Aggregate ~6 SWEh.
  benefit-2w:
    '@value': 3
    confidence: tentative
    rationale: |
      Establishes language-agnostic regression gate for the Rust port — every Rust commit from 0100 onward lands against a live oracle. Foundational; multi-session work. Sister to rust-port-kb-scope-refactor.md (exec=0.77) which it builds on.
  cost-of-delay-2w:
    '@value': 0.1
    confidence: tentative
    rationale: |
      Blocks Rust port commit 0100 (scaffold) at minimum; commit 0800 (cdp-jsonl contract freeze) is hard-blocked on phase C. Each 2w of delay defers the entire chatfs Rust line.
---
# har-browse Rust-port pre-port infrastructure

Pre-port testing infrastructure for the har-browse Node→Rust port.
Three sequenced phases that all must land **before** commit `0100`
(Rust scaffold) so the regression suite is live the moment Rust
output appears.

Sister to `rust-port-kb-scope-refactor.md` (the kb-shape work) and
`har-browse-mutation-testing.md` (the spec-sharpening work). This
entry covers the testing-infrastructure work that builds on both.

## Constraints decided in meta-planning (2026-05-21)

See workspace `.claude/decision.kb/` for each:

- **BB1 ≡ har-browse.** Schema home: `packages/rs-har-browse/schema/`.
- **`./schema/` directory** with `<stem>.jsonschema.yaml` matching the
  validated file's stem.
- **Diagnostic events go in a separate stream** from cdp-jsonl.
  Interleaving concerns mitigated per-invariant via sequence
  numbers / timestamps / interleaved-format escape hatch.
- **Diagnostic emission is uniform** in production and test code paths.
  Tests sample on/off mode randomly (seeded by test name). One
  dedicated double-run gate test enforces zero-side-effect.
- **Zero-side-effect rule** is a workspace principle
  (`.claude/principle.kb/zero-side-effect-diagnostics.md`).
- **`.spec.mjs` → blackbox CLI; `.test.mjs` → Rust unit tests.**
- **example.com baseline** is a transition-only belt-and-suspenders
  fixture, retires after `1300` cutover.
- **Insert commit `0050`** (blackbox conversion) before `0100` scaffold.

## Phase C — Schema + diagnostic-events design (doc-only)

Single session likely. Doc work, no code.

- Draft `packages/rs-har-browse/schema/cdp-jsonl.jsonschema.yaml`
  (or its transitional home at `packages/har-browse/schema/` until
  the "port all docs" cutover step).
- Draft `packages/rs-har-browse/schema/diagnostic-jsonl.jsonschema.yaml`
  (or whatever name the diagnostic stream gets).
- Write the diagnostic-events spec as **observable invariants**, not
  internal state-machine transitions. E.g., `Diagnostic.barrierConsumed`
  not `Diagnostic.barrierEnterPhase1`.

## Phase D — Baseline capture + blackbox conversion + zero-side-effect gate

Likely 1-2 sessions. Mixed doc and infra work.

- Pre-record a HAR (or equivalent capture) against `example.com`,
  commit as transition fixture.
- Capture a baseline JSONL run against `toy_server`, commit as
  golden file.
- Convert `*.spec.mjs` files from in-process Playwright to subprocess
  CLI invocation; assert on JSONL output. Will surface any Node-quirk
  dependencies (fix them while still on Node).
- Build the randomized-mode test infrastructure (seed by test name;
  slow tests sample one mode if passing — quickcheck/hypothesis
  discipline).
- Set up the one explicit double-run "side-effect-free" gate test.

## Phase E — Mutation walk + diagnostic emission in Node

Likely 1-2 sessions.

- Walk `packages/har-browse/docs/dev/mutation-testing.kb/` and tag
  each entry:
  - **(a)** defended by diagnostic-augmented blackbox
  - **(b)** requires internal access; must become a Rust-side unit test
  - **(c)** defended by unaugmented blackbox integration test (as-is)
- For each (a) entry, audit interleavability with cdp-jsonl: does the
  diagnostic event need to be ordered against specific CDP events?
  If yes, decide sequence numbers / timestamps / interleaved-format.
- Implement diagnostic emission in the Node implementation, gated
  only at the sink (uniform emission per decision).
- Augment (a)-bucket blackbox tests with diagnostic assertions.
- Zero-side-effect gate live throughout.

## Acceptance (all three phases together)

- [ ] cdp-jsonl + diagnostic-jsonl schemas exist and are cited from
  the test suite.
- [ ] All `.spec.mjs` tests converted to blackbox CLI form.
- [ ] Baseline HARs (toy_server, example.com) committed as fixtures.
- [ ] Randomized-mode test runner working; double-run gate green.
- [ ] All mutation-catalog entries tagged (a)/(b)/(c) with notes.
- [ ] Diagnostic emission live in Node impl with zero observable
  side-effect per the gate.
- [ ] (a)-bucket tests augmented with diagnostic assertions; all
  green against Node impl.

## What this enables

Once these three phases land, the blackbox suite is the language-
agnostic regression gate for the Rust port. Every Rust commit from
`0100` onward lands against a live oracle that exists in only one
form (the same test file, run via subprocess invocation of whichever
binary is current).

## Sequencing relative to other work

- **Depends on:** `~/.claude/sessions.kb/rust-port-kb-scope-refactor.md`
  execution (skeleton crates exist; schema can have its target
  directory). Not a hard blocker — schemas could live transitionally
  at `packages/har-browse/schema/` and migrate at 1300 cutover step.
- **Blocks:** commit `0100` (Rust scaffold) ideally; in practice
  commit `0800` (cdp-jsonl contract freeze) cannot land without the
  schema, so phase C must precede `0800` at minimum.

## Files of record

- Workspace `.claude/decision.kb/` — 12 decisions from 2026-05-21
  meta-planning.
- Workspace `.claude/principle.kb/zero-side-effect-diagnostics.md` —
  workspace-level principle.
- Workspace `.claude/principle.kb/defer-and-runtime-assert.md` —
  promoted from rust-port.kb/decisions.kb/assertion-strategy.md.
- Workspace `.claude/sessions.kb/dev-kb-five-collection-pattern.md` —
  meta-discussion of the kb pattern adoption itself.
- `packages/har-browse/dev.kb/rust-port.md` — Rust port charter.
- `packages/har-browse/dev.kb/rust-port.kb/scope-audit.md` — scope
  audit (kb-shape sibling work).
