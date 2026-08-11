---
cwd: /home/bukzor/claude/mitmproxy
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 96ac8230-11fe-4052-a934-f6b3f839a988
    - 37b1590a-e2d9-46d6-8cba-35b08d158154
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

Both landed 2026-08-09; see the taskfile's Outcome section. Both stated
follow-ons are discharged: the proxy was restarted 2026-08-10, and
`rekey_captures.py` is gone — the identity/equivalence split (`38413ac`)
made a rekey unrepresentable, since captures are now named by their raw
digest and no mask edit can rename one.

Continued 2026-08-10 (same taskfile, past its acceptance): formalized the
keying rules as a claims ledger plus `check_laws.py` (`221fd7a`), which is
what exposed `$...BLOCK` overrunning its section on a fifth of the corpus;
that construct is deleted (`c84e683`). Narrative:
`/home/bukzor/claude/mitmproxy/session.kb/2026-08-10-block-hole-ran-past-its-section.md`.

Open work is on the project's `.claude/todo.md`, chiefly the same defect
class found live in `# Session-specific guidance`
(`.claude/todo.kb/2026-08-10-000-Session-specific-guidance-bullets-are-unruled-core-digest-noise.md`).
