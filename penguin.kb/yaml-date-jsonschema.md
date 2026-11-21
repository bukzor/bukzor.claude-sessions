---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills/llm-kb
session:
  uuid:
    - 9dcb2df1-1f06-4bc2-b5c8-b3e634e3065e
  started: null
  ended: null
---
# yaml-date-jsonschema (2026-05-15)

The session that bootstrapped this collection. Started from the
question "is there any 'good' way to jsonschema a yaml datetime?"
and expanded into a rename and an index.

## Open work

- [ ] Have the validator, on a `type: string` failure whose instance is a
      `date`/`datetime`, name the extension type and the dialect URI in
      the error. One branch in `lib/python/llmd/_jsonschema_adapter.py`
      or its caller; the failure it prevents is silent data loss, not
      just a slow fix.

## Live Follow-Ups

Sibling entries in this directory derived from this session:

- `rename-rollup-d-to-kb-doc-references.md`
- `auto-migrate-scripts-for-kb-dirs.md`
- `schema-migrate-string-pattern-to-date.md`
- `finish-debolding-cleanup.md` (pre-existing work surfaced here)

(`finish-skill-kb-refactor.md` was a fifth seed entry; absorbed
elsewhere and deleted.)

## Minor noted

- `sessions.jsonschema.yaml` `session.uuid` description currently
  reads "Absent for planned or proposed sessions that have not been
  started yet." Since the strict shape made `session.started: null`
  the canonical "planned but not begun" signal, the uuid wording is
  no longer load-bearing -- could be tightened to just "absent until
  the session is actually run." Left as a doc nit, not behavior.

Delete this entry once those follow-ups are absorbed and there is
no remaining reason to point back at the originating session.

## Addenda

`yaml-date-jsonschema.kb/` holds one dated write-up per session that
picked this entry up. `ls` gives the timeline.
