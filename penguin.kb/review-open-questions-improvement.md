---
cwd: /home/bukzor
session:
  uuid: # chronological; append your uuid when picking this entry up
    - c78bbbb7-a161-4ecb-addb-8c5bdfa4abcc
  started: 2026-08-28T12:55:05-05:00
  ended: null
---

# Review-Open-Questions Improvement Pass

Owner's commitment ("we'll go back and improve the skill afterward")
after the skill's walkthrough failed twice in one sitting before a
third format worked. The skill is
`~/repo/github.com/bukzor/bukzor-agent-skills/review-open-questions/`.

- [ ] Improve `/review-open-questions` presentation guidance from the
      exhibits below (all from session c78bbbb7, 2026-08-28)
- [ ] Ratify or amend `llm-triggers/design.kb/use-cases.kb/goal-gated-conditions.md`
      (`status: proposal`, bukzor-agent-skills 99166b1) — ride-along
      from the same sitting

Exhibits, in order:

- Prose per-decision sections (priors/decision/alternatives/reject/rec):
  "This format sucks. Can i get more structure please?"
- Dense lettered menu (D1a..D4b): "too dense for me to comprehend and
  rule on" — symbolic backreferences (D-numbers, SHAs, paths) blocked
  comprehension; owner asked for universals: "what i'd do, what i want."
- Plain standalone questions worked, though "still a bit unstructured,
  for my taste" — the sweet spot is structured *and* universal, still
  unfound.
- Three options-pairs were false dichotomies, called out one by one;
  the redesign bank entry's "a binary design question usually names
  the wrong variable" razor applies to authoring a decision's options.
