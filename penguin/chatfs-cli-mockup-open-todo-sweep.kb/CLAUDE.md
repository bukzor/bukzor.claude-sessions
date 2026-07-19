# Chatfs-Cli-Mockup Open Todo Sweep — Session Addenda

Dated append log for `../chatfs-cli-mockup-open-todo-sweep.md`. That file
covers the original session write-up (Landed/Decisions/Immediate
plan/Blocked/Not started); every later pickup that added a new dated
`##` section to the end of the file instead gets its own entry here.

## What Belongs

One file per dated addendum — a chunk of narrative describing what
happened in one later pickup of this session (a specific day, sometimes
a specific part of a day). Same shape as a devlog entry: reasoning,
what shipped, what's still open. Filename: `YYYY-MM-DD-NNN-slug.md`,
numbering restarts at `000` per date, in chronological order of when
the *work* happened (not necessarily the order it was written up).

## What Does NOT Belong

- The live status sections (Immediate plan, Blocked on the user,
  Not started) — those stay in the parent file and are edited in
  place (checkboxes flipped), not appended as history.
- Anything that isn't a record of a past pickup of this specific
  session — unrelated work goes in its own sessions.kb entry or devlog.

## When to Add

The next time this session gets picked up and produces a write-up
worth recording, add a new file here rather than growing the parent
file further.
