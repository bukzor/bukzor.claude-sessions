# 2026-07-09/10: landed (all pushed as of 2026-07-10)

- `a5c8bce` — explicit-if/elif/else sweep (todo.md's "match/case
  exhaustiveness" item): 3 real violations found in
  `chatfs_render.py::primary_child`/`divider` and
  `chatfs_chatgpt_layout.py::_created`. None were actually enum/variant
  dispatch, so each became explicit `if`/`elif`/`else`, not `match`/`case`
  — worth a skim to confirm that reading of the house style rule.
- `29274b9` — closed the chatgpt `normalize_turnless` test gap. Required
  extracting `make_turn`/`render_conversation` out of `main()`'s
  closure/inline body first (same pure-pipeline shape claude's renderer
  already had) — a small refactor, not just new tests. Mutation-checked
  by hand (not the full `Skill(mutation-testing)` procedure — scoped to
  this one known gap, not a sweep).
- `c968a22` — promoted `provider-plugin-model.md` from a symlink (to the
  parent project's abstract spec) to a real incubator entry with the
  concrete three-way provider/universal split, grounded in the landed
  `chatfs_layout.py`/`chatfs_render.py` code.
- `f85d485` — fixed stale "two-provider lessons" wording (caught by user)
  from before AI Studio landed as the third provider, in
  `provider-plugin-model.md` and `shared-code-among-providers.md`.
- `8579b7d` — renamed the incubator `chatfs-mockup-chatgpt` ->
  `chatfs-cli-mockup`. Full repo-wide reference sweep; devlog
  filenames/bodies and the ADR title kept as historical record. README
  closing paragraph reframed: graduation target is `$REPO/lib/chatfs/`
  once libraryized (corrected mid-session from the plan's original
  `packages/chatfs-cli/`).
- `982f4a9` — recorded the agreed four-step execution plan in
  `.claude/todo.md`'s new "Immediate plan" section, and closed the two
  strategic decisions below.
- `ddc52a9` — unrelated: a forked subagent's `.claude/focus.md`
  convention removal (never paid out), landed in the same working tree.
