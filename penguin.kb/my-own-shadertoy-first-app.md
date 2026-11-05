---
cwd: /home/bukzor/repo/github.com/bukzor.sandbox/sandbox-repo.kb/github.com/bukzor-sandbox/my-own-shadertoy
session:
  uuid:
    - 634afc3c-6a0f-4d42-afe2-6a4585ddd72a
    - fb592418-515b-4a49-a900-79cbfb528d9d
  started: 2026-10-27T11:34:03-05:00
  ended: null
---
# my-own-shadertoy -- first app on the finished toolchain

A compute-first WebGPU Shadertoy-alike whose purpose is bukzor learning
WebGPU and GPGPU programming. Day one built only the tooling: a pnpm
workspace, oxlint and oxfmt on TypeScript 7, a toolchain selftest, and
pre-commit as the whole of CI (`lib/ci/check`). The second session
(fb592418) designed the project and filed it as a claim ledger in
`docs/dev/claims.kb/`. No WebGPU code exists yet. The next step is
milestone 0.1, and bukzor writes it by hand.

## Where things are

- Design: `docs/dev/claims.kb/design.md`. Roadmap:
  `docs/dev/claims.kb/design.kb/deliverables.kb/milestone-ladder.md`.
- Who writes what: the root `CLAUDE.md` and each lifetime group's `CLAUDE.md`.
  In the kept groups (program, gpu, passes) Claude writes only what is
  directly asked, and declines first uses of the API.
- `bin/new-package GROUP/THING 'job'` stamps a package.

## Findings (evaluation session, 2026-10-27)

- The CI loop is fast: lint 0.4s, typecheck 0.5s, selftest 2s, the
  whole `lib/ci/check` about 6s warm; the GitHub run took 29s.
- Fail-loud verified by probe: a workspace with no `tsconfig.json`
  fails `pnpm typecheck` with exit 1.
- Fixed: the oxlint hook skipped commits that touched only its config
  (commit 3695bfe). Residual local/CI divergence: a `.gitignore` edit
  can change what oxlint sees; only CI's `--all-files` run catches
  that. Judged too rare for a rule.
- User's call, flagged not proposed: two lint rules may fight GPU setup
  code. The 40-line function cap pushes sequential setup into
  artificial splits; `no-console` removes the browser's main debugging
  channel. Both are the stated stance in `CLAUDE.md`.
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

## Awaiting bukzor's veto

Agent-signed claims and defaults stand unless vetoed. Find them with
`grep -rl '^standing: agent' docs/dev/claims.kb/`. The ones most worth
a look:

- [ ] Veto or keep: the `components` rung is dropped (`design.md`).
- [ ] Veto or keep: end-of-session recall of three things (`RECALL`).
- [ ] Veto or keep: a consolidation session every 3-4 feature sessions.
- [ ] Veto or keep: Vite as dev server; no UI framework (`packages/ui/CLAUDE.md`).
- [ ] Veto or keep: package names on the milestone ladder (first guesses).

## Open

- [ ] Milestone 0.1, bukzor's: adapter and device, limits, device loss,
      uncaptured errors on the page, served by Vite from `apps/toy`.
- [ ] Decide whether Claude's edits to kept groups prompt for
      permission (open claim `ASK_BEFORE_EDITING_KEPT`, settled by experience).
- [ ] How WGSL sources are typed and loaded (arises at milestone 1.1).
- [ ] Browser-side test runner, if the app wants one; `node --test`
      serves only the selftest today.
- [ ] Explain or dismiss the 6s-to-55s `lib/ci/check` timing spread.
