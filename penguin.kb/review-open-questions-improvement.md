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

Corpus (claude-code-archeology sweep, 2026-08-28; line numbers are
JSONL lines under `~/.claude/projects/`):

- 98f2be37 L1431→L1434 (Aug 21, bukzor-agent-skills): faithful
  five-part narrative walkthrough, ~15k chars — "that's so long :( /
  can you give me a listing of items i can agree/disagree/correct?"
- 98f2be37 L1439→L1446: the repair that worked — 11 numbered items
  grouped by the reply owed (facts, correct me if wrong / decisions I
  need from you / already done, veto any), 1–3 sentences each, "My
  rec:" inline, "reply with numbers and yes/no/correction"; the owner
  quote-replied every item substantively.
- 98f2be37 L1477: "This workflow sucks. Real bad. I have a bunch of
  toil copy-pasting your answer and formatting it, and your multipart
  responses get separated from their referents making them
  inscrutible." → origin of the register-as-presentation law. The toil
  is owner-side quote-reply prose, not chat presentation per se.
- 33e3067f L199 (Aug 23): "i didn't read your … section because the
  synthesis is lacking. all the items you listed are second- or
  third-order concerns about this deep stack frame of a larger piece"
  — items must arrive synthesized at the frame the owner owns.
- d5828a77 L859ff (Aug 26, real /review-open-questions run, file
  register): "editing in place? where?"; "a vim command would be
  helpful"; "commit seems premature. uncommit, leave it staged"; owner
  ruled by editing files inline ("ruled the other two questions,
  inline. use git-diff") — the register law works; ergonomics owed.
  L1066: "devlog is inappropriate, for a durable home for ruling
  persistence. instead, i need you to do nontrivial mental work. Infer
  what the correct claim set that best represents/accords with my
  ruling would/should have been, counterfactually. Then make it so."
- c814b73b L1457 (Aug 26): "will /review-open-questions find your
  open-items filed easily?" — filing opens discoverably to the next
  sweep is part of the contract; also "in short?" after a long answer.
- 6c04b3e5 L525→L527 (Aug 28 am, the praised one): ask quoted in the
  exhibit above; response was 13 questions in 4 sections — opening
  reframe ("54 findings ≈ a dozen decisions"), each item a bold
  universal question + 1–2 evidence sentences + A/B + "Mine:" with a
  one-line reason, footer naming which questions dominate and where
  I most expect to be wrong; "you can answer with just numbers and
  letters." Owner answered every one inline; "Good calls all around!"
- b0411fba L382→L405 (Aug 28 pm, private.bukzor-llc): same ask
  ("easy-to-read, easy-to-evaluate questions … I suspect you're
  trusting agent assertions where i'd disagree if asked");
  SKILL.md-faithful three-decision walkthrough; engaged without format
  complaint; the session soured on premature edits ("desist edits till
  we're aligned"), not on format.

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
`must-read.kb/before/asking-the-user-questions.md` — factoring
(facts/adequacy/acts) then form (preconditions, success criteria,
tools); both old filenames survive as symlink aliases. SKILL.md shed
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
