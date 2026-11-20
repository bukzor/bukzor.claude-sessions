---
cwd: /home/bukzor/repo/github.com/bukzor.sandbox/sandbox-repo.kb/github.com/bukzor-sandbox/my-own-shadertoy
session:
  uuid:
    - 634afc3c-6a0f-4d42-afe2-6a4585ddd72a
    - fb592418-515b-4a49-a900-79cbfb528d9d
    - 18a39fbc-a96f-4090-ac5f-3b75a72a396f
    - 1b724c86-a63b-441f-841e-b31826d224e4
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
began milestone 0.1 by hand in `apps/bukzor-shadertoy` (Vite,
multi-page under `src/pages/`): adapter info, features and limits are
on the page. The device, device loss, and uncaptured errors remain.

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
- Recall items are `Recall:` trailers on the increment's commit (latest:
  509ca6b); `before/starting-the-first-task-of-a-session.md` finds them.

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

## Open

The repo's `.claude/todo.md` owns the project's open work.
Occasion-bound items (recall, consolidation, `ASK_BEFORE_EDITING_KEPT`)
fire from its trigger bank instead. Below: only what outlives the repo.

- [ ] Check that the trigger bank fires: next session should list it
      unprompted and run `before/starting-the-first-task-of-a-session.md`
      (recall from 509ca6b). If not, the root `CLAUDE.md` stanza needs work.
- [ ] Upstream, bukzor-agent-skills `llm-must-read-kb` "Adoption": `$SCOPE`
      is `.` for a project, which misses the bank when the session starts in
      a subdirectory; it should name the directory holding the `CLAUDE.md`.
- [ ] Upstream, git-partial.prototyping: `commit-files`/`commit-staged`
      don't pass stdin through to `git commit -F -`.
