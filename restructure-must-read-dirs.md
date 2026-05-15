---
cwd: /home/bukzor
---
# Restructure must-read-before.d -> must-read.d/before (archive)

Earlier rename in the same trigger-bank lineage as
`must-read-kb-skill`. Restructured `~/.claude/must-read-before.d/`
into `~/.claude/must-read.d/before/`, enabling the
`must-read.d/after/` sibling pattern for reactive/troubleshooting
triggers.

Procedure preserved at
`~/.claude/CLAUDE.Task.restructure-must-read-dirs.md` (kept as record).

## Completed

- Rename landed in commit `bfdb5cb` (2025-12-11) and the surrounding
  reference updates.
- Subsequently superseded by the .d → .kb rename
  (`must-read-kb-skill`), so paths in the original Task.md now point at
  intermediate-state locations.

## Delete When

The Task.md is no longer worth keeping as a procedural template (the
.d → .kb rename serves that role now).
