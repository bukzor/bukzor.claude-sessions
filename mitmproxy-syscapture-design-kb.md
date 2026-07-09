---
cwd: /home/bukzor/claude/mitmproxy
session:
  uuid: 5b433884-d046-4d82-971f-a98248290a5c
  started: 2026-07-07T15:08:20-05:00
  ended: 2026-07-08T08:30:00-05:00
---
# mitmproxy: syscapture, v2.1.202/203 triage, design/ kb

Repo survey turned into three lines of landed work: placeholder
backreference semantics (same name = same text; `$LINES1`/`$LINES2`
convention), the `syscapture.py` addon (pristine pre-patch prompt
capture, fixing the contaminated-fixture pipeline), and a
`Skill(llm-design-kb)` why-chain under `design/` plus
`check_dark_patches.py` (sweeps the silent-match-miss blind spot).
Also triaged the 2026-07-08 incidents: SDK-entrypoint title requests
exempted, v2.1.202/v2.1.203 fixtures promoted. All committed and
pushed on `main`.

Project-local follow-ups live in the repo's `.claude/todo.md` and
`.claude/ideas.kb/` (jsonl2sysprompt.sh disposition; v2.1.202
new-section bloat review; addon-level tests, now with two seeds in
`trash/`).

Cross-session:

- [ ] The parallel toolpatch session's work (toolpatch.py,
  check_tool_patches.py, incidents.py refactor, README/proxy.sh/kb
  edits) was uncommitted and live as of 2026-07-08T08:30-05:00 --
  verify it landed; my README tooling-entry placement rides in its
  pending diff. Delete this entry once it has.
