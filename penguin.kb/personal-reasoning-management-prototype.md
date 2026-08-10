---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.personal-reasoning-management
session:
  uuid:
    - cea2b7a6-c009-4e4b-b856-66434ae55978
    - af42c215-9424-41a2-ab0e-94512ba3a4cb
    - f3a645e9-6157-4948-b2d8-570b032b0e9a
    - 97ff5081-66f5-499a-a2bd-307533d33c6e
  started: 2026-07-26T19:25:08-05:00
  ended: null
---
# Personal Reasoning Management Prototype (Lean 4)

A framework for defeasible claims and their mandates/authority/proofs,
built in Lean 4. Design is written but the code is not: `.claude/todo.md`
carries the whole plan as two ordered lists — a setup spine (`lake init`,
Batteries, lean.nvim, CI via `lean-action`, test and lint skeletons) and a
framework build order that takes a vertical slice first (`Ledger/Core`,
content hash over `Syntax`, `lake exe gen` from `.kb/` frontmatter into a
committed `Corpus/Generated.lean`, then `theorem corpus_ok := by decide`).
Nothing under the spine has been started past the Brewfile/elan step.

Design docs, in reading order:

- `docs/dev/design-sketch.md` — the assembled shape, drawn concrete
  (redefined 2026-07-28: a label tag means the ledger commits it; every
  unlabelled concrete choice is arbitrary and freely replaceable —
  lakefile.toml was decided this way, community default + declarative needs)
- `docs/dev/design.ledger.md` — the labelled commitments, as a ledger
- `docs/dev/initial-setup.discourse.kb/` — toolchain questions and claims

The 2026-07-26/28 sessions restructured the ledger from levels `L0`–`L5`
into **seven theories ordered as a poset by ontology inclusion**
(`2259581`), where a theory is a set of claims over a fixed ontology with
declared priors, placement is fixed by *confinement* (a claim may use only
its own theory's vocabulary plus its priors' — which makes placement
greppable), and a posterior theory may not defeat what it extends
(*conservativity*). `world` is meant to be thrown away, `host` frozen;
`stance`, `ledger` and `convention` should survive any substrate change.

That apparatus was then ported into `Skill(llm-claim-ledger)`'s own
`design.ledger.kb/` — see `claim-ledger-skill-and-epistemics-realm.md`.
Thirteen claims overlap, **carrying identical labels on both sides** as
of 2026-07-28, so the correspondence is `grep LABEL` and not a table;
the prototype's `ledger` theory and the skill's `good-smells` have no
counterpart on the other side, and the two `purpose` theories share only
a name. **Divergence across the overlap is a defect in one of the two** —
the cheapest available drift check, and the reason neither was made a
pointer to the other.

- [ ] Work the setup spine in `.claude/todo.md`, in order — each item is
      about one small commit and verifies the previous one

## Delete When

The vertical slice lands (`corpus_ok` green in CI over a real `.kb/`
file) and the repo has its own devlog, at which point the plan lives in
`.claude/todo.md` and this entry is redundant.
