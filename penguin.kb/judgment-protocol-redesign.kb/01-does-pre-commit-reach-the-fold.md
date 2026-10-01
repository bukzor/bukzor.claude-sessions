# Does pre-commit at assertion actually reach the fold?

Posed 2026-09-19, unruled. Empirical, and testable before any text
changes.

The proposal moves the fold's work to the assert moment: a
contestable judgment is asserted with a clause naming what would
change the agent's mind, so pushback is answered by comparing it to
that clause rather than by recalling an unloaded file.

It only helps where the clause was written. The audit measured the
assert leg's hits (9 self-narrated reads in 18 days), not its misses.

Two claims, both graded n=0:

- contestable judgments are usually asserted with the trigger firing
  (so the clause would usually exist);
- checking one's own previous message against the current one
  survives the pushback state better than recalling a file does.

Test for the first: every user pushback in 2026-08-31..09-18, and
whether the claim it contested had been asserted with a disconfirmer.
One sub-agent run against the same corpus. The second has no corpus
test; it needs trial.

Related, not the same measurement: `shell-config-intent-first-loader.kb/
2026-09-19-001-sibling-review.md` reports two folds in that session,
both naming what arrived and re-deriving -- outcomes 1/2 of the lookup
working. Whether the disconfirmer had been pre-named at assertion is
not stated, so they count as fold-side evidence, not miss-rate data.

Vocabulary, from the same review: the ledger form already carries
this per claim as `stale when:` (`Skill(llm-claims)`). The chat
criterion should say "a contestable judgment states when it goes
stale" rather than coin a disconfirmer clause -- same artifact, one
name, and chat claims become ledger-shaped.

## Measured 2026-09-22 -- against, as a trigger-delivered rule

Corpus test over the 62 concession turns in the window (tables:
`must-read.kb/trash/judgment-trigger-corpus-test.md`). Of the 40 that
conceded a judgment claim (20 were factual slips or mechanical errors,
2 unlocatable), the original assertion carried a disconfirmer **2
times (5%)**. The one clean case (`c5730239:857` "I tested three
configurations, not the space" -> user quoted it back -> `:862`
"Right -- three points isn't a space", one line) is the mechanism
working exactly as proposed; the other pre-named a confounder that was
not the one that mattered (`:1011` -> `:1037`).

What this settles: the assert leg's *reach*, which the first audit
measured only by hits. 9 self-narrated reads against >=40 contestable
assertions in the same window puts the assert-leg fire rate at <=22%
-- and the clause is written at 5% even when nothing asks for it. So
"the assert leg works" was survivorship; both legs miss most of the
time, the fold leg worse. A criterion delivered through this trigger
reaches at most a fifth of the claims it is for.

Caveat, real: the sample is conditioned on concession. Pre-named
claims that survived pushback are invisible here, so 5% is a floor on
how often the clause is written today, not a measure. A sample drawn
from assertions would fix that; "asserting a judgment" has no
automatic detector, so it would be hand-labeled.

Also found: 37 of 38 bare concessions *did* name what changed
(Before Changing Course's demand), with real analytic content. The
agent articulates the disconfirmer fluently once handed it; the
failure is ex ante only.

## Measured 2026-09-22 (`trash/judgment-trigger-followup.md`)

27 user pushbacks in the window (deduped, precision-tuned; a floor).
Of the contested claims, **8 carried a falsifier when first asserted
(30%); 19 were bare.** Responses: 22 conceded, 5 held-or-verified, 0
asked. Of the 22 concessions, 14 named what arrived.

Verdict on the pre-registered disconfirmer ("if the assert leg mostly
misses too, this clause won't exist when the fold comes"): **it
mostly misses.** 30% is the baseline with no rule asking for a
falsifier, so the criterion could raise it, but the ceiling is
assert-leg recognition on contested claims -- unmeasured directly,
and the 9 self-narrated reads against 27+ contested claims say it is
of the same order. Pre-commit moves work from a 7% occasion (4/61
folds read the entry) to a ~30% one: better, not sufficient alone.
Decision reverts to "pre-commit and a backstop" (07-).

Also: 0 of 27 pushbacks drew a clarifying question. Outcome 3 of the
lookup ("hold; say what would move you") is the ask the record shows
never happens.