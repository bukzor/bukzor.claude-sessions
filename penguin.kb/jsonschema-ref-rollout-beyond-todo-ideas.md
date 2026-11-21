---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills
session:
  uuid:
    - 531674aa-acea-44f2-b221-058134337e71
    - abb60cf6-2a2c-48ec-aa0b-507755534106
  started: 2026-08-21T10:41:45-05:00
  ended: 2026-08-27T17:36:18-05:00
---
# JSON Schema $ref Rollout Beyond todo/ideas

The dedup half of `jsonschema-ref-dedup-census.md` (that session built the
survey tooling and stopped short of the analysis). Not a design problem --
an unfinished rollout: seven clusters (later eight) were still on the
pre-`$ref` copy pattern, the exact complement of the 2026-07-07 sweep's
hardcoded two-category scope.

**State:** migrations A-D, the `llm-sessions` skill and the `layer-entry`
canonical are landed and pushed; all 14 DIVERGED files are judged; lane
`-005`'s five fleet rulings are made but not applied. The other five lanes
(`2026-08-23-000` ... `-004`) are untouched. The recurring guard was
widened to derive categories from `<skill>/jsonschema/` and now reports
42 findings (32 MISSING, 10 NO-REF).

Plan and rollup: `~/.claude/skills/llm-kb/.claude/todo.kb/2026-08-21-000-ref-rollout-beyond-todo-ideas.md`
plus its `.kb/` journal. Migrations: `llm-kb/migrations.kb/2026-08-21-{000,001,002}-*`.
Lane `-005` execution:
`llm-kb/.claude/todo.kb/2026-08-27-000-Execute-the-five-fleet-verdicts-from-lane--005.md`,
its anacron step gated on `...-001-Guard-admission-blockers-before-the-anacron-trial.md`.

## Open work

- [x] Judge the 14 DIVERGED files. Done. Both survivors that stayed
      standalone are rival over the *same field*, `status`: epistemics
      carries warrant by field presence and exists to remove the
      canonical's `status` requirement, and chatfs's `dev.kb/claims` is an
      observation ledger with a disjoint enum. That is where this schema
      family is actually contested.
- [x] Disambiguate 3 `canonical-conversation-graph` slugs in
      `prototype.chatfs`. Done -- all three are `030-requirements.kb/`,
      settled by distribution rather than by re-reading the prose.
- [ ] Re-run the em-dash migration `2026-05-21-000` with
      `*.jsonschema.yaml` descriptions in scope. Em dashes drifted back
      into the canonicals themselves (5 in llm-subtask's todo schema, 6
      across the discourse quintet); a prose-oriented sweep misses data
      files.
- [x] Judge the 15 errors migration D newly exposed in
      `scratch.vim-work`. Done: 15 -> 0, and the stale-or-intentional
      framing applied to **none** of them. All 15 said `No schema found`.
      Schemas resolve strictly as a sibling of the `.kb/` they govern,
      and the two elaborated questions are legitimate nested scopes with
      no schema beside them. Fixed with 7 sibling stubs, zero frontmatter
      edited. The symlink-era graph got schemas at its root, where the
      author was standing; every scope elaborated later was invisible.
- [x] `template.python-project`'s `prettier` hook. Fixed -- but the
      premise above is wrong: `pnpm-run` *does* exist, at
      `<repo>/bin/pnpm-run`, put on PATH by `.envrc` via direnv. The hook worked inside a direnv
      shell and nowhere else, including under pre-commit. Now
      `entry: bin/pnpm-run`. The copier template still emits the broken
      form; that is open.
- [ ] `~/claude/meta-reasoning` has no `origin` configured, so two
      sessions' worth of committed work sits local-only. Same for
      `~/claude/crostini-health` (localhost-backed).
- [ ] Every stub written under 2026-08-21-{000,003} carries
      `# yaml-language-server: $schema=...draft-07...` while the
      canonical it references is 2020-12. Harmless to the validator,
      wrong for the editor. One sweep, ~48 files.
- [ ] Dialect gap: 144 of 309 schema files declare none. Nearly
      mechanical, but not uniformly -- a file using 2020-12 keywords must
      not be declared draft-07, so each needs a read.
- [ ] Repo-root `llm.kb-validate .claude` reports 26 errors, all inside
      `.claude/worktrees/` stale checkouts. Validation at that root is
      useless as a signal until the tool excludes them.
- [ ] **Session 2 has not started** (as of 2026-08-27). The other five lanes
      (`2026-08-23-000` … `-004`) are untouched: `-003` runs alone, the
      rest in parallel, each with its own sole-writer glob and its
      prohibitions. Read them as written — "an agent that finishes early
      does not go looking for more."
- [ ] Two untracked schemas in the stale `dotfiles` clone,
      `.claude/{reference,user-preferences}.jsonschema.yaml`, are the
      wanted half of the 2026-08-22 sitting and exist nowhere else, not
      even in the live `$HOME` tree. They should move there and be
      committed. Awaiting the owner's word.
- [ ] The stale clone itself deserves the `*--replication-run`
      treatment (prune it, or prefer the live tree), and the guard's
      `-name .git` prune misses `~/.local/state/git-localhost-store`
      git dirs.

## Addenda

`jsonschema-ref-rollout-beyond-todo-ideas.kb/` holds one dated write-up per
session that picked this entry up: what landed, the commits, rulings, and
process notes. `ls` gives the timeline.
