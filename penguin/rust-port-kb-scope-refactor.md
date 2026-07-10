---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.chatfs/packages/har-browse
session:
  uuid:
    - dd02760b-ca22-4ba3-a921-8db5cc0fd7ba
  started: null
  ended: null
prior-sessions:
  - uuid: 8eb1d4e4-f6ef-4356-a1f9-196748934a4e
    started: 2026-05-21T10:46:43-05:00
    ended: 2026-05-21T12:31:28-05:00
    summary: |
      Meta-planning for the broader Rust port (testing strategy, kb
      pattern adoption). Evolved Q1 (schema home → `schema/` directory,
      not design.kb/) and Q3 (rename safe→whitehat + reframe threat-model
      as decision+consequence — layered on top of the planned 4-facet
      promotion, not replacing it).
      See sibling
      `~/.claude/sessions.kb/har-browse-rust-port-pre-port-infrastructure.md`
      and workspace `.claude/decision.kb/` for the new decisions.
---
# rust-port kb scope refactor

Scope-refactor of `packages/har-browse/dev.kb/rust-port.{md,kb}/` (15
commit docs + 6 decisions + 5 facts + 3 procedures + handoffs +
charter). The work is workspace-spanning (creates new sibling crates
`playwright-lite` and `har-browse-rs`), so the kb is geographically
misplaced and most files span multiple scope-homes.

Prior attempt failed (container-thinking, no per-file content audit);
postmortem at
`~/.claude/skills/llm-kb/docs/dev/case-studies.kb/2026-05-13-000-har-browse-rust-port-scope-refactor.md`.

## State

- **Audit complete** at `packages/har-browse/dev.kb/rust-port.kb/scope-audit.md` (workspace root: `prototype.chatfs/`).
- **All open questions resolved** (Q1-Q4; see below).
- **Stress-test pass complete** (Advocate/Skeptic/Arbiter protocol against the plan; 3 corrections applied, 4 confirmations).
- No moves, no commits, no skeleton dirs created yet. Awaiting go-ahead for execution step 1 (skeletons).

## Resolved questions

- **Q1 — JSONL schema location:** Capture JSONL = JSONL-ified CDP stream emitted by har-browse. **BB1 ≡ har-browse at project scope**; the spec lives at `packages/rs-har-browse/schema/cdp-jsonl.jsonschema.yaml`. Workspace design.kb just records the identity statement.
  - **Updated 2026-05-21:** schema home is `packages/rs-har-browse/schema/` (not `design.kb/`) per `.claude/decision.kb/schema-home-and-naming.md` and `.claude/decision.kb/bb1-is-har-browse.md`. Stem-matching filename convention (`<stem>.jsonschema.yaml` validates `<stem>.jsonl`). Diagnostic events go in a *separate* stream with its own schema (`.claude/decision.kb/separate-diagnostic-stream.md`).
- **Q2 — Defer + runtime-assert pattern:** Reframed as "if you defer, leave a tripwire" → workspace-level policy. New `docs/dev/technical-policy.kb/policy-defer-with-runtime-assertion.md`. Three concrete instances stay as `packages/rs-playwright-lite/design.kb/known-limitations.md` (each cites the WS-pol).
  - **Updated 2026-05-21:** also recorded at `.claude/principle.kb/defer-and-runtime-assert.md` (role-keyed kb adoption — same content, different audience). Either home, or both, is acceptable; cross-link required.
- **Q3 — Threat-model reconciliation:** Promote existing `policy-safe-automation-boundary.md` to `.md`+`.kb/` pair. The kb holds **4 facets** (post stress-test reduction from 5):
  - `consent-via-explicit-sync.md`
  - `headed-only-with-human-terminator.md`
  - `no-bot-detection-evasion.md` (encompasses auth-via-cookie framing)
  - `per-mount-profile-isolation.md`
  - **Updated 2026-05-21:** the policy file is *also* renamed to `policy-whitehat-automation-boundary.md` ("safe" too ambiguous; "whitehat" specifies the non-adversarial security stance — see `.claude/decision.kb/rename-safe-to-whitehat-automation-boundary.md`). Separately, the rust-port-side `threat-model.md` is reframed as decision+consequence (see `.claude/decision.kb/interactive-single-user-usage.md`) — this is the har-browse-package-side framing, sibling to the workspace-policy 4-facet promotion, not a replacement.
- **Q4 — Package directory naming:** `rs-`/`py-`/`js-` prefix on the directory; **bare crate name** in `Cargo.toml`. Apply to new packages only; existing-package sweep (`chatfs-fuser`, etc.) deferred to a separate decision. Record as workspace ADR. New skeletons: `packages/rs-playwright-lite/`, `packages/rs-har-browse/`.
  - Confirmed 2026-05-21 at `.claude/decision.kb/rs-dir-prefix-no-crate-prefix.md`.

