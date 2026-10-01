# 2026-09-22: P(stub noticed) for `making-code-changes` -- 41% / 55%, below the gate

Measured by the sibling session (`judgment-protocol-redesign`, 93639e4d)
on the want in `-001-decision-migration.md` "Risk, found after this was
posed". Same method as its 06-/08- numbers. Full tables and scripts:
`~/.claude/must-read.kb/trash/making-code-changes-noticed{.md,/}`
(gitignored). Sub-agent report verbatim is in that session's
transcript; this is the filing.

## The number

Of eras with a code-change beginning (first Edit/Write/NotebookEdit or
source-writing Bash; instruction `.md` excluded -- the alternate rule
moves it 2 points), `before/making-code-changes.md` was read before
the first edit:

| cohort | eras | read before | listing present | read \| listing |
|---|---|---|---|---|
| 08-31..09-21 | 63 | **41%** | 75% | **55%** (58% excl. bank-audit eras) |
| 07-13..08-30 | 304 | 27% | 73% | -- |

No listing detected in era: **0/16** read it. Skill-first sessions:
**0/7**. Sub-agents 62% vs main 38%. Sonnet 20% (n=5), haiku 0% (n=3),
opus 44%, fable 47%.

Members on their own occasions (cohort A, read before first qualifying
edit): python 45% (n=42), bash 43% (n=7), tests 58% (n=19), rust --
**no `.rs` edit in 71 days** (n=0).

## Against the gate

Position in `-001`: go above ~70%, else hold. **55% is a hold.**

- MODE_MISS's shape claim holds: action-shaped fires far above the
  judgment leg (55% vs assert <=30% / fold 7%) -- but at a coin flip,
  not near 1.
- STUB_RISK is a product: behind a stub noticed 55% of the time,
  `writing-python-code` goes from 45% to ~25%.
- Delivery is a serial step of its own: every read-before case had the
  listing; 0/16 without it. The migration adds a second noticing step
  on top of a delivery step that already fails ~25%.
- Choice 4 (recognition line in `llm-must-read-ls`) reaches only the
  eras the listing reaches; it does not lift the second step.

## Routed elsewhere

- Skill-first 0/7 (and 0/2 in `trigger-installation`'s installer data):
  a `/cmd` opening displaces the turn-1 sweep. That is
  `trigger-installation`'s leak, cheaper to fix than sharding, and the
  population where a stub fails hardest.
- `rust-programming.md`: zero occasions in 71 days; one listing line
  of cost. Candidate for retirement or a project bank, separate from
  the migration.

## Not measured

Listing present vs. attended (55% is P(read | delivered)); whether a
trivial edit is "really" a code change (biases down); reads that
entered via skill body or `@`-mention (count as never); cohort A is
n=63.
