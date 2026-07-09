---
cwd: /home/bukzor/claude/cultist-simulator
session:
  uuid: 522decb7-98c4-470d-ae0d-9769676d9b39
  started: 2026-06-30T21:00:31-05:00
  ended: 2026-06-30T23:14:13-05:00
---
# Implement default.unity3d.d.do Extraction

Write a redo build target that extracts every decodable object from
`data.unity3d`/`datapack.unity3d` (UnityFS bundles inside the Cultist
Simulator APK) into per-object files, keyed by `(internal_file, PathID)`,
then wire it into `all.do`. Design phase is done (heavy UnityPy research
already happened); what's left is writing the extractor script + `.do`
file and testing end-to-end.

Taskfile: `/home/bukzor/claude/cultist-simulator/.claude/todo.kb/2026-06-30-000-implement-defaultunity3dddo-extraction.md`
