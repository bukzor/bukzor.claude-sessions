---
cwd: /home/bukzor/claude/mitmproxy
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 96ac8230-11fe-4052-a934-f6b3f839a988
  started: 2026-08-09T10:23:52-05:00
  ended: null # set only when no more sessions are expected (~= about to delete this file) -- not "my conversation ended"
---
# Masks as Template Rules

Replace `incidents._VOLATILE_SUBS` (4 hand-written, unvalidated regexes) with
declarative template rules in the same format as the system-prompt patches, so
the capture digest quotients out session noise (adddirs items, memory paths,
bg-job tmp path, `[1m]` / `(1M context)` markers) and a broken mask is caught
offline instead of failing silent-and-open. Tier 2 adds a survey-only
block-strip rule set feeding a "core digest" column so the recurring promotion
survey stops needing hand-diffs.

Taskfile: `/home/bukzor/claude/mitmproxy/.claude/todo.kb/2026-08-09-000-Masks-as-template-rules--quotient-session-noise-from-capture-digests.md`

- [x] Tier 1: masks as template rules, `_VOLATILE_SUBS` deleted
- [x] Tier 2: survey core-digest column, block flags *are* the rule names

Both landed 2026-08-09; see the taskfile's Outcome section. Remaining
follow-on lives on the project's `.claude/todo.md`: the proxy still has to
be restarted before the new masks take effect, and until then it keeps
minting old-scheme duplicate captures for `rekey_captures.py --apply` to
clear.
