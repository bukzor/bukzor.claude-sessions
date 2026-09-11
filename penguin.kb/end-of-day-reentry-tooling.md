---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-tools/packages/claude-code-archeology
session:
  uuid: # chronological; append your uuid when picking this entry up
    - f65fbdf3-2597-44a8-b099-ee0e9d546ed2
    - 01f46623-f8f4-45d2-bd30-72201775320a
  started: 2026-09-10T12:35:48-05:00
  ended: null
---
# End-of-Day Re-entry Tooling

Session f65fbdf3 (2026-09-10) reconstructed a day of twelve parallel
sessions from `~/.claude/projects` to answer "what got done, what is
open, what do I actually want next" -- the owner had lost the thread
after a day diffused into infra work. The reconstruction needed no full
transcript reads and no subagents; everything came from indexes, tails,
and version control. What it needed and had to build ad hoc was the
tooling gap.

Session 01f46623 (2026-09-11) turned that gap into a design and filed
it as a taskfile with a parts kb:

`~/repo/github.com/bukzor/bukzor-tools/.claude/todo.kb/2026-09-11-000-session-re-entry-tooling-as-jsonl-streams.md`

The design in one rule: map stages take files, reduce stages take a
stream; every stream is jsonl with a `kind` field, every question is a
`jq` filter, and `rg --json '^'` is the origin tagger that lets a map
feed a reduce. Measured that day: a full day of transcripts tagged and
decoded in under half a second; the empty pattern is a 276 MB trap;
every slug under `projects/` starts with a dash; the home dotfiles repo's
ignore rules hide every repo below it from `rg --files`. All of it is in
the parts kb's `discovered-constraints.kb/`.

The seven gaps the first sitting listed (mtime-based inventory, session
index, cross-repo commit sweep, peek, family grouping, timezone, survey
prune list) are each a stage or command file in that kb and are no
longer tracked here.

- [ ] Build it, per the taskfile's outcome-shaped steps; the parts kb's
      `stages.kb/` and `commands.kb/` frontmatter is the distance report
- [ ] Rule on the four files in the parts kb's `open-questions.kb/`:
      envelope shape, home for the `jq` views, caching the records
      stream, and `uuid` versus `#L<n>` as the citation form. Each
      carries an agent recommendation marked as such
