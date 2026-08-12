---
cwd: /home/bukzor
session:
    uuid: # chronological; append your uuid when picking this entry up
        - 0a13c754-8b21-4634-b5a4-205c867bba28
    started: 2026-08-09T09:01:07-05:00
    ended: null
---

# Formalize bukzor-packaging Into a Claim Ledger

`Skill(formalize)` applied to `~/claude/bukzor-packaging`: 47 claims across nine
theories in `bukzor-packaging.claims.kb/`, plus ten transferable claims about
*doing* a formalization in `docs/dev/formalization.claims.kb/` (no packaging
subject matter in those — they are the reusable half). Four Python checks sit
beside the collections and three of them exit nonzero on purpose; that is the
finding, not breakage. Entry point with the poset and the one-page picture:
`~/claude/bukzor-packaging/bukzor-packaging.claims.md`.

Ledger work is committed and pushed. Open work lives in the repo, not here.

## State

The ledger's own instrument was measuring the analyst. `retirement.py` counted
tool invocations across ~281 session logs and reported "1 of 20 never invoked",
plus a striking agreement between the least-invoked tools and the ones the seam
rules had flagged. Both were artifacts: auditing a tool means running it. The
check now cuts the corpus at `STUDY = 2026-08-09`, the day the census opened, and
the honest figure is **8 of 20**. The agreement is retracted. If a number in the
case study looks too good, suspect the corpus before the claim.

`claude-export` is the payoff: zero invocations, gate said delete, and it works —
it appends `export VAR=value` to the running session's shell snapshot, the only
way to make a variable survive between `Bash()` calls. Its audience is agents and
nothing tells an agent it exists. **A zero count cannot distinguish an absent
benefit from an unreachable audience.**

## Rulings sought and not given

A `/review-open-questions` sweep on 2026-08-11 settled 17 of 20 opens in the cheap
courts and put three decisions to bukzor. Answer: *"i think i don't care enough."*

- `INFLATE` (a predicted cost is inflated 3×, so a purely speculative build needs
  9:1) stays `standing: agent` and is in force by default, not by ruling. Its
  `authority:` field records the decline. **Do not re-present it** — the sign
  follows from `FORECAST`'s own argument and the magnitude wants a measurement.
- An occasion/trigger index for the ledger (`must-read.kb/before/<trigger>.md`
  style, per `RETRIEVAL`) was declined and dropped. Do not refile it.
- The zero-invocation cohort is unruled, so those rows stay open in the repo's
  todo.

## Open work

- [ ] `~/claude/bukzor-packaging/.claude/todo.md` — seven committed items
      (advertise `claude-export`, rule on the reopened `claude-plan`, settle the
      five unattested tools, `hyperfine` the `claude-path` port, five renames and
      three extractions, `claude-jsonl-summarize`'s undeclared edge, archeology's
      partial ship) and three `## Later` gaps. Details live there; do not copy
      them up here.
- [ ] File `COVERAGE` as a `~/.claude/design-rules.kb/` entry: a claim's payoff is
      P(it still covers its subject) × value, so coverage decays with interface
      churn. It is general, it is not about packaging, and it currently exists
      only as a paragraph in the packaging ledger. Its sibling
      `correct-every-term-or-none.md` was already extracted the same way.

## Standing constraints

- `bukzor/work-stuff` is authorship-gated. Bukzor: "Perhaps don't look at it at
  all." It is out of the population by fiat, not by judgment.
- The dangling `~/.claude/skills/llm-claim-ledger*` symlinks belong to another
  agent's session. Bukzor: "let other agent have ownership. an outside edit would
  only confuse and confound." Leave them broken.
- The graph lint's binary name is volatile — `bin/llm-claims-kb-graph` as of
  2026-08-11, `bin/llm.claims-graph` earlier the same day. `ls` that skill's
  `bin/` rather than assuming the tool is gone.
- No inline code in docs. A `verify:` is a command; the program lives in
  `<prefix>.py` or `<prefix>.d/`.
