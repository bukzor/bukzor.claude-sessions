---
cwd: /home/bukzor
session:
  uuid: # chronological; append your uuid when picking this entry up
    - c78bbbb7-a161-4ecb-addb-8c5bdfa4abcc
  started: 2026-09-01T13:16:48-05:00
  ended: null
---
# Must-Read Banks Are Invisible to kb Validation

`llm.kb-validate` enumerates `*.md` directly inside a `.kb/` and does
not descend into plain (non-`.kb`) subdirectories. Every
`must-read.kb/` keeps its content in `before/`, `after/`, and `when/`,
so **no must-read bank has ever been validated, at any scope** —
personal, project, or skill. This is the same failure class
`sessions.kb/CLAUDE.md` already records from the `penguin/` →
`penguin.kb/` incident: a green report over an unchecked corpus.

Found 2026-09-01 while gating the `/review-open-questions` pass, which
had just edited that bank.

## Evidence

```
$ find ~/.claude/must-read.kb -name '*.md' | wc -l
31
$ llm.kb-validate ~/.claude/must-read.kb/
  must-read.kb/
✅ 0 files, 0 errors

$ llm.kb-validate ~/.claude/must-read.kb/before/git/commit.md
❌commit.md
    No schema found for this frontmatter. Resolutions: skill://llm-kb/references/frontmatter-outside-a-collection.md
❌ 1 files, 1 errors
```

Validating the parent (`~/.claude/`, 294 files) prints the header
`must-read.kb/` with **zero** file lines beneath it, while the flat
sibling `tools.kb/` lists all 25 of its entries. That contrast is the
diagnosis: nesting, not the argument form, is what hides the files.
`llm-triggers/design.kb/` validates its nested `use-cases.kb/` fine,
because that child is `.kb`-suffixed.

## What's actually broken underneath

Ten of the 31 personal-bank entries carry `triggers:` frontmatter with
no `must-read.jsonschema.yaml` anywhere:

    before/git/commit.md                     before/rust-programming.md
    before/git/running-ANY-git-command.md    before/writing-agent-facing-instruction.md
    before/making-code-changes.md            before/writing-bash-scripts.md
    before/running-ANY-post-bootstrap-Bash-commands.md
    before/writing-python-code.md            when/redesigning-something-that-already-exists.md
    when/spawning-a-sub-agent--delegating-a-task.md

Each errors when named individually. The bank has been in this state
for an unknown period because the collection-level command reports
success.

## Open work

- [ ] Decide the fix's shape — it spans two skills and the choice is
      the owner's. Options as I see them: (a) `llm.kb-validate`
      recurses into non-`.kb` subdirectories of a `.kb/`, which is
      what `llm-must-read-kb`'s documented nesting already assumes and
      what the reading recipe `$CATEGORY.kb/**/*.md` implies; (b)
      `llm-must-read-kb` stops nesting, which contradicts its own
      "Nesting" section and the deployed `before/git/`,
      `before/lazy-loading/`, `before/using-claude-code-tool/`; (c)
      the walker warns when a `.kb/` yields zero files, which fixes
      the *silence* without settling the semantics. (a) and (c)
      compose and are my recommendation.
- [ ] Write `~/.claude/must-read.jsonschema.yaml` for the `triggers:`
      field once validation can see the bank — the schema is what the
      ten entries above are missing, and minting it before the walker
      is fixed would leave it just as unenforced.
- [ ] Sweep the other scopes once the walker sees banks: skill-scope
      `skill.kb/must-read.kb/` and any project `.claude/must-read.kb/`
      have never been checked either.
- [ ] `llm-triggers-lint` is not on `$PATH`; it lives at
      `bukzor-agent-skills/llm-triggers/bin/llm-triggers-lint` and
      must be run by path. Either install it as a console script or
      document the by-path invocation the way `llm.kb-validate-links`
      is documented in `llm-kb/SKILL.md`. Minor, but the house rule
      that references it currently cannot be followed as written.

## Ruling — the fix's shape

The one decision here; the rest of the open work follows from it and
needs no ruling. My position is (a)+(c) composed: the walker recurses
into non-`.kb` subdirectories *and* refuses to report a total smaller
than the corpus it was pointed at. (a) alone fixes this instance; (c)
alone catches the class, including the two below that (a) would miss.

Against myself: (c) means the walker needs a notion of "the corpus,"
which it does not currently have — that is a real cost, and if it
turns out to need a second directory walk, (a) alone plus a documented
smell may be the better trade.

<!-- edit here -->

## The class has three instances now

Same sitting, same shape — a green report over files nothing checked:

1. This one: entries nested in non-`.kb` subdirectories, never walked.
2. `sessions.kb/sub-cli-gizmo-evaluation.md` sat at the repo root
   instead of `penguin.kb/`, so it was outside the collection
   entirely — invalid when named directly, invisible to
   `llm.kb-validate .`, and absent from `claude-open-tasks-list` since
   2026-07-26. Moved into `penguin.kb/`; still untracked, still the
   owner's to commit.
3. The `penguin/` → `penguin.kb/` incident already in
   `sessions.kb/CLAUDE.md`: 44 entries unchecked for a month behind
   "1 file, 0 errors".

Three different causes, one signature: **a passing total that is
smaller than the corpus.** A walker that refuses to report a
suspiciously small count is the cross-cutting fix, and it is why (c)
in the open work above composes with (a) rather than competing.

## Why this is worth a whole entry

The pattern's premise is that the filename index is cheap to scan and
expensive to ignore. Validation is the only mechanical check that the
index is well-formed, and it has been reporting green on nothing. The
cost of the gap is invisible by construction, which is exactly why it
survived.
