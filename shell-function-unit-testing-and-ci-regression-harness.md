---
cwd: /home/bukzor
session:
  uuid: 80204f8f-9642-4ed5-90e7-d86ab434788e
  started: 2026-07-07T16:38:28-05:00
  ended: 2026-07-08T08:42:42-05:00
---
# Shell-Function Unit Testing and CI Regression Harness

Build the test harness for `~/.config/sh/functions.d/*.sh` and `~/.profile`:
cross-shell parity runner (dash, busybox ash, bash, zsh), literal regression
tests for the two bugs that shipped silently on 2026-07-06/07 (`path_stdin`
not-found; `${args[@]}`-vs-`${oldargs[@]}`), coverage for `config2lines` /
`hardquote` / `each_config_line` / `path`, an `env -i` .profile smoke test,
and an automatic trigger (GitHub Actions — repo is public — and/or git hook).

Taskfile: `~/.claude/todo.kb/2026-07-07-001-shell-function-unit-testing-and-ci-regression-harness.md`
(requirements only; framework/layout decisions deferred to this session).

DONE 2026-07-08: redo is the harness (user-picked; TAP-runner prototype
deleted). Tests co-locate as `X_test.sh` beside `X.sh` (`.profile_test.sh`
included), `lib/sh/assert.sh` shared, `redo test` fans out the 4-shell
matrix via root `default.tested.do`/`test.do`; both sourcing paths skip
`*_test.sh`. 92/92 assertions green; three regression drills + append
fix observed red-first. Two live bugs fixed: `hardquote` backslash
escaping, `path append` drifted from its first-wins acceptance criteria.
CI: `.github/workflows/check-sh.yml`. Devlog:
`~/docs/dev/devlog/2026-07-08-000-cross-shell-test-harness--redo-as-the-test-runner.md`.

- [ ] verify first `check-sh.yml` run is green on GitHub after push
- [ ] land the harness on `main` (reunify: same-tree convergence,
      see CI-foundations taskfile below)

The harness decision is shared with the reunify-dotfiles effort:
`~/.claude/todo.kb/reunify-dotfiles/2026-07-07-000-CI-and-testing-foundations.md`
runs FIRST in that plan and its survey table includes this file's needs —
decide once, serve both. Background on the code under test:
`~/docs/dev/devlog/2026-07-07-000-shell-PATH-prepend--eliminate-eval-array-emulation-with-a-heredoc-fed-line-iterator.md`.
