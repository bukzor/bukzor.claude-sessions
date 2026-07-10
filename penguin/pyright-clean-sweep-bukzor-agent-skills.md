---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills
session:
  uuid:
    - 83ca2a15-59b7-4653-910e-9ccc0ed643c9
  started: 2026-07-05T23:04:45-05:00
  ended: null
---
# Pyright-Clean Sweep: bukzor-agent-skills

Wire up `basedpyright` at the repo root (mirrors the recently-completed
sweep in `prototype.chatfs/.../chatfs-mockup-chatgpt`,
`~/.claude/sessions.kb/pyright-clean-sweep-across-the-incubator.md`) and
drive `basedpyright .` to clean.

Uncommitted at session start (found in the tree, not yet committed):
root `pyproject.toml` (deps: `basedpyright-as-pyright` via local
`../basedpyright-as-pyright` path source, `pytest`), `.envrc`
(`PYRIGHT=basedpyright`, PATH wiring), `.python-version` (3.13), empty
`README.md`, `.gitignore` +`uv.lock`. `.venv` already has
basedpyright/pyright installed.

Baseline `basedpyright .`: 11 errors, 307 warnings. Errors cluster in
`llm-kb/`:
- `llm-kb/docs/dev/devlog/2025-12-10-000-.../stats-analysis.py`: missing
  `scipy`/`numpy` imports (deps not declared).
- `llm-kb/lib/python/llmd/frontmatter_validate.py`: missing
  `yaml`/`jsonschema`/`referencing` imports (deps not declared); one
  `__str__` override incompatibility.
- `llm-kb/lib/python/llmd/frontmatter_validate_test.py`: implicit
  relative import of `llmd`.

Most errors are missing-dependency errors, not type errors — root
`pyproject.toml` likely needs `pyyaml`, `jsonschema`, `referencing`
(and either add `scipy`/`numpy` or exclude the devlog stats script, cf.
the incubator session's precedent of widening `[tool.pyright]` exclude
for out-of-scope scripts).

## Progress

- `09735d1` -- root uv workspace wiring: `llm-kb` added as a `[tool.uv.workspace]`
  member so `uv sync --all-packages` installs its deps (pyyaml,
  jsonschema, referencing) into the shared root `.venv`; `[tool.pyright]`
  exclude added for build dirs.
- `8a1c417` -- fixed the two real errors in `frontmatter_validate.py`
  (non-exhaustive `__str__` match) and `frontmatter_validate_test.py`
  (implicit-relative `llmd` import → explicit relative).
- `890b601` -- widened the devlog-script exclude to all three one-off
  `uv run --script` analysis files in
  `llm-kb/docs/dev/devlog/2025-12-10-000-.../` (stats/revival/bayesian-analysis.py),
  none type-annotated and none meant to be.

`basedpyright .`: **0 errors, 193 warnings** (down from 11/307).

## Remaining, deliberately deferred — now resolved (2026-07-06, other session)

The concurrent `schema-reuse-with-ref` session (its own sessions.kb entry
has since been deleted -- fully absorbed into
`llm-kb/.claude/todo.kb/2026-02-09-000-schema-reuse-with-ref.md`, per
that collection's own lifecycle) picked up exactly the deferred typing
pass once its `$ref` work settled:

- Full parameter/return type annotations across
  `frontmatter_validate.py` and its test.
- Isolated all `jsonschema`-touching code into a new
  `_jsonschema_adapter.py` (jsonschema ships no `py.typed`; basedpyright
  was actually falling back to a *stale bundled community stub*, not
  just "no types" -- e.g. it referenced a `_JsonParameter` type that
  doesn't exist in the installed 4.26 API).
- Added `typings/jsonschema/` at repo root (pyright's default
  `stubPath`) with a small local stub covering just the names this repo
  touches (`Draft202012Validator`, `TypeChecker`, `extend`,
  `protocols.Validator`) -- takes precedence over the bundled one.
- `bin/llm.kb-validate` -- previously a symlink straight to
  `frontmatter_validate.py` (per
  `docs/adr/2025-12-09-003-lib-python-pattern-for-testable-skill-scripts.md`)
  -- became a real bash launcher running
  `python -m llmd.frontmatter_validate`, once the module gained internal
  sibling imports that a parentless script can't satisfy.
  `frontmatter_validate.py` and `_jsonschema_adapter.py` both keep plain,
  ordinary relative imports throughout; no special-casing needed once
  the entry point itself runs the module correctly.

Devlog:
`llm-kb/docs/dev/devlog/2026-07-05-001-pyright-clean-frontmatter-validate.md`.
Follow-up todo for filing an upstream fix against the stale bundled
stub: `llm-kb/.claude/todo.kb/2026-07-05-001-upstream-jsonschema-typeshed-stub-fix.md`.

**Current state: `basedpyright` (repo root, whole tree) reports 0
errors, 0 warnings, 0 notes.** No further typing work outstanding on
this file. If this session's own baseline check disagrees, re-run
`basedpyright` fresh against current HEAD.
