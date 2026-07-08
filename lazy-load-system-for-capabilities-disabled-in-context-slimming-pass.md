---
cwd: /home/bukzor/claude/empty
session:
  uuid: 035c875c-c3dc-46d2-a612-a5cfab5ea5dd
  started: 2026-07-07T11:42:33-05:00
  ended: 2026-07-08T17:07:22-05:00
---
# Lazy-Load System for Capabilities Disabled in Context-Slimming Pass

Restore capabilities disabled in the 2026-07-07 context-slimming pass (50k+
tokens/message saved) without regaining the bloat. Done: Monitor + SendMessage
un-denied in `~/.claude/settings.json` (committed, alongside the rest of the
2026-07-07 slimming pass which had sat uncommitted); their descriptions
slimmed in transit by `~/claude/mitmproxy/toolpatch.py` (patches in
`~/.claude/tool-description-patches.d/`, drift tripwire against
`upstream.md`/`upstream.d/*.md`); Monitor guidance moved to
`must-read.kb/before/using-claude-code-tool/Monitor.md`.

Follow-up hardening, same session: both `toolpatch.py` and `syspatch.py`
used to snapshot their patch directories once at mitmproxy startup, so
editing `*-patches.d/` under a live proxy produced stale/ghost incidents
(a real one hit mid-session: `tooldesc-SendMessage`). Fixed by deleting the
cache — both addons now call `load_patches()`/`load_tool_patches()` fresh
inside `_request()`; patch directories are small and requests are
human-paced, so re-reading costs nothing measurable. No more restart-before-
trusting-warnings step. See `~/claude/mitmproxy/CLAUDE.kb/patches-reread-per-request.md`
and the design invariant this session added,
`~/claude/mitmproxy/design/040-design.kb/exact-compare-tool-stubs.md` (why
tool-description patching is whole-replacement + byte-equality against an
accepted upstream set, not the template-placeholder model `syspatch.py` uses
for the system prompt).

mitmproxy working tree still holds the addon changes uncommitted (per its own
`git-caution: personal` — user hasn't asked for that commit). `~/.claude`'s
matching pieces (settings.json, tool-description-patches.d/, the Monitor
must-read entry, this file) were committed this session.

Remaining follow-ups in the taskfile (all open, none urgent): verify
project-scope `disableBundledSkills` override semantics; consider extending
toolpatch to other fat tools (Bash, Agent); update stale
`must-read.kb/before/lazy-loading/{skills,commands}.md`; SendMessage's ~1.5k
hidden token footprint outside its description (a syspatch target, not yet
investigated); TaskStop stays denied (persistent Monitors uncancellable —
open tradeoff).

Taskfile: ~/.claude/.claude/todo.kb/2026-07-07-000-lazy-load-system-for-capabilities-disabled-in-context-slimming-pass.md
