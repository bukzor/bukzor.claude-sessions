Part of `../har-browse-rust-port-pre-port-infrastructure.md`.

# 2026-05-21: constraints decided in meta-planning

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
