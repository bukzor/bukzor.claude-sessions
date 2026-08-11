---
cwd: /home/bukzor/repo/github.com/bukzor/ideation.epistemics
session:
  uuid:
    - 9ebe2c81-c177-4c93-9ab9-031b23ff3411
    - bc035331-3259-4a75-9def-476a3ce64eeb
    - cea2b7a6-c009-4e4b-b856-66434ae55978
    - 1fab91a6-1013-4508-9fe7-aeda9aadfa89
  started: 2026-07-24T11:30:00-05:00
  ended: null
---
# Claim-Ledger Skill Revision + Epistemics Realm Founding

Reviewed the captured "Knot theory representations for GPU computation"
chat (prototype.chatfs `chatfs.demo`), then brought
`Skill(llm-claim-ledger)` up to date with its design.ledger.kb: sigil layer
(`?`/`!`), `stipulated` harmonized as fiat-warrant, `claim
accept`/`contest` commands, and the implicit-obligation paradigm
(obligation derived from openness × downstream weight — `obligated`
status removed). Founded `~/repo/github.com/bukzor/ideation.epistemics`
as the realm's home: discourse graph (sources/definitions/claims/
questions), the four ACS/FP2/STTT/knot transport prompts extracted
verbatim, `ladder.md` rung-correspondence synthesis, todos. Committed
and pushed in `bukzor-agent-skills` (`4d6c287`).

Pickup (second session): persisted `Skill(llm-claim-ledger)`'s design
rationale as `design.ledger.kb/good-smells.kb/` (9 criteria — writing
clarifies thinking, no forced early decisions, plus 7 economy
criteria), with its own schema, validated clean. In
ideation.epistemics: filed `background.kb/prior-art.kb/bukzor.kb/` (5
operator-provenance prior-art entries), and added a *report*-kind
source for this notation-design session itself
(`sources.kb/claim-ledger-notation-session.md` — no transcript exists
for it, unlike the captured chat) plus three claims (sigils trail not
lead; ACS's four presumed statuses collapse to two — stipulation vs.
assertion, with assertion being "effectively a question"; retraction is
revision-to-tombstone, not a separate primitive, which is why labels
must name loci rather than conclusions) and one pointer claim to the
good-smells criteria. Surfaced a real inconsistency as a question
rather than silently fixing it (see below).

Pickup (third session, 2026-07-28, cwd
`prototype.personal-reasoning-management`): split the skill in two by
audience. `SKILL.kb/` is now the operator's manual — 11 directives, all
frontmatter stripped; `design.ledger.kb/` is the claim ledger, four theories
ordered by ontology inclusion (`stance → purpose → good-smells →
notation`), with `design.ledger.md` as the reader's entry point. The tell
that forced the split: 9 of 12 `SKILL.kb/` entries read `standing:
warranted` — a field that near-constant carries no information — and the
3 `fiat` entries turned out to be design commitments that had leaked into
the manual. Confinement immediately caught a misplacement (`PARSIMONY`
was arguing from sigils, which `stance`'s ontology doesn't admit). Also:
canonical claim schema in `design.ledger.kb/jsonschema/` with four `$ref`
stubs (verified enforcing, not silently passing);
`SKILL.jsonschema.yaml` deleted; `SKILL.md` gained the cycle rule and a
`design.ledger.md` pointer; `CLAUDE.md` now warns that this
`design.ledger.kb/` is *not* the layered `Skill(llm-design-kb)` kind that
`llm-vitals`/`llm-triggers` have.
Commit `528f72c` (bukzor-agent-skills). The theory/ontology/confinement
apparatus itself came from the prototype repo's own design ledger this
session — the two are deliberate copies at different fidelity, and
divergence between them is the drift check.

Pickup (fourth, same day): names. `design.kb/` → `design.ledger.kb/`
(`8c4b6c7`) — the bare name promised the layered `Skill(llm-design-kb)`
kind, and `$subject.$kind.kb` already names the governing artifact in the
prototype (`design.ledger.kb/`, `initial-setup.discourse.kb/`). Then every
label was rewritten (`13d53a9`): they had all been 2–5 char initialisms
because the claim schema said `^[A-Z]{2,5}$` — a constraint invented while
writing the schema and then obeyed while writing the claims, never a design
commitment, and one that would have rejected `SKILL.md`'s own worked example
(`PARSER`/`MULTIBYTE`/`DECODER`). Pattern is now upper snake case of any
length plus the no-prefix rule (sigils trail the label, so `grep LABEL` must
stay unambiguous). The claims shared with the prototype now carry that
ledger's names **verbatim**, so the two-copies drift check is `grep LABEL`
across both repos rather than a correspondence table; the direction was
forced by reference count (the prototype's labels had ~19 citations, the
skill's had two). A later session (`006b7a5` / prototype `3d99f74`) extended
the shared set to thirteen: `REGRESS_ACT`, `AUTHOR_ACTS`, `PARSIMONY`,
`ARROWS`, `IMAGE`, `LEAST_FIX`, `CLAIMS_ONLY`, `STIP`, `WARRANT`,
`SELF_CONTAINED`, `FRESH_READER`, `PROVISIONAL`, `TRICHOTOMY` — verified
present on both sides 2026-07-28.

Live follow-ups (tracked in the repos' own todos):

- [ ] ideation.epistemics: execute `prompts/` in fresh contexts with
      the deltas in `prompts.md` (acs → fp2 → plugins)
- [ ] ideation.epistemics: adjudicate
      `questions.kb/acs-status-set-mirror-chat-weight.md` — does
      `definitions.kb/acs.md`'s status set (`described/stipulated/
      certified`) deliberately diverge from the settled chat-weight
      set (`asserted/stipulated/certified/retracted`), or is it stale?
- [ ] llm-claim-ledger: USER re-pastes Core into claude.ai prefs
- [ ] llm-claim-ledger: verify the sigil set against the derivation
      chat — blocked, no capture path exists for a Claude Code session
      the way chatfs captures claude.ai; revisit if that ever changes
- [ ] llm-claim-ledger: score `design.ledger.kb/good-smells.kb/` against a
      second notation — 8 of its 11 entries are `standing: open`
      because the whole set came out of one design conversation, so
      nothing has yet had the chance to fail one
- [ ] llm-claim-ledger: re-test the labels against `NAME_LOCUS` after
      that scoring lands — `LEAST_FIX` and `CLAIMS_ONLY` encode answers
      where `CYCLES`/`NODE_TYPES` would name the loci, but both are
      shared verbatim with the prototype and `CLAIMS_ONLY` is certified
      there, so this waits on `NAME_LOCUS` earning better than `open`

Pickup (2026-08-09..11, cwd bukzor-agent-skills, fourth uuid): the arc
produced `Skill(review-open-questions)` and ran the corpus's own review
passes through it. Renames landed on the user's ruling: the skill pair
is now `llm-claims`/`llm-claims-kb`, every `*.ledger.kb` is
`*.claims.kb` (ADR `2026-08-10-000` there; old names above are
provenance), and PRMS's corpus theory dirs took `*.prms.kb` (its
`5aa251c`) after failing the claims-kb shape test. Rulings filed:
PLACEMENT (user-corrected cost accounting: `!` banks sunk judgment,
`+` issues debt), SPLIT, TIERS signed `!`, claim-shape directive plus
the IMAGE/PROVISIONAL/CHEAP sweep, dosage trigger renamed to
temptation shape. Live follow-ups: `.prms.kb` <-> `.claims.kb`
theory-merge items (both repos' `.claude/todo.md`), task-5 future
planning (skills repo todo), Core-block re-paste (unchanged, still
USER).
