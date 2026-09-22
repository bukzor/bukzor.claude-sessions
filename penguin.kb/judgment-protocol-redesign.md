---
cwd: /home/bukzor/.claude/must-read.kb
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 93639e4d-c447-4c9e-9933-8681f4172add
    - bed9bb66-a7d5-443b-b61b-9ace2ecb6ad6 # branch: corpus test
  started: 2026-09-18T10:40:42-05:00
  ended: null
---
# Judgment Protocol Redesign

Greenfield revisit of
`must-read.kb/before/asserting-or-conceding-a-claim-of-judgment.md`
(the Advocate/Skeptic/Arbiter entry, 2026-03-04; gates and rename
2026-08-31): back-derive its goals and requirements, then ask what we
would build today. The pass produced a transcript audit that overturned
the agent's opening premise, a design proposal (second attempt; the
first was withdrawn), and seven open questions (one since closed) -- nothing in the entry
itself has changed.

Evidence record: `~/.claude/docs/dev/devlog/2026-09-18-000-the-judgment-trigger-audited-against-18-days-of-transcripts.md`.
Raw read inventory (throwaway): `must-read.kb/trash/judgment-trigger-reads.md`.

## Goals of the entry, back-derived

The agent's opinions -- trade-offs, causal stories, recommendations --
track evidence rather than the conversation's social pressure. Three
failure shapes: (1) folding under pushback with nothing new shown;
(2) endorsing the user's theory because agreeing feels good;
(3) asserting its own theory past its evidence (the 2026-08-30
founding case: "mechanism observed" written into a kb at n=2 with a
known confounder unnamed).

## Key findings (transcript audit, 2026-08-31..09-18; corpus starts 2026-07-13)

- **The occasion is discrete.** 12 of 15 pressure-driven reads were
  self-announced ("I'm about to assert a claim of judgment, so..."). The
  agent's opening claim -- that "asserting a judgment" is a continuous
  condition belonging in CLAUDE.md -- was wrong; the name stays.
- **Assert leg works; fold leg does not.** 65 replies opened with a
  concession phrase; 63 had no read of the entry nearby. User
  hand-invoked the check 3 times in 18 days (8 in the seven weeks
  before). Self-diagnosis on 09-18: "it should have fired last turn."
- **Cause is state, not list size.** The same filename in the same
  35-entry bank fires cleanly on assert and not on fold; under pushback
  the agent is in respond-to-correction mode and "should I check?"
  never arises. (The agent's own "recall miss in a flat list" was a
  mechanism claim the agent initially deferred to -- the very error the
  entry names.)
- **`Jr?` was never typed**, in 879 transcripts. `must-read: ...` /
  `mode: skeptical debate` / "sycophancy check" -- 11 uses, all
  effective.
- Over-triggering is mild and bank-level: 6 turn-1 sweeps loading the
  entry with other must-reads (four `/align` sessions, 09-02).

## Conclusions

- Keep: name, both gates (testimony vs. hypothesis; name a
  disconfirmer), the roles as a tool. Nothing observed argues against
  them.
- Delete the `Jr?` shorthand from CLAUDE.md (on ruling).
- Proposed fix for the fold -- **pre-commit at assertion**: a
  contestable judgment is asserted with one clause naming what would
  change the agent's mind; at pushback, "did something real arrive?"
  is a comparison against that clause (in context) rather than a
  recall of an unloaded file. Three outcomes: named disconfirmer
  arrived -> concede citing it; unnamed one arrived -> concede and
  correct the grade; neither -> hold and say what would move you.
  Subtractive: no hook, and CLAUDE.md's "Before Changing Course"
  collapses into it (the pushdown direction the user asked for).
- The 2026-08-29 ruling (guidance is a mode + success criteria +
  tools, not a procedure) applies to this entry and has never been
  applied; the rewrite should take that shape.
- Withdrawn during the pass: a `Stop` hook regexing concession phrases
  (reopened 09-19 as a *backstop* under `must-read-sharding`'s
  GRADIENT/BACKSTOP frame -- see `.kb/07-`); a two-file
  split (rested on `Jr?` being an occasion); hoisting the testimony
  gate into CLAUDE.md (wrong direction); a fresh-context sub-agent
  skeptic (no observed failure of the in-context roles).

## Relation to `must-read-sharding` (session `ba648ef5`, same day)

Its `/formalize` ledger names the one open empirical premise of trigger
banks, NOTICED? ("measurable by session archeology, occasions vs
installs"); this audit is a worked instance, with a sharper result:
one file, two occasions, two NOTICED values (assert high, concede
2/65). GATE_RULE (2) -- "an action or a tool, never a mood" --
predicts the split. Two consequences for this session: COMPACTION?
is a confound on the 63 (`.kb/06-`), and the withdrawn hook returns as
a legitimate late backstop (`.kb/07-`). What this session offers back:
a third strategy beside judgment and mechanical pulling -- relocate a
body's work to an earlier, better-noticed occasion on the same object
(pre-commit at assertion).

`trigger-installation.md` (session `a9fd5254`) has cross-read this
entry (`trigger-installation.kb/2026-09-19-001-peers-cross-read.md`)
and extends it: the 63 split is three-way, since the audit window
straddles its 09-04 installer rewrite (`.kb/06-` amended); the `05-`
over-triggering is its old-wording cohort and is closed; MODE_MISS
("noticing is governed by mode, not layout") is this session's
"state, not list size" with host-stanza wording added as a third
variable. The absolute 2/65 now has three candidate causes; the
within-file assert/concede asymmetry survives all three.

`shell-config-intent-first-loader.kb/2026-09-19-001-sibling-review.md`
adds: pre-commit at assertion is the ledger's per-claim `stale when:`
applied to chat -- the proposal's existing instance, so the criterion
should use that name (`.kb/01-`); two good folds observed there; and
`.kb/03-` has a second downstream awaiting the same ruling.

## Open work

- [~] Run the assert-leg miss-rate test before any rewrite: for each
      user pushback in the window, had the contested claim been
      asserted with a disconfirmer? -- and in the same run, split the
      63 no-read folds three ways: never installed / compacted away /
      present (`.kb/06-`) (sub-agent, same corpus)
- [ ] Rulings needed -- see `judgment-protocol-redesign.kb/`
- [ ] On rulings: rewrite the entry as mode/criteria/tools; move
      "Before Changing Course" down from CLAUDE.md; delete `Jr?`;
      update the devlog's `[!DRAFT]` status
- [x] Bank-level note on turn-1 reflexive sweeps -- skip; explained
      by `trigger-installation`'s old-wording cohort (`.kb/05-`)

## Addenda

`judgment-protocol-redesign.kb/` holds the open questions, one file
each, posed 2026-09-19 and unruled; each file should come to state its
resolution.
