Part of `../chatfs-cli-mockup-open-todo-sweep.md`.

# 2026-07-20: claude family edit pass — package imports + pure/shell split

Picked up via `/session-start` pointing at
`.claude/todo.kb/2026-07-13-000-graduation-and-integration.kb/2026-07-13-000-module-shape-refactor.md`'s
open "move one provider family end-to-end (claude), tests green, as the
template" step — the 2026-07-19 `git mv` had landed the file moves but
zero content edits, so every sibling-import was broken repo-wide.

Landed the edit pass for claude + the shared core it depends on. Split
`chatfs_layout.py`'s three folded concerns into `chatfs/layout.py`
(pure path vocab), new `chatfs/pluck.py` (CDP-filter skeleton), new
`chatfs/shell/capture.py` + `chatfs/shell/place.py` (the impure
halves); same split for `provider/claude/layout.py` → `layout.py`
(pure) + new `provider/claude/pluck.py` (wire knowledge). Consolidated
`uuid_from_url` (previously duplicated across `url_browse.py`/
`url_render.py`) and added `url_for` into the provider layout module.
New `chatfs/paths.py` centralizes the incubator-root anchor every leaf
script's demo-tree path needs. Orchestrator delegation
(`path_browse`/`url_browse`/`url_render` → `path_render` → `splat`/
`render`) stays subprocess-based by design (see `driver-model.md`'s
decision record) — each stage still gained an importable driver
function, just not called that way by its siblings. Impure stdlib
imports are inline per function throughout, per `chatfs/__init__.py`'s
purity convention.

Verified: pytest 79/79 (claude + shared core only —
`--ignore=chatfs/provider/aistudio --ignore=chatfs/provider/chatgpt`),
basedpyright 0 errors/0 warnings on that same scope. chatgpt/aistudio
untouched, still red as expected, their own edit pass is next.

Full detail: devlog
`docs/dev/design-incubators/chatfs-cli-mockup/devlog/2026-07-20-000-claude-family-edit-pass-package-imports-and-shell-split.md`.

## Next

- [ ] Sweep chatgpt/aistudio against this session's template (same
      shared-core dependency, same pure/shell split shape, same
      subprocess-delegation-stays-subprocess pattern).
- [ ] Decide chatgpt-splat's external-vs-folded-in home during that sweep.
- [ ] Update the incubator README's "Run it" section once the full
      sweep lands.
- [ ] Live end-to-end run (module-shape-refactor's Success Criteria) —
      needs an explicit ask-first browser/network action;
      `provider/claude/index/browse.py` takes no arguments and performs
      a real capture immediately, so treat any direct invocation of it
      as live, never as a smoke test.
