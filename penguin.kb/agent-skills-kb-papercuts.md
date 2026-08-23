---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills
session:
  started: null
  ended: null
focus:
  - llm-kb/SKILL.md
  - llm-kb/references/frontmatter-outside-a-collection.md
  - llm-subtask/skeleton/.claude/todo.md
cost-benefit-sweh:
  timebox:
    '@value': 0.5
    rationale: |
      Three edits, each small and independently landable: one
      pyproject console-script entry and two documentation lines.
      Stop and reassess if the console-script wiring turns out to
      need more than adding the entry point.
    confidence: tentative
  benefit-2w:
    '@value': 0.7
    rationale: |
      The link checker exists and is good; not being on PATH cost one
      session ~15 min of hand-rolled substitute that produced false
      positives on prose filenames. The placement rule cost a
      misplaced collection and a full reference-repair pass. The
      todo.md defect makes every consumer repo's validate run report
      a permanent nonzero error count.
    confidence: tentative
  cost-of-delay-2w:
    '@value': 0.3
    rationale: |
      The standing false error is the expensive one -- llm-kb's own
      reference argues a validator that reports errors it will never
      let you clear teaches distrust of its output.
    confidence: tentative
---

# Agent-Skills kb Papercuts

Three small fixes to `llm-kb` and `llm-subtask`, all surfaced while
building a nested collection in `~/claude/meta-reasoning`
(`.claude/todo.kb/confidence-building.kb/r1-worksheet-sitting.kb/w5-candidates.kb/`,
2026-08-23). Independent of each other; land in any order.

- [ ] Put `llm.kb-validate-links` on `$PATH`. `llm-kb/bin/llm.kb-validate-links`
      exists and works (`✅ 108 files, 0 with broken links` on the
      collection above), but only `llm.kb-validate` is installed as a
      console script, so an agent that reaches for it gets "command not
      found" and concludes the documented tool is vaporware. Add the
      entry point beside the existing one in `llm-kb/pyproject.toml`.

- [ ] State the nesting rule in `llm-kb/SKILL.md`: **a companion
      collection nests by what it elaborates, not by what it
      resembles.** `w5-candidates.*` elaborates
      `r1-worksheet-sitting.md`, so it belongs under
      `r1-worksheet-sitting.kb/` — but two peer collections already sat
      in the parent directory, and reasoning from that resemblance put
      it one level too shallow until the user corrected it. The
      Decision Points section already implies this for `$ITEM.md` +
      `$ITEM.kb/`; it is never stated as the general placement test.
      Related gap worth the same visit: the anatomy diagram assigns
      `README.md` to root scope and `$CATEGORY.md` to category scope,
      but says nothing about the case that forces the choice — a
      collection elaborating a same-named item file (`X.md` +
      `X.kb/`) cannot name its roll-up `X.md`, so `X.kb/README.md` is
      correct there and only there. Both forms are live in
      meta-reasoning's `confidence-building.kb/`, which reads as
      inconsistency until the rule is stated.

- [ ] Fix `llm-subtask/skeleton/.claude/todo.md`'s frontmatter, which
      no schema reaches. `managed-by:` is `const`-pinned by
      `todo.jsonschema.yaml` for `todo.kb/` *members*, but the skeleton
      also puts it on the roll-up, where lookup does not go — so every
      repo built from the skeleton validates one error forever
      (`meta-reasoning`: "96 files, 1 errors", all of it this).
      `llm-kb/references/frontmatter-outside-a-collection.md`'s own
      "Why a synthesis file is not exempt" section prescribes the
      third resolution here: the keys are not data, strip them.
      `llm-subtask/.claude/todo.md` has the same defect; check
      `ideas.md` if one exists. Verify nothing reads `status:` first —
      a grep of the skill found no reader, but the sweep was not
      exhaustive.
