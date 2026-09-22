# 2026-09-19: `/formalize` ledger — trigger banks as occasion-indexed sets

Rendered per `Skill(llm-claims)`; sigils: `!` user's ruling this session,
`+` agent's (veto invited), `?` open, bare = follows from premises or
checkable. Not yet filed to a `*.claims.kb/`; see the parent's open work.

## Layer 0

A trigger bank is a tree of trigger sets indexed by occasions; a set is
installed when its occasion begins, every member's occasion entails its
set's, and "installed before fired" then rests on exactly one premise —
noticing the occasion begin — dischargeable per occasion by a puller.
Three laws: ENTAIL, BEGIN, RECOG. SOUND is the theorem.

## Candidates killed

- Fibration / Grothendieck construction — needs restriction maps
  `F(X) → F(Y)` for `Y ⇒ X`; no operation moves a trigger between sets.
  Survives as INDEXED (a partition).
- Galois connection installed ⇄ occasions — no adjoint pair used; SOUND
  is a plain inclusion.
- Namespace nesting as meet (`before/git/commit` = `git ⊓ commit`) —
  `git`, `lazy-loading` are key prefixes, not occasions that hold. Meet
  survives only at nested sets (NEST_MEET).

## Strata

- L0 PATHS — filesystem; LLMKB-SUBDIRS lives here.
- L1 GRAMMAR — well-formed banks, definable from L0 by reserved names.
- L2 OCCASIONS / FIRING — what paths mean; laws and the one theorem.
- L3 PULLERS / POLICY — who notices a begin, which occasions earn a set.
  Not derivable from below; every `+`/`!` lives here.

## Ledger

