# 2026-09-19: sibling audit impeaches the recall case — patch to -000

Source: `../judgment-protocol-redesign.md` (session `93639e4d`, same cwd,
started 13 minutes after this one) and its evidence record
`~/.claude/docs/dev/devlog/2026-09-18-000-the-judgment-trigger-audited-against-18-days-of-transcripts.md`.
Its finding: the judgment trigger fired on 12 of 15 assert occasions and
2 of 65 fold occasions -- same file, same bank, same listing distance.
The miss is agent *state* (respond-to-correction mode), not list length
or position. It cites this session's "recall miss in a flat list" as a
mechanism claim asserted on n=1; that claim is retracted.

Patch to the -000 ledger (restating supersedes; unmentioned claims stand):

```
* FIRING+
  * NOTICED? (restated): the agent notices X begin, for each X heading a
    set -- and the only audit in hand says noticing is governed by the
    agent's mode at the moment, not by the listing's distance or length.
    Test: occasions vs installs, split by agent mode at begin (the
    judgment-audit method, transferred).
  * MODE_MISS+ <- NOTICED: a begin that arrives while the agent is
    mid-flow (responding, editing) is missed regardless of layout; one
    that arrives during deliberate planning is caught. Stale when: an
    audit of a `while/` set's occasion shows misses correlating with
    listing distance rather than with mode.
    * // n=65/15 on one trigger; generalization to activity occasions is
      the inference, hence `+`. Confounded: the sibling's `06-` notes the
      63 no-read folds were never checked for a `compact_boundary`
      between last listing and concession, so an unknown share may be
      delivery holes (listing absent) rather than mode misses. The
      distance/length mechanisms stay unimplicated either way; the
      state-vs-hole split waits on that test.
  ~~RECENCY~~: sharding improves recall by placing sets later in context
    -- conceded in debate as plausible, unsupported by the audit; both
    sides argued a variable the evidence does not implicate.

* OCCASIONS+
  * BEGIN_AT_DECISION+ (restated): an activity occasion begins at the
    decision to enter it, not at its first action. Two grounds: TIMELY
    for `before/` members, and MODE_MISS -- the decision moment is a
    deliberating state, the first action a flow state, so the
    begin-notice is placed where noticing works. Same move as the
    sibling's pre-commit-at-assertion.

* PULLERS+
  * BACKSTOP (restated) <- BEGIN_AT_DECISION TIMELY GRADIENT MODE_MISS: a
    mechanical puller on the action is the one intervention that targets
    the observed failure -- the runtime asks "is this an occasion?" when
    the agent's mode would not. Late for an approach-shaping body, in
    time for style bodies; replaces judgment only where the occasion
    begins at an observable action. llm-triggers is therefore necessary
    for NOTICED, not merely relevant.

* POLICY+
  * ECONOMICS+ (restated) <- GATE_RULE STUB_BOUND MODE_MISS: a set earns
    its place on listing cost, clustering, and precision -- not recall.
    Precision: turn-1 reflexive sweeps (6 of 34 reads in the sibling
    audit `cat` the bank at task start before any target) cannot reach a
    set's members. Threshold unchanged: minority of sessions, >= 3
    triggers. Stale when: pull cost changes or an audit shows a recall
    effect from layout.

* QUESTIONS+
  * DISSOLVED (add): "does sharding improve recall" -- the debate's
    question; dissolved because neither audited candidate (mode, or
    listing absent) is a function of where in the tree a trigger sits.
    What remains askable is NOTICED? per occasion and per mode.
  * COMPACTION? (restated): after context compaction nothing re-installs
    the top set or any `while/` set whose occasion still holds. No
    longer a pre-existing hole noted in passing: if `06-`'s test
    attributes much of the 63 to absent listings, this is the dominant
    miss, and sets widen it from one missing re-list to n. An answer
    settles whether re-install (a post-compaction puller for every set
    whose occasion holds) is a precondition of the migration.
    * // MIGRATE_ORDER+ <- COMPACTION: the migration todo is gated on a
      re-install mechanism, or on `06-` showing the hole is small.
```

Sibling `07-` applies GRADIENT/BACKSTOP to their withdrawn `Stop` hook and
reads it correctly: a backstop under the judgment puller, late for an
approach-shaping body, its regex an instance of what SET_DESC? needs a
home for. Nothing to patch here; noted so the two ledgers stay in step.

Also carried from the sibling, bank-level and unfiled: one file serving
two occasions (assert, fold) fires on one -- the skill's "two occasions
with no honest broader name are two entries" case, which that session
answers with pre-commit rather than a second entry. No claim here yet.
