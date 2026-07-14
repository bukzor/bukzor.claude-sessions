---
cwd: /home/bukzor/.local/share/git-localhost-store
session:
  uuid: # chronological; append your uuid when picking this entry up
    - f8508335-0ac6-450a-8cf9-60834e668c6d
    - c4655875-32cc-4890-b166-41d039ceed53
  started: 2026-07-12T15:15:53-05:00
  ended: null
---
# Git-Localhost-Store Simplification Sweep

Three-part cleanup queued in `.claude/todo.md`, one commit each: (1)
retire the legacy gitfile-migration tooling (`bin/migrate-from-gitfile`,
`bin/audit-gitfiles`) now that migration is 18/18 complete and the audit
only finds false positives -- **done**, commit `d50dd25`; (2) hook
redesign moving from mid-operation `reference-transaction` to
quiescent-point `post-commit`/`post-checkout` triggers, with an env
re-entrancy guard replacing the hooks-aside/trap dance, and hooks
collapsed to symlinks to one shared body -- **done**, commits `19d6cb3`
(implementation), `3f1e1f0` (testing.kb), `bdb75f6` (docs/ADR/devlog/
taskfile closeout); (3) root-file and doc cleanup (delete superseded
test scripts and `TESTING.md`/`lib/init`, fix stale `docs/adr/README.md`
boilerplate, decide the fate of `CLAUDE.md`'s "Related Files"
enumeration) -- **not started**.

Taskfiles: `.claude/todo.kb/2026-07-12-000-retire-legacy-gitfile-migration-tooling.md`
(done), `.claude/todo.kb/2026-07-12-001-hook-redesign-quiescent-point-triggers.md`
(done, `status: done`). Part 3 has no taskfile yet -- still just the
bullet list in `.claude/todo.md`.

Unplanned finding during (2): `git commit` internally fires
`post-index-change` too, before its own ref-transaction lands --
letting the store-recovery branch run there corrupted a commit into a
dangling object. Fixed and covered by
`docs/dev/testing.kb/store-recovery-via-commit.md`; see
`docs/adr/2026-07-13-000-quiescent-point-hook-redesign.md` for the full
writeup. Also corrected mid-(2): testing must isolate via
`XDG_STATE_HOME` (never touch the real `~/.local/state`), use `rm -r`
never `rm -rf`, and stage fixtures under `~/trash/` never `~/tmp/` --
all now reflected in testing.kb and TESTING.md.

- [ ] Part 3: root-file/doc cleanup (see `.claude/todo.md` for the
      itemized list) -- not started