## Stress-test corrections (Advocate/Skeptic/Arbiter)

Applied against the prior plan:

- **DKM (design.kb migration timing):** changed from "move at commit 0700" to **"move at commit 1300 sweep."** Until then, the design.kb for har-browse lives at the live Node package (`packages/har-browse/design.kb/`). Commit 0750 writes JSONL schema there, not in the empty rs-har-browse skeleton.
- **DES (delete emptied sources):** changed from "delete after promotions" to **"stub-until-sweep."** Leave one-line redirect stubs in emptied `facts.kb/`/`decisions.kb/` files. Wholesale rm-rf at 1300 cleans them up.
- **FACETS:** 5 → 4 (Q3 above).

Confirmations (stood after stress-test): BBH (BB1≡har-browse), WAL (workspace-root `dev.kb/`; document considered alternative `docs/dev/design-incubators/rust-port/` in the work-area ADR), ESN (empty skeletons now), CHARTER stays transient.

Propagated assumption corrections:

- "Move artifact when its container appears" was wrong default → move when its **owner** changes.
- "If content is fully moved, file is safe to delete" → keep stubs as safety net during iteration.
- "Every distinct framing is its own facet" → facets need independent citability, not mere distinct framing.

## Pending execution

Adjusted from audit's "Sequencing" section with the stress-test corrections:

1. **Create empty skeletons** for `packages/rs-playwright-lite/` and `packages/rs-har-browse/` (CLAUDE.md, README.md, empty `design.kb/`, `dev.kb/`, `adr/` — design.kb/ stays empty until 1300).
2. **Create workspace-root `dev.kb/`** with CLAUDE.md.
3. **Write promoted durable docs:**
   - `docs/dev/adr/2026-MM-DD-port-har-browse-to-rust.md`
   - `docs/dev/adr/2026-MM-DD-polyglot-package-dir-naming.md`
   - `docs/dev/adr/2026-MM-DD-rust-port-work-area-location.md` (records the workspace `dev.kb/` choice + considered alternatives)
   - `docs/dev/background.kb/rust-chromium-automation.md`
   - `docs/dev/background.kb/chrome-headed-gotchas.md`
   - `docs/dev/technical-policy.kb/policy-defer-with-runtime-assertion.md` (Q2)
   - **Promote** `docs/dev/technical-policy.kb/policy-safe-automation-boundary.md` to `.md`+`.kb/` pair with 4 facets (Q3)
   - `packages/rs-playwright-lite/design.kb/two-crate-split.md`
   - `packages/rs-playwright-lite/design.kb/out-of-scope.md`
   - `packages/rs-playwright-lite/design.kb/known-limitations.md` (3 deferred items, each cites the WS-pol)
   - `packages/rs-playwright-lite/adr/2026-MM-DD-dependency-choices.md`
   - `packages/rs-playwright-lite/adr/2026-MM-DD-vendor-default-flags.md`
   - `packages/rs-playwright-lite/dev.kb/known-issues.md`
   - (HBR-specific durable docs created at 1300 sweep, when the existing har-browse design.kb moves.)
4. **Move work-area** from `packages/har-browse/dev.kb/rust-port.{md,kb}/` → workspace-root `dev.kb/rust-port.{md,kb}/`.
5. **Update commit-docs' `Refs:`** to point at the new permanent homes.
6. **Stub emptied source files** in old `facts.kb/`/`decisions.kb/` with one-line redirects (do not delete).
7. **Refresh `documentation-conventions.md` table** (do this once, at the end, not mid-iteration).
8. **Update discoverability:** `packages/har-browse/dev.kb/CLAUDE.md` to remove rust-port mention; root + package `CLAUDE.md` pointers to new homes.
9. **Commit 1300 sweep** (later, when commit lands): move `packages/har-browse/design.kb/` → `packages/rs-har-browse/design.kb/`; remove old `packages/har-browse/`; wholesale rm-rf the transient work-area.

## Constraint

Must land before commits `0750`/`1000`/`1050` write durable contracts —
those need a target home decided. Per Q1: 0750's target is the live
`packages/har-browse/design.kb/`, which moves to `rs-har-browse/` at 1300.

## Files of record

- `prototype.chatfs/packages/har-browse/dev.kb/rust-port.kb/scope-audit.md` — the per-file scope audit (the deliverable).
- `~/.claude/skills/llm-kb/docs/dev/case-studies.kb/2026-05-13-000-har-browse-rust-port-scope-refactor.md` — postmortem from prior failed attempt.
- `~/.claude/must-read.kb/when/evaluating-a-contested-or-subjective-position.md` — protocol used for stress-test.
