---
cwd: /home/bukzor
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 4946d6c3-7543-43a1-98a7-5750f04e1f04
  started: null
  ended: null
---
# Clarify --fixup Semantics in reference.kb/git/commit.md

`~/.claude/reference.kb/git/commit.md` documents `--fixup SHA` mechanically
("for older commits") but never states the actual selection criterion: a
fixup target is the commit whose narrative *should already have contained*
this change, as if written correctly the first time — not the commit whose
diff happens to touch the same lines, and not about patch-applicability.

Surfaced 2026-07-11 (chatfs-cli-mockup session): picked a fixup target by
"which commit's diff introduced this line" (blame-based) and separately
argued "a fixup against the other commit wouldn't apply cleanly"
(patch-mechanics) — both wrong justifications for the *right* target,
corrected by the user. `git rebase --autosquash` doesn't apply the fixup
commit as a patch against old hunks; it replays the full commit sequence,
so a fixup can touch entirely different lines/files than its target and
still squash cleanly. The actual test is temporal/narrative: would this
content have been correct to include in the target commit at the moment
it was authored?

Not fixed inline: `~/.claude/reference.kb/git/conventions.md` (sibling
file, same directory) was dirty with unrelated in-progress edits on the
`svelte-crostini` branch (not `main`) when this was found — editing a
neighboring file in that same dirty, non-default-branch working tree
felt like the wrong moment. Revisit once that branch's own work lands or
is set aside.

## Proposed addition to commit.md, near the existing `--fixup` mention

> **Choosing a fixup target:** the target is the commit whose narrative
> *should already say this* — as if it had been authored correctly the
> first time — not the commit whose diff happens to touch the same
> lines. `rebase --autosquash` replays full commits, not patches against
> old hunks, so a fixup commit can touch different lines/files than its
> target and still squash cleanly.
