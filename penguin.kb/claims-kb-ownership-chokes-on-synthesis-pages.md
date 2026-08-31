---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills
session:
  uuid: [] # chronological; append your uuid when picking this entry up
  started: null
  ended: null
---
# Claims-Kb-Ownership Chokes On Synthesis Pages

`llm-claims-kb-ownership --trespass` aborts on any ledger whose entry-point
`$X.md` is a synthesis page rather than a claim. `ledger.read_claim` asserts
`f"{path}: no frontmatter, so this file is no claim"`, so the whole run dies
instead of skipping the file.

Reproduce in `~/claude/mitmproxy`: `llm-claims-kb-ownership --trespass` fails on
`keying.claims.md`, which is the documented entry point for
`keying.claims.kb/` (CLAUDE.md names it as such) and deliberately carries the
poset picture and the shape, not a claim.

Why it matters: `Skill(llm-design-kb)`'s maintenance checklist tells sessions
to run the confinement check after any session that changed the design. That
instruction is unrunnable in this repo, and silently so -- the failure looks
like a broken repo rather than a tool assumption.

Fix is a judgment call, hence this entry rather than a patch:

- [ ] Decide whether a theory/synthesis `$X.md` beside `$X.kb/` is required to
      carry frontmatter (making mitmproxy's file the defect), or whether the
      tool should skip a frontmatter-less sibling (making the assert the
      defect). `Skill(llm-claims-kb)` should state which.
- [ ] Whichever way it goes, the tool should not abort the whole run over one
      unparseable file -- report it and continue.

Found 2026-08-31 while running the design-kb maintenance checklist at the end
of the mitmproxy events-channel session
(`mitmproxy-addon-logging-revamp.md`); unrelated to that work.
