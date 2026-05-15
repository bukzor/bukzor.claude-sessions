---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills/llm-kb
session-uuid: 9dcb2df1-1f06-4bc2-b5c8-b3e634e3065e
---
# yaml-date-jsonschema (2026-05-15)

The session that bootstrapped this collection. Started from the
question "is there any 'good' way to jsonschema a yaml datetime?"
and expanded into a rename and an index.

## Completed

- KbValidator extended with `date` and `instant` custom types
  (commit 5d64413 in bukzor-agent-skills/llm-kb). Naive datetime
  is intentionally rejected; the rationale is in
  `lib/python/llmd/frontmatter_validate.py`.
- `.d/` → `.kb/` rename across complete-example and the devlog
  tools dir (commit 799eb02). 7 directories renamed, 18 reference
  files updated.
- Rename todo updated with progress (commit d59458b).
- `.claude/ideas.jsonschema.yaml` committed (commit cb315b3); the
  schema was already in use on disk but untracked. Done on a
  branch session (uuid dca7da65-d65c-43de-b345-87fa6518d630).
- This collection (`~/.claude/sessions.kb/`) created and seeded
  with five follow-up entries (commit d288b9a in bukzor/dotfiles).

## Live Follow-Ups

The five sibling entries in this directory are all derived from
this session:

- `rename-rollup-d-to-kb-doc-references.md`
- `auto-migrate-scripts-for-kb-dirs.md`
- `schema-migrate-string-pattern-to-date.md`
- `finish-debolding-cleanup.md` (pre-existing work surfaced here)
- `finish-skill-kb-refactor.md` (pre-existing work surfaced here)

Delete this entry once those follow-ups are absorbed and there is
no remaining reason to point back at the originating session.
