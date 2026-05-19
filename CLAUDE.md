--- # workaround: anthropics/claude-code#13003
requires:
  - Skill(llm-kb)
---

# Sessions Collection

The user runs many parallel sessions across cwds, repos, and skills;
this collection indexes the ones worth tracking.

## What Belongs

- A planned session that has not been started yet (no `session.uuid`)
- An in-flight session worth referencing across other contexts
- A recently completed session whose follow-ups are still live

## What Does Not Belong

- Per-task todos -- those go in the project's own `.claude/todo.kb/`
- Per-session devlogs -- those belong with the project (Skill(llm-collab))
- Concept definitions, principles, etc. -- those go in their respective
  skill kbs

## When to Add

Add an entry the moment a future line of work is identified -- end of a
session that surfaced follow-ups, mid-conversation when a tangent is
recognized as its own scope, or whenever the user notes "that's another
session." Capture is cheap; the value is in not losing track.

## When to Read

Read at session start to recover the user's open lines of work, or when
deciding whether the current task is already tracked elsewhere.

## File Naming

kebab-case, descriptive enough that the user can guess the session's
purpose from the filename. Do not number -- sessions are not ordered.

## Where Files Live

Session with a clear project home: canonical at
`<project>/.claude/sessions.kb/<slug>.md`, absolute-path symlink here.
Otherwise: directly here, no symlink.

## Lifecycle

When a session is finished and its follow-ups are absorbed elsewhere
(or it is no longer worth tracking), delete the file. The collection
is a working index, not an archive.
