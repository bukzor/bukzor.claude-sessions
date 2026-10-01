# Decision: execute the one-set migration, and in what shape?

Posed 2026-09-22. This session's own; the design is settled, this is
the go and the four small choices executing it would calcify.

ruling:        # edit in place: go / hold / amend

## The question, plainly

Move five coding triggers out of the top listing into a sub-listing
that is pulled only when the agent starts making code changes. The top
listing shrinks 34 → 29 lines plus one line `while/making-code-changes/`
that reads as "there's a set here; list it when you begin making code
changes." Nothing else moves. Worst case (agent lists the set at start
out of curiosity) is exactly today's listing plus one tool call.

Gate removed: an earlier note said this must wait on the compaction fix
above. It doesn't -- re-listing the top brings the stub back, so the
migration neither worsens nor depends on compaction.

## Risk, found after this was posed (`-002-noticed-measured.md`)

"Worst case is today's listing plus one tool call" bounds *cost*, not
recall. The five members can fire only if the agent noticed the stub
and listed the set; today each fires on its own. The sibling measured
noticing for a judgment-shaped occasion at <=22% with the listing
present. `making-code-changes` is action-shaped -- the kind that did
fire in those same sessions -- but its own rate is unmeasured. If it
is near 1, the migration costs nothing; if it is near the judgment
rate, the five lose most of their recall.

Cheap check before go: the sibling's method on
`before/making-code-changes.md` -- of code-change beginnings in the
corpus, how often was that file read. One sub-agent run; the stub will
carry the same name, so the number transfers. Position: run it; go on
a rate above ~70%, else hold and keep the five at top.
Silence: hold -- an act, not a default.

## Four choices, each with a default (silence lets it stand)

1. **`before/making-code-changes.md` moves into the set** as
   `while/making-code-changes/before/ANY-code-change.md`. The stub line
   is the gate; keeping the file at top as well would be two lines for
   one occasion. Declined: keep both, belt-and-braces.
2. **`rust-programming.md` → `writing-rust-code.md`** on the way in, so
   the slug names an action that entails "making code changes"
   ("programming" could be reading).
3. **`running-a-stripe-CLI-command.md` leaves the personal bank** for
   the project bank of whichever repo uses stripe (`[!DRAFT]` 09-02;
   I don't know which repo -- name it, or it stays put).
4. **Where the one recognition sentence lives.** The agent must know
   that a `while/X/` line means "list it when X begins". Two sessions
   hold different defaults for this sentence; rule once here.
   - **This session:** `llm-must-read-ls` prints it as a header line,
     only when the listing contains a `while/` stub. Reason, not
     preference: the sentence is recognition vocabulary -- what a line
     in the listing *means* -- and the bank's own rule is that
     recognition can't be gated behind a trigger. The header travels
     with the listing wherever it goes (hook re-injection after
     compaction, sub-agents, project banks) and depends on no trigger
     firing.
   - **`trigger-installation`** (`../trigger-installation.kb/2026-09-22-
     000-decision-install-change.md`): the paragraph sits in the new
     `when/planning-a-turn.md` review directive, which is the moment of
     scanning. Coherent home; but a `when/` entry is judgment-pulled --
     the delivery measured at <=22% / 3% -- and that file's own
     projection says the directive may prove "a standing-state
     instruction wearing a juncture." If it fails its experiment, the
     `while/` sentence fails with it.
   - Not both: one sentence in two places drifts.
   - CLAUDE.md prose: declined by both (the shape measured 5/7).
   Position: the header; the review directive drops its paragraph (its
   draft already marks it conditional on this migration). Silence:
   header stands, and the peer's file is told by this one.

## Second projection

Before:
```
before/making-code-changes.md
before/rust-programming.md
before/writing-bash-scripts.md
before/writing-python-code.md
before/writing-tests.md
```
After:
```
while/making-code-changes/
```
and inside it, on begin:
```
while/making-code-changes/before/ANY-code-change.md
while/making-code-changes/before/writing-bash-scripts.md
while/making-code-changes/before/writing-python-code.md
while/making-code-changes/before/writing-rust-code.md
while/making-code-changes/before/writing-tests.md
```

## Also touched

`llm-must-read-ls` gains the prune (`-path '*/while/*/*' -prune`);
`llm-must-read-kb/SKILL.md` loses the "slug, not directory shape"
sentence and gains a `while/` section. `Skill(llm-must-read-kb)` loads
before either edit.
