---
cwd: /home/bukzor/repo/github.com/bukzor.sandbox
session:
  uuid:
    - 1960ba62-90cd-4262-b412-cb57385f6a15
  started: 2026-10-23T11:22:55-05:00
  ended: null
focus:
  - .claude/trash/nih-tooling-deliberation.md
---
# NIH tooling deliberation -- what binds a sandbox to the parent

Design-partner session on `bukzor/bukzor.sandbox`: whether a pre-made
multi-repo tool or hand-rolled scripts bind sandbox repos to the
parent. Closed by user ruling; the result is filed in the repo's
ledger, `docs/dev/claims.kb/`, and nowhere else.

## Findings (all user-ruled unless marked)

- The binding is a record file in `sandbox-repo.kb/`, an llm-kb
  collection; the clone sits beside its record, inside the collection;
  clones are gitignored by the parent.
- Hierarchy is a goal. GitHub cannot carry it, which rules out every
  GitHub-as-manifest design.
- Policy: a sandbox never depends on where another repo is cloned.
  The `@`-import of the parent's CLAUDE.md is rejected on this ground.
- Policy: no third-party multi-repo tool; scripts over gh and git.
  Per-tool grounds filed on the struck candidate.
- Verbs: create, import, diff, status, foreach decided and `todo`;
  update and list open.
- `+` finding: llm.kb-validate skips nested repos only because they
  are gitignored or submodules, not because they are repos.

## Overlap

- `sandbox-bootstrap` (d5e368) seeded the same ledger at 11:55 with
  BINDING as an open decision point and SUBMODULES agent-recommended.
  This session's filing closes BINDING and strikes SUBMODULES,
  MANIFEST_TOOL, TOPIC_ONLY. Left untouched: TOPIC_INDEX (open),
  PARENT_THIN, GRADUATE, ADD_STRUCTURE, BOTH_POPULATIONS.
- `penguin.kb/sandbox-designs-from-chats.md` waits on the create verb.

## Open

- [ ] UPDATE and LIST verbs: user's call, filed as `open` claims
- [ ] TOPIC_INDEX: still open; DIFF needs some GitHub-side predicate
