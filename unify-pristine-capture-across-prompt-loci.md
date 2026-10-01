---
cwd: /home/bukzor/claude/mitmproxy
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 233803b9-c857-4e41-be47-81d8e0fede0d
  started: 2026-09-17 # predates a /compact; the 2026-10-01 work is its second half
  ended: null
---

# Unify Pristine Capture Across Prompt Loci

The proxy patches three loci and captures only one. `role: "system"` messages
-- where Claude Code injects the auto-mode bash-first steer -- have a patch and
no pristine record, so whether upstream still ships the steer is answerable
only from a deletion scar in post-patch traffic. The work generalizes the
prompt locus's capture pipeline so every surface is one row of a locus table
whose only per-locus code is the walk, and folds the tool locus's
exact-compare into the template dialect on the way.

Plan: `/home/bukzor/claude/mitmproxy/.claude/todo.kb/2026-10-01-003-Unify-pristine-capture-across-loci.md`
Design: `/home/bukzor/claude/mitmproxy/design/040-design.kb/one-walk-per-locus.md`
Narrative: `/home/bukzor/claude/mitmproxy/session.kb/2026-10-01-the-gate-that-never-crosses-the-wire.md`

Stage 1 of five is independent of the rest and is the only one that closes a
live gap; stages 2-5 are architecture. Settled this session and not worth
revisiting: no request header or body field names the assignment, the
GrowthBook gate never crosses this proxy, and `safeguards` is a
dangerous-tool-use classifier input that we do not edit -- so no flag or
response work obviates the text patch.

## Awaiting the owner's ruling

Six judgment calls, recorded as `[!QUESTION]` in the design entry. Four change
what gets built, so stage 2 onward is blocked on them; stage 1 is not.

- [ ] Whether fixture names give shape, scope-partial and raw digest distinct
      positions. Shape-equals-suffix deletes `prompt_shape.FIXTURE_SUFFIX`,
      but `-doing-tasks` currently shares the slot with `-opus` while naming a
      partial rather than a shape.
- [ ] Whether the long-form shape takes an explicit suffix, renaming the 14
      bare fixtures. `system-prompts.kb/CLAUDE.md` already holds that vacating
      the bare name loses nothing.
- [ ] Whether `search` is scoped within the match span. It is not today, so
      `match` scopes applicability but not the replacement.
- [ ] Whether a walk's traversal becomes jsonifiable data, with only its
      recognition inventory left as annotated code.
- [ ] Whether subagent prompt bodies get committed once promotion is
      unconditional.
- [ ] Whether the message locus is promoted to a kb at all, or left as
      captures plus queue entries. This turned on the surviving shape
      vocabulary, and a parallel session measured it on 2026-10-01: 8 to 13
      distinct normalized first lines per day, small and stable, so promotion
      is cheap. Findings and their post-patch caveat are in the stage-1
      section of the plan.
