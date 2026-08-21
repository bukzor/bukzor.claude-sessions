---
cwd: /home/bukzor/claude/homedir-archeology
session:
  uuid:
    - 1b4592f6-145b-429b-ad4b-1b9f9e55772d
  started: 2026-08-21T10:44:00-05:00
  ended: null
---
# JSON Schema $ref-Dedup Census (2026-08-21)

Motivating question: which JSON Schema files across the whole homedir
predate/ignore `$ref`, and should be DRY'd out with it? Scanning tooling
is ready; the actual census/dedup logic is not written yet.

## Completed this session

- `bukzor-homedir-archeology` (package `bukzor_homedir_archeology`, CLI
  `bukzor-homedir-archeology`) created at
  `~/claude/homedir-archeology/lib/python/bukzor_homedir_archeology/`:
  a shared `find`-based survey engine (`survey.find()`) plus subcommands
  `survey`/`claudefiles`/`jsonschemas`/`find`. Supersedes an earlier
  bash-only `survey-lib.sh` + per-artifact scripts (deleted).
  `~/.claude/must-read.kb/when/surveying-the-homedir-for-an-artifact-type.md`
  documents it as the entry point for any future homedir-wide scan.
- `jsonschemas` subcommand already finds all JSON Schema files homedir-wide
  (by `*.jsonschema.*`/`*.schema.json`/`*.schema.y*ml` naming, union a
  `$schema`-key content sniff for files that predate the convention).

## Not started: the actual dedup analysis

Planned (not written): parse each found schema, canonicalize subtrees
(drop cosmetic keys like `description`/`title`), hash/compare across
files, and report duplicate subtrees as `$ref`/`$defs` extraction
candidates. Working names from planning: `jsonschema-ref-census.py`,
`jsonschema-dup-subtrees.py` -- these should become functions/subcommands
in `bukzor_homedir_archeology`, not new standalone scripts (see the
must-read trigger above).

## Check before starting -- likely-related concurrent work

A separate, concurrent line of work landed in
`bukzor-agent-skills/llm-kb` today (commits `179040f`..`ee7a058`,
2026-08-21 ~10:03-10:41, same day as this session but not part of it):
migrating llm-kb's own schemas to `$ref` the shared date/instant units,
plus a `schema-reuse.md` "$ref floor" finding (repetition alone isn't
enough; the floor is N copies that have to agree and don't). See
`penguin.kb/yaml-date-jsonschema.md` (the longer-running lineage this
descends from) and the `ee7a058` devlog for its two filed findings.

That work is scoped to llm-kb's own schema set and was done by hand, not
via a homedir-wide scanning tool -- likely not fully overlapping with a
homedir-wide census, but close enough that the next session should read
both before writing `jsonschema-ref-census.py`, to avoid re-deriving the
"$ref floor" judgment call or re-flagging schemas already fixed.
