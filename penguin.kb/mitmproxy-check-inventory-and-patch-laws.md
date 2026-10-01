---
cwd: /home/bukzor/claude/mitmproxy
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 33249571-774c-4fa8-9f71-c530793883bf
  started: 2026-10-01T12:21:44-05:00
  ended: null
---

# Mitmproxy Check Inventory And Patch Laws

Make the offline checks assert their own completeness, and decide which
properties of the patch dialect are worth asserting at all. Branched from
session `233803b9-c857-4e41-be47-81d8e0fede0d` (the auto-mode bash-first steer),
which ranked four follow-ups; this one took "an idempotence test", generically.
Three peers took the others.

Taskfiles: `/home/bukzor/claude/mitmproxy/.claude/todo.kb/2026-10-01-001-Derive-check-provenance-from-declared-inputs.md`,
`/home/bukzor/claude/mitmproxy/.claude/todo.kb/2026-10-01-002-Assert-patch-rule-set-idempotence.md`.

## Done

`db94148` holds check modules and their `pyproject.toml` commands in
correspondence: `check_verdict.all_checks()` discovers them, `check_inventory`
has five predicates over them, the offline-checks hook fires on `check_*.py`
and `pyproject.toml`. `642b4b6` and `6a32bbf` file the two tasks above.

## Findings

+ The `CHECKS` gap was latent, not live -- all seven checks were registered and
  all seven had commands. The fix was to delete the registry rather than assert
  it: a bare tuple of module names holds nothing the filesystem does not
  already have. `REQUIRES` stayed hand-written because it encodes something
  real.
+ `monitoring/CLAUDE.md`'s "a failure here is triage, not a broken build" was
  already false before this session. `check_playbook` is a correspondence check
  whose two sides are both in the repo, so its red is a defect in the commit and
  `--no-verify` is wrong for it. Corrected to state the criterion -- all inputs
  human-written and in-repo -- rather than name the modules, which would have
  been the same forgettable registry in prose.
+ Measured independently, and relevant to the anchoring peer: under the
  pre-anchoring `template_to_regex`, **65 of 240 bodies on disk were not
  idempotent**, each growing ~90 bytes per extra pass. Zero under the working
  tree at the time. The law had a real violation, found by hand, with no guard.
+ Of eight candidate properties of the patch dialect, only three are contingent
  on the rule data (idempotence, mask coarsening, block disjointness) and two of
  those already have predicates. The rest are theorems -- a deletion cannot grow
  a body because `replace == ""` makes the replacement `""`, so the span change
  is exactly `-(end - start)`. A laws matrix over them would generate waiver
  text for properties that cannot fail; dropped on those grounds.
+ From the parent session's evidence, for anyone touching the loci: no request
  header or body field indicates `bashFirst`, and only `/v1/messages`,
  `/v1/messages/count_tokens` and `/api/hello` are proxied, so the GrowthBook
  gate is unreachable in flight. `safeguards[0].classifier_context` does carry
  `permission_mode: "auto"` and the full permission ruleset -- a structured
  auto-mode signal, and a safety-classifier input, so not ours to amend.

## Open questions

- [ ] `todo.kb/001` (provenance) -- design is agent-authored and unratified.
      **Needs the user.** It is the only filed task whose direction is unsettled;
      the other two are settled and merely sequenced.
- [ ] `todo.kb/002` (idempotence) -- design unratified, and blocked on the
      trailing-newline convention, which changes the fixpoint.
- [ ] Ten commits sit unpushed, and `e14faff` carries the message "Anchor patch
      templates to line boundaries" over a content of nine `todo.md` lines
      adding the `todo.kb/003` breadcrumb -- a job `dcdfba5` also does, with an
      accurate message. Message and content disagree, which the standing rule
      says to fix while still unpushed. Not mine to amend. **Needs the user.**
- [ ] `tests/CLAUDE.md` carries a `[!DRAFT]` exception from the parent session
      (`test_message_patches.py` loads live rules). Still unratified; the
      pristine-capture work in `todo.kb/003` would dissolve it.
- [ ] `fix-tone-conciseness` at 16 -> 15 matches: accepted or repaired. The
      anchoring peer recorded it as accepted, "the user has not confirmed".
      **Needs the user.**

## Overlap suspects

- **The anchoring / newline peer** (`todo.kb/000`, `session.kb/2026-10-01-templates-matched-as-substrings.md`).
  Heaviest overlap. They committed my staged work as `db94148` while this
  session was mid-conversation -- shared worktree, one index, so this will
  recur. I appended the trailing-newline convention to their task at the user's
  direction and they implemented it (`6c5dda4`, `56bf864`). My `todo.kb/002` is
  blocked on that landing.
- **`todo.kb/003` (unify pristine capture across loci)** -- was item 1 of the
  parent session's ranking and is the prerequisite for retiring the
  `tests/CLAUDE.md` exception.
- **`todo.kb/004` (correct the role-system coverage rationale)** -- touches
  `design/040-design.kb/prompt-loci-coverage.md`, which the parent session
  edited.

## Wants

- From the anchoring peer: a re-measurement of patch idempotence after the
  newline convention and the deletion-consumes-one-newline rule. The 65-of-240
  figure is a historical fact about the pre-anchoring compiler, not a
  prediction, and `todo.kb/002` says to re-measure rather than trust it.