```
* PATHS+: ontology -- path, component, namespace directory, file
  * NAMESPACE!: a plain directory is a key prefix and nothing more: the
    occasion a file names is its whole path under the juncture, and the
    directory contributes no predicate of its own (`before/git/commit`
    names one occasion, "git commit"). Stale when: any tool or reader
    assigns a plain directory a meaning beyond its name.
    * // LLMKB-SUBDIRS, ruled this session; the S3 delimiter analogy is
      its smallest example: list-with-delimiter shows prefixes, without
      shows keys.
  * GOVERNANCE+ <- NAMESPACE: schema and CLAUDE.md resolve by walking up
    through plain directories to the nearest `.kb/`; `.kb` marks a
    governed collection, a plain directory marks a prefix.

* GRAMMAR+ <- PATHS: ontology -- bank, set, juncture, point juncture,
  stub. Coins: set (a directory of shape {before,after,when,while}, each
  optional), juncture (one of those four reserved names), stub (a
  `while/X/` line in a listing whose contents are not yet listed)
  * SHAPE: bank := set; set := before/ after/ when/ while/; before|after|when
    hold files under namespace directories; while/ holds sets, one per
    child directory. Recursive without limit; the bank is the outermost
    set. Smallest example: `while/making-code-changes/before/writing-
    python-code.md`.
  * RESERVED <- SHAPE NAMESPACE: the four juncture names are reserved at
    every namespace level, so `before/git/while/` is malformed (a namespace
    may not spell a juncture) and `while/X.md` is malformed (while holds
    sets, not files; "read this while X" is already `when/X.md`).
    * // replaces the earlier "constraint 1" and "constraint 3"; both are
      consequences of reserving the names. SET_DESC? may amend the
      `while/X.md` clause.
  * FOURTH!: the interval juncture is spelled `while`, pairing with the
    gerund slugs (`while making code changes`); `during` wanted nouns.
  * WHILE_KEY <- SHAPE NAMESPACE: what `while/` buys the grammar is
    distinguishability: a directory under a point juncture is a namespace,
    a directory under `while/` is a set, decidable from the path alone.
    Its point-vs-interval gloss is true but not load-bearing; a program
    needs only the prune key.
    * // a `when/` directory could not have served: `when/git/` would be
      ambiguous between prefix and set.
  * SLUG_LINE!: the skill sentence "the trigger slug, not the directory
    shape, carries the categorization" is false under SHAPE (junctures
    are directories) and is struck.

* OCCASIONS+: ontology -- occasion, moment, holds, begins, entails, top,
  meet. Coins: occasion (a predicate on moments), begins (the first
  moment an occasion holds), entails (X entails Y when every moment X
  holds, Y holds), top (holds at every moment), meet (conjunction)
  * PREORDER: entailment is reflexive and transitive with top as greatest
    element and meet as greatest lower bound; occasions form a
    meet-semilattice. Stale when: an occasion is admitted whose truth
    varies with something other than the moment.
  * BEGIN_AT_DECISION+: an activity occasion begins at the decision to
    enter it, not at its first action. Declined alternative: begin at
    first action, under which every `before/` member of a set fires before
    its set is installed. Stale when: TIMELY fails on a set whose members
    are all `before/`.

* FIRING+ <- GRAMMAR OCCASIONS: ontology -- trigger, fires, installed,
  install, occasion-of. Coins: trigger (a file under a point juncture,
  read as (juncture, occasion, body)), fires (the moment its juncture
  relates to its occasion: before = the moment preceding the action that
  makes the occasion hold, after = the moment following its end, when =
  any moment it holds), installed (a trigger is installed at t when its
  listing line is in context at t), install (list a set)
  * INDEXED <- SHAPE: a bank is a family of trigger sets indexed by
    occasions -- `while/X/` is the set at X, the bank is the set at top --
    and a trigger belongs to exactly one set (its path). No operation moves
    a trigger between sets; this is a partition, not a fibration.
  * ENTAIL!: every trigger in the set at X has an occasion that entails X.
    Contrapositive is the author's original test: if X does not hold, no
    member can fire. Smallest example: writing-python-code entails
    making-code-changes; spawning-a-sub-agent entails no candidate X below
    top and so stays in the top set. Stale when: a member is filed whose
    occasion can hold while X does not.
  * NEST_MEET <- INDEXED ENTAIL: a set reachable only through
    `while/X/while/Y/` is the set at X meet Y, whether or not Y entails X;
    its members entail both. Meet lives at sets, not at namespaces.
  * BEGIN+: the set at X is installed at the moment X begins, by listing
    it; nothing else installs it and nothing uninstalls it. Stale when: any
    delivery path installs a set on a condition other than its occasion
    beginning (a hook, a schedule) -- the puller changes and the "at
    begin" clause needs re-reading.
  * MONOTONE <- BEGIN: the installed set is monotone in time within a
    context.
  * NO_UNINSTALL <- ENTAIL: a trigger whose set's occasion has ended cannot
    fire, so installed-after-end is harmless and no uninstall is needed.
  * TIMELY <- BEGIN_AT_DECISION ENTAIL: for every trigger T in the set at X,
    X begins no later than T fires: a `before/` member fires at the moment
    preceding its action; deciding on that action decides on X (entailment
    at the level of intent), so X has begun.
  * NOTICED?: the agent notices X begin, for each X that heads a set. Not
    derivable; per-occasion empirical. What an answer settles: which
    occasions may head sets at all.
  * SOUND <- ENTAIL BEGIN TIMELY NOTICED: at every moment, every trigger
    that fires is installed. Proof shape: T fires at t; occ(T) holds or is
    about to; by ENTAIL X holds or is about to; by TIMELY X began by t; by
    NOTICED+BEGIN the set at X was listed by t; by MONOTONE it is still
    installed. The theorem rests on exactly one open premise.
  * RECOG!: a trigger cannot gate the knowledge that fires it (the skill's
    standing rule).
  * ROOT <- RECOG INDEXED: the set at top is installed by the host context
    (CLAUDE.md), never by a trigger in the bank -- there is no
    `before/first-tool-call.md` root, because an agent would have to read
    the bank to learn to read the bank. The static stanza is the one
    install that is not a begin-notice.
  * STUB_BOUND <- BEGIN NAMESPACE: expanding a stub before its occasion
    begins costs exactly what today's eager listing costs; omitting stubs
    breaks RECOG (the agent cannot notice a set it has never seen named).
    So stubs are shown, and early expansion is bounded, not a failure.
  * LIST_CMD <- SHAPE RESERVED: one command installs any set at any depth,
    printing sub-sets as stubs: `find SET -path '*/while/*/*' -prune -o
    -print`. -- certified(scratch bank with a nested set, 2026-09-19:
    root run printed `./while/making-code-changes` bare; run inside it
    printed its junctures and `./while/debugging` bare)
  * TOOL!: `llm-must-read-ls` remains as the single named instance of
    LIST_CMD; CLAUDE.md names it rather than spelling the prune.
  * VOCAB <- RECOG WHILE_KEY: the host context carries one recognition
    line -- "a `while/X/` line is a set: when X begins, run the same
    command in it" -- and nothing else about the grammar; everything else
    is in the tree.

* PULLERS+ <- FIRING: ontology -- puller, mechanical, judgment. Coins:
  puller (whatever performs an install), mechanical (a puller that fires
  on a runtime event with no agent judgment), judgment (a puller that is
  the agent noticing)
  * SCOPES <- INDEXED BEGIN: the skill's three scopes are sets over
    mechanical occasions -- project bank = set at "cwd is in this repo",
    skill bank = set at "this skill is loaded" -- pulled by the runtime.
    Same construction as `while/`, different puller.
  * FREE_RECALL <- SCOPES NOTICED: a mechanically pulled set discharges
    NOTICED for free; a judgment-pulled set spends it. This is the whole
    content of the early "shard only on mechanical gates" instinct, and
    why it was too strong: judgment pullers are admissible where NOTICED
    is cheap.
  * GRADIENT+ <- FREE_RECALL: NOTICED is discharged per occasion, not per
    bank: each `while/X/` has its own puller, and an occasion moves from
    judgment to mechanism the day a runtime can detect X begin -- with no
    change to the tree, since the listing is the semantics and mechanism
    only strengthens delivery of the same meaning (llm-triggers `floor.md`).
    The migration llm-triggers describes is this one column changing, one
    row at a time. Stale when: a mechanical puller delivers something other
    than the file body the listing would have delivered.
  * BACKSTOP <- BEGIN_AT_DECISION TIMELY GRADIENT: a mechanical puller
    anchored to an action (a hook on Edit) fires after planning, so for a
    set with `before/` members it violates TIMELY on the first action; it
    can replace judgment only for sets whose members are `after/`/`when/`
    or whose occasion begins at an observable action, and is otherwise a
    backstop under the judgment puller -- late for an approach-shaping
    body, in time for style bodies. Defense in depth is the floor's own
    rule, so this costs nothing new.
    * // making-code-changes has ANY-code-change (approach) and four style
      bodies: a hook backstop catches four of five on a judgment miss.
  * SET_DESC?: a set is a directory and has no frontmatter, so the grammar
    has nowhere to put the decidable condition a mechanical puller needs.
    Candidates: a descriptor file inside the set (`while/X/.trigger.yaml`),
    or relaxing RESERVED to admit `while/X.md` as the set's descriptor
    rather than a trigger body. An answer settles whether RESERVED's
    `while/X.md` clause survives.

* POLICY+ <- PULLERS: ontology -- earns, cost, session. Coins: earns (an
  occasion earns a set when heading one is expected to lower total
  listing cost without raising misses)
  * GATE_RULE!: an occasion X may head a set when (1) ENTAIL holds for
    every member, (2) X begin is noticed at least as reliably as each
    member's occasion -- broad and concrete, an action or a tool, never a
    mood, (3) TIMELY holds. (1) and (3) are laws above; (2) is NOTICED
    priced.
  * ECONOMICS+ <- GATE_RULE STUB_BOUND: a set earns its place when X holds
    in a minority of sessions and heads at least three triggers; an
    occasion near top (git, using-claude-code-tool) stays namespace
    nesting because the pull is paid every session for no saving; one or
    two files stay flat. Stale when: pull cost changes (a hook installs
    sets) or the bank doubles.
  * GATE_BODY+ <- ROOT ECONOMICS: the point trigger for a set's occasion
    lives inside the set, as `while/X/before/ANY-<x>.md`, not beside the
    stub at top: the stub is the gate, and two top lines for one occasion
    is aliasing by another name. Declined: keep `before/making-code-
    changes.md` at top as belt-and-braces.
  * LEDGER_HOME!: these claims file to a new
    `llm-must-read-kb/claims.kb/design.claims.kb/` shaped like llm-kb's;
    NAMESPACE files to `llm-kb/claims.kb/design.claims.kb/`. ADRs are not
    used.

* QUESTIONS+: what the basis was bought to settle, sorted
  * DECIDED: occasion-first order (`while/X/before/Y`, never
    `before/Y/while/X` -- the "if" idiom was rescuing the wrong order);
    `while` as the word; one list command; the top set is the bank; stubs
    shown.
  * DISSOLVED: "reference.kb as the shard home" (sets live in the bank by
    SHAPE); "lazily/" (laziness is BEGIN, not an occasion); "before/first-
    tool-call.md as root" (ROOT); "stub or omit" (STUB_BOUND); "no new
    gates ever" (a proxy for NOTICED); "P(gate) x P(entry)" (assumed
    per-trigger recall constant; the only residue is NOTICED); "a lazy/
    eager marker" (the juncture is the marker); "during under before"
    (GRAMMAR fixes the order).
  * NOTICED? (restated: the one empirical question): which occasions are
    noticed reliably enough to head a set -- measurable by session
    archeology, occasions-vs-installs.
  * COMPACTION?: after context compaction, what re-installs the top set
    and every set whose occasion still holds? A pre-existing hole that
    sets widen from one re-list to n. An answer settles whether BEGIN
    needs an "or context reset" clause.
  * GIT_SET?: does git earn a set once it has an `after/` member? Turns on
    ECONOMICS' pull-cost term.
  * RESOLVER?: `must-read://DIR` resolves `DIR/must-read.kb/`; whether it
    also takes a set path, or LIST_CMD is used directly, is unsettled and
    cosmetic.

* INSTANCE+ <- POLICY: the proper nouns, thrown away first
  * MCC_SET+ <- GATE_RULE ECONOMICS GATE_BODY: `while/making-code-changes/
    before/{ANY-code-change, writing-python-code, writing-rust-code,
    writing-bash-scripts (+ template), writing-tests}.md`; rust renamed
    on the way in so its slug entails the occasion. Top set drops from 34
    to 29 lines plus one stub.
  * STRIPE+ <- SCOPES: `running-a-stripe-CLI-command` moves to its
    project bank; a mechanical puller is available.
  * REST: every other trigger stays where it is.
```

## Underspecified, found by elaboration

- NOTICED is layout-invariant; the tree localizes it to stubs, and
  llm-triggers is the mechanism that retires it stub by stub. What that
  theory owes this one is SET_DESC — a home for the condition.
- COMPACTION? — no claim covers re-install; the current stanza's "before
  your first tool call" does not re-fire in a resumed context either.
- Whether `when/X.md` and a hypothetical single-body `while/X/` are the
  same thing: RESERVED forces the answer; the reason (aliases) is only a
  `//` note.
