---
cwd: /home/bukzor/repo/github.com/bukzor/ideation.epistemics
session:
  uuid:
    - 24a0acae-92e5-48b9-bb1b-6d18bfab6c51
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

First session (2026-09-10): scaffolded the subpath and its ledger
(`docs/dev/claims.md`, commit `a423174`). The owner's ruling that shaped
it: keep the work independent of `session-model/` and the {TL, RN}
schema, and make the later reconciliation cheap by importing the outer
vocabulary through one theory only. That theory is `imported-terms` --
fourteen `+` claims (rule, state, move, permit, oblige, example, flip,
coverage from session-model's `law`; load event, weekly cost from
`budget`; stipulated, certified, obligation from the realm's root graph;
standing from llm-claims' notation) -- and it is the only theory whose
`why:` may leave the subpath. `imported-terms.verify.py` beside it
certifies five things and was seen failing on a planted violation.
Nothing else in the layout exists yet.

- [ ] First red test: a hand-written bad state with debt above zero.
      That brings `examples/` (bad states, good states, traces with
      provenance) and `python/` (`model`, `transition`, `rules`, `debt`,
      kept pure and total for a later Lean port) into existence. Start
      from constants -- `debt = lambda kb: 0`, `rules = []` -- and let
      each property demand the next rung of agent fidelity
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
