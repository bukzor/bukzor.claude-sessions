# 2026-09-19: cross-read of the two live peers on the same subsystem

Peers: `../must-read-sharding.md` (session `ba648ef5`, ledger
`must-read-sharding.kb/2026-09-19-000-formal-ledger.md` + `-001` patch) and
`../judgment-protocol-redesign.md` (session `93639e4d`, seven open questions
in its `.kb/`). Both live at time of reading (files modified 14:04–14:11).
Nothing below is adopted as a ruling; each item is that author's claim,
checked against this session's record.

## Adopted (consistent with this session's evidence)

- **ROOT / RECOG** (ledger L134–140): the top set is installed by host
  context (CLAUDE.md), never by a bank entry -- "an agent would have to read
  the bank to learn to read the bank." Option B keeps the installer in host
  context (frontmatter is host context). The proposed review entry
  (`must-read.kb/when/planning-a-turn/…`) is bank-resident but is not a
  root: it gates nothing about its own recognition, and this session already
  noted it cannot rescue step 0.
- **BEGIN_AT_DECISION** (-001): an occasion begins at the decision to enter
  it, "the decision moment is a deliberating state, the first action a flow
  state, so the begin-notice is placed where noticing works." Settles the
  juncture question in favor of `when: planning a turn` over `after: each
  user turn`. Same move as the sibling's pre-commit-at-assertion.
- **COMPACTION?** (both peers; ledger "Underspecified": *"the current
  stanza's 'before your first tool call' does not re-fire in a resumed
  context either"*). This session's open question #1 is that question; the
  record here is its worked instance -- three `compact_boundary`s, CLAUDE.md
  re-injected each time, zero re-installs. Not duplicated; linked.
- **Turn-1 reflexive sweeps** (`judgment-protocol-redesign.kb/05-`,
  ledger ECONOMICS precision): 6 of 34 reads of the judgment entry were
  turn-1 `cat`s of several must-reads before any target file -- four `/align`
  sessions on 09-02 (`781aafd7`, `65ac3786`, `2672bc2f`, `e4d7962a`). Those
  four are in this session's *old-wording, skill-first, 7/7* cohort. So the
  old IMPERATIVE stanza bought 30/30 installation at the price of eager
  over-reading. Two consequences here: "restore the emphasis" is doubly
  wrong (it is what produced the over-reads); and the review directive must
  say *review the listing, read only entries whose occasion this turn
  reaches*, or it reintroduces the same precision loss under a new name.

## Extended (their claim is about a different object; this record adds a variable)

- **MODE_MISS / NOTICED restated** (-001): noticing "is governed by the
  agent's mode at the moment, not by the listing's distance or length";
  begins arriving mid-flow are missed, begins arriving during deliberate
  planning are caught. This session is a miss **in deliberating mode**: `L22`
  is a planning block, explicitly about pre-action triggers, and step 0 was
  still not retrieved. Mode is necessary, not sufficient. The variable that
  moved in the 45-day table is the host stanza's wording (`4614693`, 09-04):
  30/30 before, sonnet 5/7 plain and 0/2 skill-first after; fable/opus
  unaffected. Their audit measured a bank entry's NOTICED; this measured the
  root install's. Different objects, so no contradiction -- but the root's
  miss rate bounds every entry's, which is the next item.
- **`06-` (delivery hole vs. NOTICED deficit on the 63 no-read folds)**:
  their proposed test splits by "was there a `compact_boundary` between the
  last listing and the concession." This record shows a second delivery
  hole the test does not name: **never installed** -- on sonnet after 09-04,
  2 of 7 plain and 2 of 2 skill-first sessions ran no listing at all, and
  their audit window (08-31..09-18) straddles 09-04. The split should be
  three-way: listing present / lost at compaction / never run. Filed as a
  claim for the user, not sent.
- **RECENCY retracted** (-001, DISSOLVED): their retraction concerns a
  trigger's position *within* the tree or listing. This session's
  displacement finding is source-vs-source -- the skill body's bare
  `triggers:` arriving in the user turn versus CLAUDE.md's occasioned step 0
  in system context -- and its own placement evidence (CLAUDE.md-resident
  wording at 30/30 pre-09-04) agrees that location is not the lever. Nothing
  here re-asserts RECENCY; noted so it is not read that way.

## Candidate this session had declined, reframed by the peers

- **GRADIENT / BACKSTOP** (ledger L170–187, `07-`): a mechanical puller on
  the action fires after planning, so it is a backstop under the judgment
  puller, "defense in depth is the floor's own rule, so this costs nothing
  new." Applied to step 0: a `PreToolUse` hook that injects `llm-must-read-ls
  ~` as context on the session's first tool call is exactly that backstop.
  It answers the user's stated objection to a `SessionStart` hook (sessions
  with no tool calls) by construction -- it fires only when a tool is called
  -- and its lateness costs only the first call's own `before/` entries,
  which is what the judgment puller is for. It cannot honor the "explicitly
  requested calls exempt" ruling (a hook cannot tell), but the listing is
  121 bytes for `before/git` and ~1.4k for the whole bank. Surfaced for a
  ruling; not built.

## Wants

- From `93639e4d`: the `06-` split, run three-way (present / compaction-lost
  / never-run), and the never-run share by model.
- From `ba648ef5`: their VOCAB line ("a `while/X/` line is a set: when X
  begins, run the same command in it") is a host-stanza edit; option B is a
  host-stanza edit. They should land as one change to `~/.claude/CLAUDE.md`,
  with the lint run once.
