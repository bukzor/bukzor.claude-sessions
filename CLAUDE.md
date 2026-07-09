--- # workaround: anthropics/claude-code#13003
requires:
  - Skill(llm-kb)
---

# Sessions Collection

The user runs many parallel sessions across cwds, repos, and skills;
these notes keep the live ones at hand on disk for the next session
to pick up.

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
session." Writing it down is cheap; the value is reading it back at
the next session start.

## When to Read

Read at session start to recover the user's open lines of work, or
when checking whether the current task is already noted elsewhere.

## Open Work: `- [ ]` Is Load-Bearing

A session entry's open work surfaces in `claude-open-tasks-list` only
when its lines use `- [ ]`. Bare `-` bullets are **invisible** to the
inventory and silently lost — they will not be rated, will not appear in
`task-list.md`, will not compete for prioritization. See
`Skill(llm-subtask)` for the full rule; the short version: any
task-shaped line uses `- [ ]`, anything else is prose.

## File Naming

kebab-case, descriptive enough that the user can guess the session's
purpose from the filename. Do not number -- sessions are not ordered.

## Where Files Live

Session files live directly here, in `~/.claude/sessions.kb/`. This
is the default home regardless of which project the session relates
to. A single directory keeps "what am I working on?" a one-`ls`
question and avoids fragmenting notes across repos.

See the appendix below for an optional in-repo + symlink scheme.

## This Repo

This repo (`bukzor/bukzor.claude-sessions`) *is* `~/.claude/sessions.kb/`
on every host that uses it — wired in as a git submodule at that path
in `bukzor/dotfiles`, not cloned/gitignored separately. It was split
out of dotfiles' history (2026-07) to keep sessions.kb's high-churn
file edits out of dotfiles' log/blame; only the submodule gitlink
pointer shows up there, and even that is bumped lazily/as-needed
rather than after every commit here.

### Per-host layout

Entries live under `<hostname>/`, e.g. `penguin/reunify-dotfiles.md`
for host `penguin`. Rationale: sessions are tied to a specific
machine's filesystem state (open worktrees, local branches, uncommitted
files) — a flat namespace would silently collide or misattribute
entries across hosts sharing this one repo. `CLAUDE.md` and
`.template.md` stay at the repo root, shared across hosts.

When onboarding a new host: `git submodule update --init
.claude/sessions.kb` in dotfiles, then `mkdir -p
~/.claude/sessions.kb/$(hostname -s)`.

### `cwd:` frontmatter stays host-absolute

Session entries' `cwd:` field (e.g. `/home/bukzor`) is left as a plain
host-absolute path, not made portable/symbolic. The per-host directory
already disambiguates *which* host a path belongs to; a reader who
knows the entry lives under `penguin/` already knows `cwd:` is
`penguin`-relative. Revisit if a host ever needs to read another
host's entries and resolve `cwd:` programmatically — no such need
exists yet.

### Push / pointer-bump cadence

Commit and push here (`bukzor.claude-sessions`) whenever a session
entry changes — same as any other repo. The dotfiles-side gitlink
pointer is a separate, deliberately lazy step: bump it only when
something outside sessions.kb needs the pointer current (e.g. cloning
dotfiles fresh on a new host). Until then, dotfiles will often show
this submodule as "modified (new commits)" against its recorded
pointer — that's expected, not a problem to fix.

## Lifecycle

These are ephemeral working notes — useful on disk between sessions,
not durable knowledge artifacts. When follow-ups are absorbed
elsewhere (or no longer worth keeping at hand), delete the file.

## Appendix: in-repo placement with symlink (optional)

A session may instead live in a project's own source tree when that
suits the work — e.g., notes tightly coupled to project-internal
artifacts, or that should appear in the project's grep results. In
that case:

- on-disk home: `<project>/.claude/sessions.kb/<slug>.md`
- symlink: `~/.claude/sessions.kb/<slug>.md` → on-disk home

This is an optional scheme. The default (directly in
`~/.claude/sessions.kb/`) is simpler and should be preferred unless
there's a specific reason to co-locate.
