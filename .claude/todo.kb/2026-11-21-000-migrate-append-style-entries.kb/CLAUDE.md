# Sub-agent handoffs for migrating append-style session entries

Each file here is one sub-agent's unit of work toward the parent plan,
`../2026-11-21-000-migrate-append-style-entries.md`. It carries both
directions of the handoff: the coordinator's brief, then the agent's own
record and report. Belongs here: work one agent can finish in one sitting
(≤60 min), scoped to named files. Does not belong: the entry conventions
themselves (Skill(llm-sessions)), or work spanning waves (split it).

A handoff file holds only what has no other home: what the unit was asked,
how far it got, what it chose and still doubts.

## Protocol

1. The coordinator writes the file before launch: frontmatter
   `required-reading:`, a **Problem Statement** with the scope as a file
   list. The launch prompt is only "do the task in {{path}}".
2. The agent works from the file and keeps it current: **Steps** as
   checkboxes, `[~]` on starting one and `[x]` on finishing it; **Decisions**
   with reasons; **Open Questions**. At the end, a **Final report**: check
   results, deviations from the brief, and anything left inline on purpose.
   `status:` stays `open` while it works; at the end it sets
   `status: done`, commits its unit, and replies with the path only.
3. While open, a later instruction is an in-place edit of the brief, and
   the message is "reread {{path}}". Once done, the file is a frozen record.

## Every agent, every task

- Read first: Skill(llm-sessions) (`~/.claude/skills/llm-sessions/SKILL.md`,
  "Entry shape" governs everything here), Skill(llm-kb)'s
  `references/dated-slug-filename.md`, `~/.claude/sessions.kb/CLAUDE.md`,
  then the brief's `required-reading:`.
- Exemplar of the target shape:
  `~/.claude/sessions.kb/penguin.kb/my-own-shadertoy-first-app.md` and its
  `.kb/`. Its `.kb/CLAUDE.md` still names a removed section; unit 006 fixes
  that, so copy its shape, not that sentence.
- The migration, per entry:
  - Each section that records one pickup (a sitting, session, dated
    status, addendum, dated bold-led paragraph) becomes one file
    `$slug.kb/YYYY-MM-DD-NNN-slug.md`, dated the day that pickup ran,
    `NNN` from `000` per day, continuing any existing numbering. Its first
    line is a `#` heading carrying what the old section heading carried
    (session id, date). Content moves verbatim; edit only what the move
    forces (heading level, a now-wrong relative link).
  - `$slug.md` keeps live status: the summary, where things are, decisions
    still in force, open work. Rewrite its summary paragraph in place where
    it narrated pickups, so it states current state. End it with an
    `## Addenda` section pointing at `$slug.kb/`, as the exemplar does.
  - Every `- [ ]` / `- [~]` / `- [x]` line stays in `$slug.md`, never in an
    addendum: open work is live status; an addendum is a record. If a moved
    section carried open items, lift them into `$slug.md`'s open-work list.
    Count checkbox lines before and after; the counts must match.
  - Leave frontmatter alone.
  - A new `$slug.kb/` gets a `CLAUDE.md` of exactly this shape:

    ```
    # <Entry title> -- Session Addenda

    One dated write-up per session that picked up `../<slug>.md`, per
    Skill(llm-sessions) → Entry shape.
    ```

  - Never add a `Part of ../$slug.md` line to an addendum: it repeats the
    file's own path.
  - A section that is status rather than a pickup record stays. If an
    entry turns out not to be append-style, leave it and say why in the
    Final report.
- Stay inside the brief's file list. Sibling agents run concurrently on
  other entries; never edit theirs or the parent plan.
- Commit with `git -C ~/.claude/sessions.kb commit-files PATHS -- -m MSG`
  (paths: your entries' `.md` and `.kb/`, plus your handoff file), ending
  the message with
  `Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>`. Siblings share
  the index: never commit bare, never stage or commit outside your scope.
  On an `index.lock` collision, retry. Do not push; the coordinator does.
- Finish with `llm.kb-validate` on each touched entry `.md` and `.kb/`
  (run from `~/.claude/sessions.kb`), clean.
- Bash runs under `set -euo pipefail` with `set -x` tracing; begin
  commands with `set +x` when the trace is noise.
- Scratch goes in `~/.claude/sessions.kb/trash/`.
- The brief (frontmatter, Problem Statement) is the coordinator's; edit
  only your own sections, in place, ≤60 lines.
