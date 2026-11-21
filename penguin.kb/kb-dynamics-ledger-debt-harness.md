---
cwd: /home/bukzor/repo/github.com/bukzor/ideation.epistemics
session:
  uuid:
    - 24a0acae-92e5-48b9-bb1b-6d18bfab6c51
    - 8a955044-2f8f-45fd-a6f5-812883410664
    - f65fbdf3-2597-44a8-b099-ee0e9d546ed2
    - 9b6f24ad-884d-4152-9c1c-d294ae75325d
    - dfc18e9d-7f4c-4c32-b52c-b46f668c557e
  started: 2026-09-10T10:40:07-05:00
  ended: null
---
# kb-dynamics: Executable Model of a Claim Ledger Under Change

Building `ideation.epistemics/kb-dynamics/`: a claim ledger as a state,
agent and owner edits as moves, rules as gates, and a debt function no
permitted move may raise -- tested by property-based generation and
bounded enumeration with the agent replaced by an operation generator,
never modeled. Designed in the chat captured at
`ideation.epistemics/docs/dev/chats/claude/Created=2026/09/09/14:14:39-05:00/`
(the "meta-meta-meta" headache: N mature ledgers whose review had become
a wall of text; the answer is a graph query, and the harness is the
TDD-style sandbox for getting the query and the rules right before
touching real ledgers).

The harness lives in `ideation.epistemics/kb-dynamics/`, with its ledger
at `docs/dev/claims.md`. It is independent of `session-model/` and the
{TL, RN} schema; the outer vocabulary enters through one theory only,
`imported-terms` (fourteen `+` claims from session-model's `law` and
`budget`, the realm's root graph, and llm-claims' notation), the only
theory whose `why:` may leave the subpath. `imported-terms.verify.py`
beside it certifies five things. The spine (problem, debt, method) is
now grounded in the owner's rulings: the reviews are the cause and the
ledgers stay; debt is wanted and only unrepayable debt is rot; trust is
per claim; moves carry authority, not hands. `python/` and `examples/`
hold the debt function, per-claim trust, the move table, the random and
repairing agents, and all five properties running. Next build items are
in `ideation.epistemics/.claude/todo.md` under the kb-dynamics entry.

## Open work

- [x] First red test (2026-09-11, `dd63738`): `examples/` and `python/`
      exist; properties two and three pass on the owner's three
      confusions and one bad state per rot kind; debt is the vector,
      effective basis the fold. `transition`, `rules`, and the generator
      wait on property one
- [ ] The five properties from the chat, in order: agent-only sequences
      never raise debt; every known bad state has debt > 0; every debt-0
      state satisfies every goodness predicate; each rule has a sequence
      that flips when it is removed; from any reachable state some
      sequence reaches debt 0
- [ ] Reconciliation pass, later and deliberate: each `imported-terms`
      claim becomes a real import or a recorded divergence. The
      likeliest real collision is the chat's basis/wording split
      against `standing` and the warrant-by-field-presence schema in
      `repo-weight-derivation.md`
- [ ] Two agent choices await veto in
      `ideation.epistemics/.claude/todo.kb/suggestions-to-audit.kb/kb-dynamics-*.md`:
      the subpath name, and `IMPORTED_` labels with filename-as-word

From Grounding sitting, 2026-09-11:

- [x] The eight opens of the sitting are ruled (`f65fbdf3#L815`,
      `#L995`); two remain open by the owner's word: `ROT_LIST`
      (exhaustiveness of rot kinds and of the four routes to
      unrepayability, for the exploration) and `ROUND_TRIP` (deferred to
      the reconciliation pass)
- [x] Proposals entailed by the rulings, applied on the owner's word:
      `FIVE_PROPERTIES` property one is "never leave debt unrepayable";
      `MONOTONE` is relabelled `NO_SILENT_RAISE`; `METHOD` no longer
      coins "target ledger"; the layout's `test_monotone.py` is
      `test_repayable.py`
- [x] `TRUST_TEST` stressed at the corners (`0def348`): `trust.py`
      computes every reading, six corner states pin the verdicts, and the
      open `TRUST_CORNERS` beside `TRUST_TEST` holds the two decisions it
      reduces to. `ROT_LIST` untouched

From Harness sitting, 2026-09-11:

- [x] Sufficiency entered the claim, not the arrow (`0ab6d8b`): a
      property of the grounds together; the weak-arrows corner is a bad
      state. The arrow's kind waits on a property that reads it
