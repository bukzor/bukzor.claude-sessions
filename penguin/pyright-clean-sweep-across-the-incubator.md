---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.chatfs/docs/dev/design-incubators/chatfs-mockup-chatgpt
session:
  uuid: 54fb81a0-4ea5-418c-9c8d-409100faeecb
  started: 2026-07-05T20:43:25-05:00
  ended: null
---
# Pyright-Clean Sweep Across the Incubator

Get `basedpyright .` clean (0 errors, tentatively 0 warnings — see Open
Questions) across the whole chatfs-mockup-chatgpt incubator, following on
from the `chatfs_layout.py` extraction (commit b0665ce, 2026-07-05).

Taskfile: `docs/dev/design-incubators/chatfs-mockup-chatgpt/.claude/todo.kb/2026-07-05-000-pyright-clean-sweep-across-the-incubator.md`

16 errors (bare `dict`/`Mapping` generics, 6 files) fix first, then
~170 warnings in real files (cascading from the same untyped dicts,
expected to partially collapse once typed) addressed file by file with
`TypeGuard`s per house style. `trash/` is out of scope. Each touched
file needs a runtime smoke-test against `chatfs.demo/` data after typing,
since these are splat/render files with real I/O.
