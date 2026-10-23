---
cwd: /home/bukzor/repo/github.com/bukzor.sandbox
session:
  uuid:
    - 10fbc139-fabe-431f-9aeb-03d3c9e3ed27
  started: 2026-10-23T10:37:07-05:00
  ended: null
focus:
  - docs/dev/claims.kb/design.md
---
# sandbox-bootstrap -- stand up bukzor.sandbox from an empty repo

Bootstrap of `bukzor/bukzor.sandbox`, the parent of throwaway sandbox
repos. Seeded the design ledger at `docs/dev/claims.kb/` (mission,
goals, architecture, background, technical-policy), then wires the
repo's own `CLAUDE.md` and README to it.

## Findings

- The ledger is the record; this entry carries pointers only. Scans
  are in `docs/dev/claims.kb/design.md`.
- Adopted from `nih-tooling-deliberation.md` (verified against commit
  2526aa6, not taken from the message): BINDING is closed by user
  ruling -- record file in `sandbox-repo.kb/`, clone collocated beside
  it, gitignored by the parent; SUBMODULES, MANIFEST_TOOL, TOPIC_ONLY
  struck with grounds; new `components` rung with the verbs. My
  agent-recommended SUBMODULES is superseded; no contradiction left
  standing.
- `+` The ledger after the peer's filing: 38 files, 0 validation
  errors, one component, acyclic, 0 confinement trespasses.

## Overlap

- `nih-tooling-deliberation.md`: same ledger, same repo. It owned
  BINDING and the verbs; this session owns `CLAUDE.md`, README, and
  the create procedure's first use.
- `sandbox-designs-from-chats.md`: planned by this session; waits on
  the `create` verb.

## Open

- [ ] TOPIC_INDEX: user's call; `diff` needs some GitHub-side
      predicate either way.
- [ ] UPDATE, LIST verbs: open claims, user's call.
- [ ] `CLAUDE.md` and README for the parent, citing the ledger rather
      than restating it.
- [ ] `sandbox-repo.kb/` itself: the collection, its schema, and the
      gitignore for clones (CLONES_IGNORED is `todo`).
