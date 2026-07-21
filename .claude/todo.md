---
managed-by: Skill(llm-subtask)
---

- [x] Scan all `penguin/*.kb/*.md` dated addenda (incl. symlink-sourced
      entries backed by `~/repo/github.com/bukzor/2026-05-19--task-archeology/.claude/sessions.kb/`)
      for a leading `Part of \`../$slug.md\`.` line and remove it --
      agent-invented, redundant with the file's own path; do not
      reintroduce it in future addenda. Done 2026-07-21: 41 files across
      9 `.kb/` dirs (2 symlink-sourced into the task-archeology repo).
- [x] `bin/llm.kb-validate ~/.claude/sessions.kb` fails on `README.md` --
      resolved 2026-07-21 as an interim fix: moved `README.md` to
      `docs/README.md` (updated its `../CLAUDE.md` self-reference), since
      `is_kb_dir()` treats any `*.kb`-suffixed directory as a
      schema-governed collection and swept the repo root's own
      `README.md` against `~/.claude/sessions.jsonschema.yaml`. A shared
      `frontmatter_validate.py` fix (skip `README.md` like `CLAUDE.md`)
      was tried first but reverted -- it silently breaks
      `llm-collab/references.kb/file-types.kb/README.md`, a legitimate
      schema-governed item with the same reserved name, and there's no
      structural signal (both dirs pair `CLAUDE.md`+`README.md`) to tell
      the two cases apart. Superseded by the reorg below; note this
      interim move loses GitHub's auto-rendered landing page (public
      repo, README no longer at clone root) until that lands.
- [ ] Reorganize the `bukzor.claude-sessions` repo: move current
      root-level content (`CLAUDE.md`, `docs/README.md`, `.template.md`,
      `.claude/`, `penguin/`) down one level into a `sessions.kb/`
      subdirectory, so the repo's own checkout root no longer collides
      with `is_kb_dir()`'s name-suffix convention. Not quick -- also
      requires:
  - [ ] Updating the `bukzor/dotfiles` submodule mount path/gitlink to
        match the new inner location.
  - [ ] Re-checking every relative cross-reference inside the repo for
        the new nesting depth.
  - [ ] Deciding whether `README.md` moves back to the new root
        (restoring the GitHub-rendered landing page) or stays under
        `docs/`.
  - [ ] Confirming this also finally makes `penguin/*.md` (and its
        `*.kb/` addenda) reachable by `bin/llm.kb-validate` -- currently
        invisible to it since the 2026-07-09 per-host reorg (`db1c9f7`),
        because `penguin/` isn't itself `.kb`-suffixed and
        `kb_subdirs()` only recurses into `.kb`/`=`-named children.
        `bin/llm.kb-validate ~/.claude/sessions.kb` currently reports
        "0 files, 0 errors" -- vacuously passing, checking nothing.
        Found incidentally 2026-07-21.
