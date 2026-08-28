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
