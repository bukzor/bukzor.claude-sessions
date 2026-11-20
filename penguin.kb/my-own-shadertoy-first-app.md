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

## Addenda

`my-own-shadertoy-first-app.kb/` holds one dated write-up per session
that picked this entry up: its findings, rulings, and process notes.
`ls` gives the timeline.
