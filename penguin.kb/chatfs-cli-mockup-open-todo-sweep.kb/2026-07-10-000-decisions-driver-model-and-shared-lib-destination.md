# 2026-07-10: decisions resolved this session

- **Driver model** (cross-provider-drift's last open item): not
  pipe-vs-delegation either/or. User: a well-decomposed CLI with
  importable generator functions gives both — pipe and delegation
  become thin drivers over the same library. Documentation of this in
  `cli-command-shape.kb/` deferred to the actual unification work
  (Immediate plan step 4).
- **Shared-lib destination**: `$REPO/lib/chatfs/` once libraryized —
  not `packages/chatfs-core/`, and not permanent incubator residence.
