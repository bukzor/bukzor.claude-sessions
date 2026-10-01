---
cwd: /home/bukzor
session:
  uuid: # chronological; append your uuid when picking this entry up
    - c78bbbb7-a161-4ecb-addb-8c5bdfa4abcc
    - 781aafd7-12e3-43b7-a7e2-59ee46a3f375
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

- [ ] Decide the fix's shape -- two independent picks, under
      "Ruling" below.
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

## Ruling -- the fix's shape

Two independent picks, not one. The previous draft fused them and
offered a "stop nesting" option that was never live: `before/`,
`after/`, `when/` are the pattern's juncture encoding, not the
"Nesting" section's topical subdirs, and no bank has a single flat
entry. The rest of the open work follows from these two picks and
needs no ruling.

### Membership: what makes a file under a `.kb/` a member?

llm-kb's text says `$CATEGORY.kb/*.md` with nesting by `.kb` suffix;
its reading recipe says `**/*.md`; the walker does the former. Counted
2026-09-03, `.md` files sitting in a plain subdirectory of a
collection, personal scope and fleet together:

    58  must-read.kb/{before,after,when}            members, invisible
     8  reference.kb/{git,markdown,python,rust}    members, invisible
    10  strata.replication.kb/instructions.d       not members
     4  tools.kb/*.examples.d                      not members
     3  sessions.kb/.claude  sessions.kb/docs  tools.kb/.claude   not members

- **Recurse everywhere.** Every `.md` under a `.kb/` is a member under
  the parent's schema. Finds the 66; also sweeps the 17 non-members
  into schemas that do not fit them.
- **Declared per collection.** A collection opts in to subdirectory
  members; the bank pattern and `reference.kb` declare it. Finds the
  66, touches nothing else. Cost: one more concept in llm-kb.
- **Flatten the bank.** Juncture moves into the filename
  (`before--git--commit.md`); the walker is untouched. Cost: every bank
  migrates, every `must-read.kb/before/...` path in the fleet breaks,
  and `ls -RF` loses its grouping. The honest form of the previous
  draft's option (b); I recommend against.

**Mine:** declared per collection. Against myself: a new concept for
two consumers, and the non-member set is small enough that "recurse
everywhere, then rename the 17" might be cheaper -- but `docs/` and
`instructions.d/` are not misnamed, they just are not members, and a
rule that cannot tell them from `git/` is not a rule.

### Self-check: does the walker refuse a total smaller than the corpus?

Independent of membership. Three instances of one signature in one
sitting (below) say yes; the cost is a notion of "corpus" the tool
lacks -- likely a second, `.gitignore`-filtered `find`. Mine: yes.

**If you say nothing:** both stay open. The previous draft said the
choice is yours; I hold to that.

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
