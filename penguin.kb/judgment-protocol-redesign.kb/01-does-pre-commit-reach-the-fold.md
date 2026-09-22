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
