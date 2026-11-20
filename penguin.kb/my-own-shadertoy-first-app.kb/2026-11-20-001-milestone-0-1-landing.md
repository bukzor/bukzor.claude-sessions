# Findings (0.1-landing session 3443f841, 2026-11-20)

- Commits 4a3d8ad, c32ceab, 90cbfab, pushed. 0.1 is "Landed."
- Rulings: package `gpu/device` (not `device-and-adapter`, `init`,
  `get`, `webgpu`); REPO_SCOPE: packages private by default and named
  `@repo/...`, the root included. ERROR_HANDLING is agent-signed and
  awaiting bukzor's ruling (todo item).
- Error design bukzor wrote: `UncapturedGPUError` rethrown from an
  `uncapturederror` listener (with `preventDefault()`), and `init()`
  returns `lost`, a promise rejecting with `DeviceLostError`; callers
  opt out by catching it. bukzor rejected a library-side filter for
  `reason: "destroyed"` as an app assumption.
- The gpu-info page's demos call WebGPU (`createBuffer`, `destroy`,
  `addEventListener`) from `apps/`. At milestone 1.2 that trips
  DEPENDENCY_DIRECTION's lint-rule tripwire; the demos then move or
  get the rule's exemption.
- Process miss: the first-task trigger's consolidation check was not
  run at session start; caught at session end and queued as a todo
  suggestion.
- `lib/ci/check` runs pre-commit `--all-files`, which covers tracked
  files only: a new package goes unchecked until it is added.
