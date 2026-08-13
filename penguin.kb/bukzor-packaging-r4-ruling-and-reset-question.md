---
cwd: /home/bukzor/claude/bukzor-packaging
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 1ce769c9-b940-433c-82e9-18978cdf6646
  started: 2026-08-13T16:51:16-05:00
  ended: null
---

# bukzor-packaging — R4 Unit Ruling and the Reset Question

Executed the ratified R1–R6 requirements against the packaging theory (six
commits, `f09c359..59f2395`), then developed the R4 benefit-unit ruling
jointly with the `alignment` session (same worktree, owns the uncommitted
requirements.md batch). Bukzor ruled the data side: records price benefit in
SWEh per 2 weeks (`benefit-2w` per `Skill(llm-subtask)`'s `cost-benefit-sweh`
schema; optional ISO-8601 `horizon` sub-attribute, default `P2W`, must be
machine-parseable); the gate is payback `c/benefit-2w ≤ N` with c from TERMS
records, INFLATE-corrected; rank divides by c, never by timebox (which is a
stop-loss, not a cost). Rivals priced: bare minutes (incumbent; loses on
machinery, not the number) and a bespoke schema (loses on re-derivation).
Then bukzor reported being lost — "tempted to reset everything to two days
ago" — and both sessions froze all edits, commits, and ruling talk. The
orientation map was delivered: baseline `5db0ce4` (end of 08-11), 8 commits
since (+313/−33), plus alignment's 8-file uncommitted batch; graph lint clean
(51 nodes, 98 edges, acyclic); seams green, coherence/composition/retirement
red = the documented backlog, not damage.

**A follow-up session must not advance theory work until bukzor closes the
keep/prune/reset question.**

Open work:

- [ ] Bukzor's re-orientation decision: keep, prune per-commit, or reset.
      The 8 post-`5db0ce4` commits are each small and cleanly revertable; a
      plain-language changelog was offered. Don't advocate; give facts.
- [ ] Bukzor closes N, the gate's payback bound (N=26 ≈ one year proposed;
      FORECAST's ⅓ on predicted benefit self-regulates it, so it's a
      convention, not a load-bearing estimate).
- [ ] Apply the R4 ruling after N: in-repo, TERMS/QUOTIENT gain the unit +
      horizon + N declarations and dispositions.md's decision table gains a
      benefit column in SWEh; cross-repo, `Skill(llm-subtask)`'s
      `todo.jsonschema.yaml` gains the `horizon` sub-attribute plus one
      rank-normalization sentence (`@value × (P2W/horizon)` before WSJF) —
      shared skill, needs bukzor's approval. Full ruled state also in the
      repo's `requirements.md` R4 (alignment's file, uncommitted).
- [ ] The audience-benefit numerator in genesis (does audience multiply b?)
      — queued ruling touching user-signed QUOTIENT; partially subsumed by
      the R4 unit work but not decided.
- [ ] R2 (instruments hardwire `claude-*`; population must be an input) —
      bukzor de-emphasized this mid-review; confirm before starting.
- [ ] Alignment's uncommitted batch (requirements.md + charter reframing,
      8 files, +55/−42): disposition is bukzor's call — do not commit or
      discard on agent initiative.
