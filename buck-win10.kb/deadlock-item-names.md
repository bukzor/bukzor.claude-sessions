---
cwd: /home/bukzor/claude/deadlock
session:
  uuid:
    - 85fd0b8a-9dbf-45cf-bfcc-a424f3ece237
  started: 2026-11-25T16:19:16+00:00
  ended: 2026-11-25T17:15:00+00:00
---
# Deadlock: in-game item names, and data follows the install to 6868

The owner asked for item names: "Lucky Shot" showed only as
`upgrade_critshot`. The session coordinated four sub-agent units
(Skill(subagent-handoffs)):

- `data/gamedata.tsv/items.tsv` has an English `name` column, from
  `citadel_gc_mod_names_english.txt` (`5b511de`, cleaned up in `6a59074`).
- The data follows the install from build 6864 to 6868 (`0e06662`). The
  patch changed only DLL facts and 11 convars; no gamedata view changed.
  First, `6f42736` fixed redo failing on DLLs that a patch removed
  (dbghelp, symsrv).
- A doc follow-up landed in `87bf066`.

Plan: /home/bukzor/claude/deadlock/.claude/todo.kb/2026-11-25-000-item-names.md

State: every unit is done. Awaiting the owner's review: the plan's "Awaiting
review" list, which includes whether to squash the repair commits before
pushing. After that, close it: `git rm -r` the `.kb/` and its schema.

Follow-up: ability names, the same pattern (`.claude/todo.md` in the repo).
