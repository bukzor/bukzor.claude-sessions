--- # workaround: anthropics/claude-code#13003
git-caution: personal
---

# Sessions Collection

Entry conventions -- what belongs, entry shape, and what to do at session
start, mid-session, and end -- are Skill(llm-sessions). This file covers
only what is particular to this repo.

## This Repo

This repo (`bukzor/bukzor.claude-sessions`) _is_ `~/.claude/sessions.kb/`
on every host that uses it — wired in as a git submodule at that path
in `bukzor/dotfiles`, not cloned/gitignored separately. It was split
out of dotfiles' history (2026-07) to keep sessions.kb's high-churn
file edits out of dotfiles' log/blame; only the submodule gitlink
pointer shows up there, and even that is bumped lazily/as-needed
rather than after every commit here.

### Per-host layout

Entries live under `<hostname>.kb/`, e.g. `penguin.kb/reunify-dotfiles.md`
for host `penguin`. Rationale: sessions are tied to a specific
machine's filesystem state (open worktrees, local branches, uncommitted
files) — a flat namespace would silently collide or misattribute
entries across hosts sharing this one repo. `CLAUDE.md` stays at the
repo root, shared across hosts.

The `.kb` suffix is load-bearing, not decoration: `llm.kb-validate`
only descends into `*.kb/`, so a plain `penguin/` made the whole
collection invisible to validation — it reported "1 file, 0 errors"
while 44 entries went unchecked for a month. Each host directory
also needs a one-line `<hostname>.jsonschema.yaml` beside it, because
schema lookup for `X.kb/` resolves to `X.jsonschema.yaml`; copy
`penguin.jsonschema.yaml`, which just `$ref`s the shared schema.

When onboarding a new host: `git submodule update --init
.claude/sessions.kb` in dotfiles, then `H=$(hostname -s); mkdir -p
~/.claude/sessions.kb/$H.kb; sed "s/penguin/$H/" penguin.jsonschema.yaml
> $H.jsonschema.yaml`.

### `cwd:` frontmatter stays host-absolute

Session entries' `cwd:` field (e.g. `/home/bukzor`) is left as a plain
host-absolute path, not made portable/symbolic. The per-host directory
already disambiguates _which_ host a path belongs to; a reader who
knows the entry lives under `penguin.kb/` already knows `cwd:` is
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
