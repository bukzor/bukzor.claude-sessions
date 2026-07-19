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

## Addenda

Dated pickup write-ups (2026-07-05 through 2026-07-06) moved to
`pyright-clean-sweep-bukzor-agent-skills.kb/` — one file per addendum,
`ls` for the full chronological list. Latest: 2026-07-06, `basedpyright`
(repo root, whole tree) reports 0 errors, 0 warnings, 0 notes — no
further typing work outstanding.
