# Decision: apply the frontmatter installer + each-turn review to `~/.claude/CLAUDE.md`?

Posed 2026-09-22. You ruled option B on 09-19 ("static triggers move to
CLAUDE.md frontmatter"); this is the concrete text, which is new. Companion
to `../must-read-sharding.kb/2026-09-22-000-decision-after-compaction.md`
(compaction; ruled there, its "in this context window" wording is assumed
below).

ruling:        # edit in place: accept / reject / amend, with words

## The artifact

`~/.claude/CLAUDE.md`, before → after. Frontmatter is new; the two
sections are the only ones touched.

```diff
+--- # workaround: anthropics/claude-code#13003
+triggers:
+  - before: your first unrequested tool call in this context window
+    read: must-read://~
+  - when: planning a turn
+    read: must-read.kb/when/planning-a-turn.md
+---
 # Override Priority
 ...
 ## Required Reading: Triggers

-Continually monitor for installed triggers' occasions; take the action when
-one arrives.
-
 ### Definitions

 - an "occasion" is a condition that may hold at any given moment
 - a "trigger" is user-written instruction binding an action to an occasion
 - a trigger is "installed" once it appears in your context
 - `before` marks a dependency: the trigger's action completes before the named
   action starts
 - `must-read://DIR` means `Bash(llm-must-read-ls DIR)`

-### Installation
+### Sources

-0. statically:
-   - before: your first tool call
-     read: must-read://~
 1. `must-read.kb/` paths, each naming the occasion to read that file
 2. skill `description`s, each naming the occasion to load the skill
 3. `triggers:` frontmatter of any file you load
-4. `requires:` frontmatter, an immediate trigger (deprecated)
 ...
 ## Time Awareness

 Bash(date -Is):

-- Session start
 - Periodically -- estimate > 1 hour
 - Inexplicable changes in external state
```

New bank entry, `~/.claude/must-read.kb/when/planning-a-turn.md`:

```markdown
> [!DRAFT] agent-authored 2026-09-22, vetoable

# When planning a turn

Review every installed trigger -- this bank's listing, skill descriptions,
and the `triggers:` frontmatter of files you hold -- and decide which
occasions this turn's plan will reach. Read only the entries those
occasions name, each before the action it names.

A `while/X/` line in the listing is a set: when X begins, run
`llm-must-read-ls` on it.

The listing is the object of review, not the entries. A turn-1 sweep that
reads the bank is the over-triggering this entry replaces.
```

(The `while/` paragraph belongs only if `must-read-sharding`'s migration
lands; it is where -002 VOCAB asked for it.)

## What it changes, and what it does not

Facts from the record (`2026-09-19-000-archeology-of-a9fd5254.md`,
`../judgment-protocol-redesign.kb/06-`):

- The installer's turn-1 fire rate under the current stanza: fable 19/19,
  opus 12/14, sonnet 5/7 plain, 0/2 skill-first. Under the old IMPERATIVE
  stanza, 30/30 -- with eager over-reads (four `/align` sessions `cat`ing
  several entries at turn 1).
- On the one bank entry audited across 60 no-read occasions, the listing
  was PRESENT in 52 (87%). Installation is not the dominant failure for
  entries; noticing-after-install is. Never-installed: 1/60; compacted
  away: 7/60.

So: the frontmatter installer fixes a small hole (sonnet turn-1) and is
the structural answer to "item 0 is a trigger in a list of sources." The
review directive is the only proposed lever on the *dominant* failure, and
it is unmeasured. This decision is the experiment that tells us whether
trigger delivery is viable at all -- the outer question behind your 09-18
"push CLAUDE.md text down into triggers" preference, which `08-` now says
is contraindicated at current rates (assert <=22%, fold 3%).

## Second projection

Baselines to re-measure against, fixed window (say 14 days or 40
sessions, whichever first), same corpus method:

| measure                                            | baseline      | would call it working |
| -------------------------------------------------- | ------------- | --------------------- |
| installer fires at first unrequested call, sonnet  | 5/9 (56%)     | >= 8/9                |
| installer fires, fable/opus                        | 31/33 (94%)   | no regression         |
| judgment entry read on fold leg (`06-` population) | 2/65 (3%)     | >= 20%                |
| turn-1 entries read before any target file         | 6/34 (18%)    | <= 1/34               |

If the fold-leg number does not move, the review directive is a
standing-state instruction wearing a juncture -- the shape that measured
5/7 -- and `08-`'s posture line is the honest fallback.

## Live alternatives

- **Frontmatter installer only, no review entry.** Fixes the category
  mismatch and sonnet turn-1; leaves NOTICED untouched. Cheaper by one
  file; forfeits the experiment.
- **Restore the IMPERATIVE stanza.** 30/30 install, but it is what produced
  the turn-1 over-reads, and it says nothing about per-turn noticing.
- **Nothing.** Sonnet turn-1 stays ~56%; NOTICED stays 3% on the fold leg.

Position: apply both, measure, and let the fold-leg number decide whether
guidance can live in the bank.