- [x] Property one built as hidden debt (`OWNER_VIEW`, vetoable): a log
      of steps replayed under the sanction table (the move table's actor
      column) gives the owner's view; hidden is its debt beyond the
      record. The constant-worst agent found the two rules, only the
      owner settles wording and only the owner stipulates; property
      four's flip test shows each has witnesses and a dead-weight rule
      has none. The earlier observation stands, refined: in the sandbox
      only the "no pathway" route is expressible, and it arises only as
      an agent move hiding rot
- [ ] Found, for `ROT_LIST`: an agent retracting a settled `user` claim
      hides no rot, since a clean claim carries none, yet the owner's
      content is gone. Needs the log, not the state
- [x] The random agent (`tests/strategies.py`, hypothesis strategies
      drawn against the live state) found, one shrunk step at a time:
      agents retract a user claim; agents merge an owner ruling into its
      dependent; agents add settled wording; agents add `basis: user`.
      Five rules now, each with a constant or random witness. Its second
      find also exposed a debt bug: a claim in a cycle was never a
      proposed root, so a cycle of derivations had debt zero and broke
      `EMPTY_QUEUE_TRUST`'s forward direction. Pinned as a bad state,
      fixed: every cycle member is a root
- [x] The owner challenged the five rules as worded ("agents never
      retract owner claims" refuses an agent acting on buy-in) and
      ruled "authority not hands": a move is tagged by the authority it
      carries, per-move by an address or standing by a stipulated rule.
      Filed as `AUTHORITY_NOT_HANDS` (user); `MOVE_TABLE`, `MODEL`,
      `IMPORTED_MOVE`, and `GENERATOR_NOT_AGENT` amended in place.
      `Step.authority` is `Owner(license)` or `Agent()`; the five rules
      collapse to two: owner-only changes need owner authority, and
      unlicensed merges preserve content. On THREE21 versus THREE12:
      the sandbox already merges them, since content is an atom set;
      whether the field may merge near-duplicates unasked is a widening
      of `UNASKED_MOVES` the owner has not ruled
- [x] Property five: `agents/repair.py` is the owner who rules yes on
      every item after the unasked moves; it clears every recorded
      state and every random-reached state within sixty steps
      (`REPAIR_WITNESS`). `Close` entered the move table: a question,
      leaf only, removed. All five properties run; 53 tests
- [ ] Next: bounded enumeration (`enumerate.py`) for proof-strength
      at small depth, or the loader for real ledgers, which `ROUND_TRIP`
      blocks (wording has no sigil on disk). The owner's call which.
      The peer session shares this worktree and reshapes the ledger
      under the same commits, so re-read before editing claims; the
      owner asked that I not message it
- [ ] `python/` used Python 3.14 under `requires-python >=3.13`; black
      is pinned to py313. `.envrc` at the repo root is untracked and not
      mine

From Review sitting, 2026-09-16:

- [x] Reviewed, filed, verified: 93 ledger files validate; mentions,
      flatten, and the import certification clean; 64 tests pass with
      one expected red (the conflict example)
- [ ] Awaiting the owner's veto, agent-authored: the `authority:` object
      shape (`about`, `words`, `address` as one string); "faithful" as
      the word; `OBJECTIVE` placed in `debt.kb/` for theory order;
      `RESOLUTION` as the label; `LEAF_REPAYS`; the conflict example as
      an expected-red test; the $150/hour rate on file
- [ ] Next build items are in `ideation.epistemics/.claude/todo.md`
      under the kb-dynamics entry: the conflict relation in the state,
      the ledger-to-State adapter, authority normalization, the weight
- [ ] `discourse-graph-claims-readable-as-ledger-claims.md` is the
      planned session for the queue head

From Naming branch, 2026-09-16:

- [ ] Rule `NAME_LOCUS` (`llm-claims/claims.kb/design.claims.kb/good-smells.kb/names-outlive-contents.md`):
      it now asserts the locus rule for file names, which is the
      gating question of the parent's rename plan
- [ ] Declined, for the record: a number-word scan over labels and
      filenames as a tool check. The rule is judgment-shaped; the scan
      catches one species and flagged four inherent names in eight

## Addenda

`kb-dynamics-ledger-debt-harness.kb/` holds one dated write-up per session
that picked this entry up: its findings, rulings, and process notes.
`ls` gives the timeline.