- Rulings came back as principles, not picks ("if the agent has no
  basis for judging relevance without reading, read unconditionally");
  the skill should expect principle-shaped replies and apply them to
  the particulars itself — its current reply-adjudication section
  covers rulings and questions but not this.
- One decision was unanswerable from descriptions alone: the owner
  asked "Hm? Where?" and settling required both artifacts read in full
  (the trigger file and its target), which then dissolved the question
  entirely. Present artifacts, not summaries of artifacts.
- (added later, same day) The format the owner endorses: "Please craft
  a listing of easy-to-understand, easy-to-answer questions that gives
  both you and me confidence that you've chosen the correct
  'direction' to correct each misalignment" — then H2 per group of
  questions, H3 per question: "That seems like a good organization,
  i think."

Corpus (claude-code-archeology sweep, 2026-08-28): moved to its
durable home, `~/.claude/docs/dev/devlog/2026-08-29-000-the-asking-
law-and-what-each-of-its-rules-answers-to.md`, which holds the JSONL
line-cites and maps each rule of the asking law to the exchange that
produced it. Two cites that stayed behind because they are about the
*sweep*, not the asking form: d5828a77 L1066 ("devlog is
inappropriate, for a durable home for ruling persistence … Infer what
the correct claim set … would/should have been, counterfactually.
Then make it so."), and c814b73b L1457 ("will
/review-open-questions find your open-items filed easily?" — filing
opens discoverably to the next sweep is part of the contract).

Contradiction resolved by ruling (2026-08-28 pm): reply-shape routing
rejected — "how is agent to tell if the **reply** is word-size? It
can't." File-register always required; chat carries tally + paths +
editor command. "We can add special cases later if the cost/benefit
seems worthwhile."

Rulings, 2026-08-28 pm (from the direction-check batch — which itself
repeated the indicted chat-QnA workflow; owner: "it still sucks, real
bad"):

- Claim-labels over numbers ("Numbers get ambiguous way too quickly,
  can't represent graph structure well"); plain language.
- Five-part skeleton is a ruled failure: "Too often it's just five
  similarly-opaque phrasings of the same thing." Keep the intent
  (multiple genuinely different concretizations), drop the template.
  No length caps ("Length is not the problem").
- Style of guidance: "I'd instead give agent a _mode_ of thinking,
  clear success criteria and a directory of tools" — less prescription
  of output and presentation; universals encouraged, not mandated.
- kb form: outer kb per question-group, inner kb per question, each
  answer a .md therein (= llm-kb decision points).
- Principle-shaped replies: generalize particulars to principles, yes;
  unilateral execution, no — default to waiting for the call to
  action.
- Frame synthesis is dialogic: the agent can't do it unilaterally;
  needs discussion, archeology, or owner soul-searching. "When neither
  is needed that's a windfall, not the usual case."
- Register ergonomics: "a git-add but not a commit of
  question-register seems appropriate."
- Owner proposal, executed: a generic multi-question trigger apart
  from the review-open-questions procedure →
  `must-read.kb/before/asking-the-user-multiple-questions.md`
  (staged draft), chained to the approve-or-ratify factoring entry;
  SKILL.md amended to match (staged). Nothing committed; owner rules
  by editing the staged files.

DRY pass, same day (owner: "that makes perfect sense to me. please
do."): the two bank siblings merged into
`must-read.kb/before/asking-the-user.md` — factoring
(facts/adequacy/acts) then form (preconditions, success criteria,
tools). SKILL.md shed
all ask-side form law (labels, projections, register shape, the
uncapped-close section — its law moved into the entry's
reply-unconstrained precondition) and keeps only the sweep: courts,
kills, tally, cluster grain, rulings filing, reply adjudication. The
fleet→personal path reference is deleted; the trigger system itself
is the wiring, and the skill names only the trigger phrase. All
still staged, uncommitted. Punt on record (on-tripwire): a
fleet-carried home for the asking law — repo-level
`bukzor-agent-skills/must-read.kb/` symlinked from dotfiles, or an
imperative-named skill (`ask-the-user`; NAME_GRAMMAR in
authorship.kb already records the owner's names-are-verbs-or-systems
rule) — waits until an external consumer or a second fleet-wide
entry needs it.

No-aliases ruling, same day (owner: "What invariably happens is that
claude reads all of them then realizes they're identical, after
they're already duplicate in context."): all four bank symlinks
removed — the two just minted, plus the two pre-existing aliases of
`when/evaluating-a-contested-or-subjective-position.md`
(contradicting-a-previous-response, retracting-or-conceding-a-claim).
Their retrieval work moved into names and prose: the merged entry
took the broadest honest name, `before/asking-the-user.md`, and the
contested-position entry's intro now names the reverse motion
(contradict / retract / concede). llm-must-read-kb's "Aliasing"
section replaced with "No aliasing" doctrine — broaden the slug, put
variants in opening prose, or split into two entries with a shared
procedure (staged, uncommitted). One dangling mention of the removed
retracting alias remains in a 2026-08-21 devlog — historical record,
left as-is.

Addendum (owner: 'anecdotally, "retracting-or-conceding-a-claim" was
the most effective of those'): the proven name became canonical —
`when/evaluating-a-contested-or-subjective-position.md` renamed to
`before/retracting-or-conceding-a-claim.md`, the endorse/validate
motion carried in its opening prose; CLAUDE.md's `Jr?` pointer
updated; the fleet SKILL.md's `when/` example row swapped to a
neutral slug. The doctrine gained two rules from the anecdote:
broaden a slug only while it stays concrete (action verbs fire,
abstract descriptions get scanned past), and keep the name that
fires — effectiveness outranks incumbency.

Bloat audit, next day (owner: "You need to distinguish between what
*you* needed to know to write the skill and what *the agent using
the skill* needs to know. /llm.kb audit: bloat"), calibrated by two
exemplar cuts the owner made directly in `before/asking-the-user.md`
(the drift-smells paragraph; the reply-unconstrained tail on menus /
AskUserQuestion). Generalized across the staged batch -- writer-facing
rationale and provenance cut from actor-facing text:

- `asking-the-user.md`: trailing Background block deleted; rationale
  clauses cut from Labels, File register, and Stated position; "is
  the recorded failure" rephrased operative; the redesign-entry path
  pointer dropped from Unfuse (that entry fires on its own trigger).
- `review-open-questions/SKILL.md`: the asking-law tool enumeration
  cut (it restated the bank entry it defers to); "the owner did your
  abstraction for you. Receive it as such:" cut from Principles.
- `llm-must-read-kb/SKILL.md`: two restatements of the mechanism cut.

Kept deliberately: precondition elaborations the owner's own edit
pass retained ("the cheap outcome, not wasted effort"; "a windfall,
not the norm") and the sweep skill's mode-of-thinking motivation.

Ruling on the cuttings' home (owner: "now any of that a future
designer/editor needs belongs under docs/dev"): everything worth
keeping was relocated, not deleted, and no longer lives in this
entry. Three files, all staged with the pass:

- `~/.claude/docs/dev/devlog/2026-08-29-000-the-asking-law-and-what-each-of-its-rules-answers-to.md`
  — the corpus, and per-rule provenance for `before/asking-the-user.md`,
  including the ruling that gave the entry its mode/criteria/tools shape.
- `bukzor-agent-skills/docs/dev/devlog/2026-08-29-000-The-sweep-sheds-the-asking-law.md`
  — why the skill shed the ask-side form and must not take it back;
  the ruled failures behind rules it no longer states.
- `bukzor-agent-skills/docs/dev/adr/2026-08-29-001-No-aliasing--one-body-gets-one-filename.md`
  — the contract reversal (discharges the ADR item below).

- [ ] Propose for llm-kb `skill.kb/self-audit.kb/bloat.md` (draft,
      agent-authored, vetoable): editorial feedback the owner gives
      mid-drafting addresses the writer, not the artifact's reader;
      integrating it verbatim is audience-mismatch bloat. Recovery is
      relocation to `docs/dev/`, not deletion.

- [x] ADR in llm-must-read-kb for the aliasing→no-aliasing contract
      reversal — written, staged, commits with the pass

Staged awaiting ruling — commit NOTHING here until the owner
edits/rules; the dotfiles index also holds other agents' unrelated
staged work, so commit by these exact paths only:

- dotfiles: `.claude/must-read.kb/before/asking-the-user.md` (new:
  merged factoring+form), deletions of
  `before/asking-the-user-to-approve-or-ratify.md`,
  `before/contradicting-a-previous-response.md`,
  `when/evaluating-a-contested-or-subjective-position.md`, typechange
  `before/retracting-or-conceding-a-claim.md` (HEAD symlink → real
  body), `.claude/CLAUDE.md` (Jr? pointer follows the rename)
- bukzor-agent-skills: `review-open-questions/SKILL.md` (sheds
  ask-side form, keeps the sweep), `llm-must-read-kb/SKILL.md`
  (Aliasing → No aliasing, neutral when/ example)
