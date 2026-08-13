# 2026-08-13: a ruling per drifted field

The 2026-05-27 inventory left the decisions open; the corpus kept
growing against them (14 errors across 94 files by today, up from 11 of
28). Each ruling below is now in `~/.claude/sessions.jsonschema.yaml`,
and `llm.kb-validate ~/.claude/sessions.kb` reports 94 files, 0 errors.

`additionalProperties: false` stayed on at every level. That strictness
is the only reason any of this drift was visible; loosening it would
have traded 14 legible errors for silent divergence.

## Adopted

- **`cost-benefit-sweh`** (8 entries) -- rated sessions are a real
  thing: an entry competes for time against the todo backlog, so it
  should rank in the same frame. The inventory's own note said to reuse
  the todo/ideas definition rather than copy it, and that is what
  landed:

      $ref: "skill://llm-subtask/jsonschema/todo.jsonschema.yaml#/$defs/cost-benefit-sweh"

  The definition was one entry deep in llm-subtask's `base.properties`,
  addressable only by a pointer through another schema's internals, so
  it was promoted to that file's `$defs` first -- a pure refactor, same
  effective schema, now nameable. All 8 existing blocks conformed to it
  unmodified, including the `confidence` bands, which is evidence the
  two collections were already rating in one vocabulary.

- **`parent`** (2 entries) -- filename of the entry whose session split
  this work off. Kept on the child alone.

- **`provenance`** (2 entries, renamed from `prior-sessions`) --
  predecessor *runs*, each with uuid, span, and a summary. `parent`
  names a sibling entry; provenance names sessions that may have no
  entry at all, which is why it carries the summary: the transcript is
  often the only other copy, and transcripts expire. The old name said
  "earlier" and left the reader to guess what the field was for.

## Struck

- **`spawned`** (1 entry) -- a parent listing its children, which had
  already drifted: it named one child while two entries named it as
  parent. The link survives on the child side, and the children are
  `grep -l 'parent: <filename>'`. A derived list that nothing derives
  goes stale by construction.

## Data, not schema

- `move-skill-triggers-to-must-read-kb.md` had no `session` block at
  all. Added, `started: null` -- planned work that has not begun, which
  is what null means.

## Schema, not data (a reversal)

Two entries wrote `session.started` as a bare date -- `2026-07-10`,
`2026-05-22`. The plan was to recover the instants from git and fix the
entries. They are not recoverable: `personal-attention-system`'s
transcript is gone and its date comes from a planning file it cites,
and `design-next-kb-v2-refinement` was written on 07-11 recording a
line of work that began 07-10, with no surviving transcript from that
window. Two writers, months apart, wrote a day because a day was what
they knew.

So `started`/`ended` now take an instant, a bare date, or null, via a
`when` definition that says the norm in one place: *record it as
precisely as it is known; writing midnight to satisfy a type records a
time that never happened.* Nothing reads these fields programmatically
(`claude-open-tasks-list` scans for `- [ ]` and `status:` only), so the
widening costs no consumer.

The null description widened with it. It had said null means "planned
but not yet begun"; for an entry that ran and never recorded its start,
that reading is false. Null now means no instant is recorded, most
often because the session has not begun.

## Verification

- `llm.kb-validate ~/.claude/sessions.kb`: 94 files, 0 errors.
- `llm.kb-validate ~/.claude/todo.kb` and the skills repo: unchanged by
  the llm-subtask `$defs` promotion (366 files, 8 errors, all of them a
  peer's pre-existing timestamp typing in `strata.replication.run.kb`).
- Ten crafted cases against the new schema (`trash/check-sessions-schema.py`
  in bukzor-agent-skills): a rating missing `benefit-2w`, a `confidence`
  off the enum, a stray key inside the rating, a `parent` without `.md`,
  a `provenance` item missing its summary or carrying a malformed uuid,
  and a revived `spawned` -- each rejected; the well-formed forms
  accepted. The cross-skill `$ref` constrains rather than silently
  resolving to nothing.

## Left open

The two normalization items on the parent entry (dated-prefix rename
sweep, taskfile retirement) are untouched -- both are corpus-wide
renames, not schema questions.

Three repos hold the edits, because two entries under `penguin.kb/` are
symlinks into `2026-05-19--task-archeology`: the schema in
`/home/bukzor`, the entries in the `sessions.kb` submodule, and
`backlog-triage-with-cost-of-delay.md` (the `spawned` strike) in that
third repo.
