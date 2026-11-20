---
cwd: /home/bukzor/repo/github.com/bukzor.sandbox/sandbox-repo.kb/github.com/bukzor-sandbox/my-own-shadertoy
session:
  uuid:
    - 634afc3c-6a0f-4d42-afe2-6a4585ddd72a
    - fb592418-515b-4a49-a900-79cbfb528d9d
    - 18a39fbc-a96f-4090-ac5f-3b75a72a396f
    - 1b724c86-a63b-441f-841e-b31826d224e4
    - ffde79d7-bd91-43d9-94a2-3c936553cd70
    - 83f86b54-e0ba-4634-91e2-d3ea99d42343
    - 3443f841-6341-49b3-a26f-7396c71f798c
  started: 2026-10-27T11:34:03-05:00
  ended: null
---
# my-own-shadertoy -- first app on the finished toolchain

A compute-first WebGPU Shadertoy-alike whose purpose is bukzor learning
WebGPU and GPGPU programming. Day one built only the tooling: a pnpm
workspace, oxlint and oxfmt on TypeScript 7, a toolchain selftest, and
pre-commit as the whole of CI (`lib/ci/check`). The second session
(fb592418) designed the project and filed it as a claim ledger in
`docs/dev/claims.kb/`. Session 18a39fbc settled the ledger, then bukzor
built milestone 0.1 by hand in `apps/bukzor-shadertoy` (Vite,
multi-page under `src/pages/`). Session 3443f841 landed it: the device
comes from the first kept package, `@repo/gpu-device`, and the
gpu-info page shows adapter and device side by side, plus two
permanent expected-error demos.

## Where things are

- Design: `docs/dev/claims.kb/design.md`. Roadmap:
  `docs/dev/claims.kb/design.kb/deliverables.kb/milestone-ladder.md`.
- Who writes what: the root `CLAUDE.md` and each lifetime group's `CLAUDE.md`.
  In the kept groups (program, gpu, passes) Claude writes only what is
  directly asked, and declines first uses of the API.
- `bin/new-package GROUP/THING 'job'` stamps a package.
- Occasion-bound claims (tripwires, recall, consolidation) fire from the
  repo's trigger bank, `.claude/must-read.kb/`; the root `CLAUDE.md` has
  every session list it.
- Recall items are checkbox items in the repo's `.claude/todo.md`: added
  unchecked at session end, checked off when written cold (1b1897f).

## Findings (evaluation session, 2026-10-27)

- The CI loop is fast: lint 0.4s, typecheck 0.5s, selftest 2s, the
  whole `lib/ci/check` about 6s warm; the GitHub run took 29s.
- Fail-loud verified by probe: a workspace with no `tsconfig.json`
  fails `pnpm typecheck` with exit 1.
- Fixed: the oxlint hook skipped commits that touched only its config
  (commit 3695bfe). Residual local/CI divergence: a `.gitignore` edit
  can change what oxlint sees; only CI's `--all-files` run catches
  that. Judged too rare for a rule.
- The owner is watching the toolchain-to-product ratio.

## Findings (design session fb592418, 2026-10-27)

- TypeScript 7's DOM lib declares the WebGPU types, so `@webgpu/types`
  is unneeded and dependency scoping cannot keep WebGPU out of `ui/`.
  Instruction and review hold that line; a lint rule is a tripwire.
- A stamped package's empty `src/index.ts` fails lint (no-empty-file)
  until it holds code. That is deliberate.
- A cold-reader agent on a clean clone found the design and roadmap
  without the skills installed (fixed in f7c43ed: roadmap pointer, done
  marker).

## Findings (ruling session 18a39fbc, 2026-11-13)

- bukzor ruled that agent-signed claims are tentatively accepted unless
  there is a good reason not to. All 16 were promoted to `standing: user`
  (cef8d9c), and Vite was explicitly approved. The 40-line cap and
  `no-console` stay as they are.

## Findings (review and trigger-bank session 1b724c86, 2026-11-15..20)

- Commits 509ca6b (describeSet refactor), 5a4a6da (six tripwires), 6d379ac
  (the trigger bank and its ledger adjustments), pushed.
- A bank is listed from the directory of the `CLAUDE.md` holding its stanza,
  never the session cwd; `llm-must-read-ls` reading only its argument is
  right. Parent banks cascade through ancestor `CLAUDE.md` loading, so the
  script needn't walk up (that would double-list `~`).
- `git commit-files ... -- -F -` drops stdin ("empty commit message"); use
  `-F <file>`.

## Findings (WebGPU-object review session ffde79d7, 2026-11-15..20)

- Commit df8e6e6, pushed: `describeObject` rejects iterables at the type
  level. Rulings: sets and objects are routed by static type, never by a
  runtime `Symbol.iterator` check; `constructor.name` over
  `Symbol.toStringTag`; function-valued properties are not filtered out.
- Recall from 509ca6b: item 1 half right (missed why the linter wants
  `void`), item 2 right, item 3 rejected by bukzor as presupposing its
  answer. df8e6e6 carries the miss forward and recasts item 3.
- The bank fired, but mid-session, when the root `CLAUDE.md` gained its
  stanza; `git rev-parse --show-toplevel` found it from the app subdirectory.

## Findings (recall session 83f86b54, 2026-11-20)

- Recall from df8e6e6: c right; a, b, d half right cold, then settled.
  `void` handles nothing: the global `unhandledrejection` handler does.
  `constructor.name` and `@@toStringTag` both come from the Web IDL
  interface identifier.
- Unsorted, `adapter.features` keeps about 80% of its order across reloads
  and swaps the rest in small local clumps: hash-slot order with collisions,
  not insertion order the page could rely on. Sorting stays.
- Commit 1b1897f, pushed: recall moved from commit trailers to `todo.md`,
  because a trailer can't record that recall was done.

## Findings (0.1-landing session 3443f841, 2026-11-20)

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

## Open

The repo's `.claude/todo.md` owns the project's open work.
Occasion-bound items (recall, consolidation, `ASK_BEFORE_EDITING_KEPT`)
fire from its trigger bank instead. Below: only what outlives the repo.

- [x] Check that the trigger bank fires: 83f86b54 (cold start from
      `apps/bukzor-shadertoy`, 2026-11-20) listed it unprompted on its first
      tool call and ran `before/starting-the-first-task-of-a-session.md`.
- [ ] Upstream, bukzor-agent-skills `llm-must-read-kb` "Adoption": `$SCOPE`
      is `.` for a project, which misses the bank when the session starts in
      a subdirectory; it should name the directory holding the `CLAUDE.md`.
- [ ] Upstream, git-partial.prototyping: `commit-files`/`commit-staged`
      don't pass stdin through to `git commit -F -`.
