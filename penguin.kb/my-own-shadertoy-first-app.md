---
cwd: /home/bukzor/repo/github.com/bukzor.sandbox/sandbox-repo.kb/github.com/bukzor-sandbox/my-own-shadertoy
session:
  uuid:
    - 634afc3c-6a0f-4d42-afe2-6a4585ddd72a
  started: 2026-10-27T11:34:03-05:00
  ended: null
---
# my-own-shadertoy -- first app on the finished toolchain

The sandbox's first day built only engprod: pnpm workspace, oxlint +
oxfmt on TypeScript 7, a 19-case toolchain selftest, pre-commit as the
whole of CI (`lib/ci/check`). `apps/` and `packages/` are empty. The
next session puts a shader on screen, and discovers which engprod is
still missing once code touches WebGL.

## Findings (evaluation session, 2026-10-27)

- The CI loop is fast: lint 0.4s, typecheck 0.5s, selftest 2s, the
  whole `lib/ci/check` about 6s warm; the GitHub run took 29s.
- Fail-loud verified by probe: a workspace with no `tsconfig.json`
  fails `pnpm typecheck` with exit 1.
- Fixed: the oxlint hook skipped commits that touched only its config
  (commit 3695bfe). Residual local/CI divergence: a `.gitignore` edit
  can change what oxlint sees; only CI's `--all-files` run catches
  that. Judged too rare for a rule.
- Not chased: `lib/ci/check` wall time varied between 6s and 55s
  across runs with no change in between; each hook alone stays under
  3s. The owner was wrapping up.
- User's call, flagged not proposed: two lint rules will fight WebGL
  code specifically. The 40-line function cap pushes sequential GL
  setup into artificial splits; `no-console` removes the browser's
  main debugging channel. Both are the stated stance in `CLAUDE.md`.
- The owner is watching the toolchain-to-product ratio ("I'll keep an
  eye on it").

## Open

- [ ] First app under `apps/`: a canvas, a fragment shader, a render
      loop. Decide dev server / bundler (vite is the default guess),
      and how GLSL sources are typed and loaded.
- [ ] Browser-side test runner, if the first app wants one; `node
      --test` serves only the selftest today.
- [ ] Explain or dismiss the 6s-to-55s `lib/ci/check` timing spread.
