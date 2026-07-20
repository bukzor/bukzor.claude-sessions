---
managed-by: Skill(llm-subtask)
---

- [ ] Scan all `penguin/*.kb/*.md` dated addenda (incl. symlink-sourced
      entries backed by `~/repo/github.com/bukzor/2026-05-19--task-archeology/.claude/sessions.kb/`)
      for a leading `Part of \`../$slug.md\`.` line and remove it --
      agent-invented, redundant with the file's own path; do not
      reintroduce it in future addenda.
- [ ] `bin/llm.kb-validate ~/.claude/sessions.kb` fails on `README.md`
      (root synthesis file, only needs `last-updated`) -- it's being
      matched against a session-entry schema expecting `cwd`/`session`.
      No root `*.jsonschema.yaml` exists here yet; figure out why
      README.md is picking up that schema and fix (schema file, or
      validator exclusion for root synthesis files). Found incidentally
      2026-07-20, pre-existing, unrelated to that session's work.
