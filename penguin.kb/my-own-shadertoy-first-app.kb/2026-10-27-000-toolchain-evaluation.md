# Findings (evaluation session, 2026-10-27)

- The CI loop is fast: lint 0.4s, typecheck 0.5s, selftest 2s, the
  whole `lib/ci/check` about 6s warm; the GitHub run took 29s.
- Fail-loud verified by probe: a workspace with no `tsconfig.json`
  fails `pnpm typecheck` with exit 1.
- Fixed: the oxlint hook skipped commits that touched only its config
  (commit 3695bfe). Residual local/CI divergence: a `.gitignore` edit
  can change what oxlint sees; only CI's `--all-files` run catches
  that. Judged too rare for a rule.
- The owner is watching the toolchain-to-product ratio.
