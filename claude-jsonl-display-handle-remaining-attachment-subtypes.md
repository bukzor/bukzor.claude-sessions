---
cwd: /home/bukzor
session:
  uuid: db0d1d99-e4d4-49d7-b2e9-1c1f090412a5
  started: 2026-05-16T19:59:56-05:00
  ended: 2026-05-16T20:30-05:00
focus:
  - /home/bukzor/.claude/todo.kb/2026-05-16-001-claude-jsonl-display-handle-remaining-attachment-subtypes.md
  - /home/bukzor/bin/claude-jsonl-display
---
# claude-jsonl-display: Handle Remaining Attachment Subtypes — DONE

Extended `bin/claude-jsonl-display` so all observed non-hook attachment
subtypes (16 in the archive) have a dedicated formatter, mirroring the
`format_hook_attachment` pattern. Landed in four review-sized commits
on `svelte-crostini`:

- 173f9b9 — dispatch table + tier 1 (5 one-line formatters)
- bc44de9 — tier 2 (3 one-line formatters)
- e171f0f — tier 3 (9 one-line formatters)
- 65e774d — expand 5 content-bearing subtypes (edited_text_file,
  nested_memory, file, queued_command, diagnostics) to boxed multi-line
  renders, per user calibration: completeness > brevity.

Final stderr-line deltas on the three reference transcripts vs. HEAD:
-688 / +42 / +329. The diagnostics-collapse savings are mostly
preserved; the rest is full-content expansion.

Brief: /home/bukzor/.claude/todo.kb/2026-05-16-001-claude-jsonl-display-handle-remaining-attachment-subtypes.md
