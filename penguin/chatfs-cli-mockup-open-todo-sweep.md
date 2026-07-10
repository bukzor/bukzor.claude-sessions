---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.chatfs/docs/dev/design-incubators/chatfs-mockup-chatgpt
session:
  uuid:
    - f3fa93d2-9158-45a0-b99a-01dde66f390d
    - 4946d6c3-7543-43a1-98a7-5750f04e1f04
  started: 2026-07-09T14:07:41-05:00
  ended: null
---
# Chatfs-Mockup-Chatgpt Open Todo Sweep

Work through the open backlog in this incubator's `.claude/todo.md` and
`.claude/todo.kb/`, getting as far as reasonably possible while noting
anything the user should review or weigh in on. Superseded two now-stale
sessions.kb entries (`provider-code-reuse-stutter-step.md`,
`pyright-clean-sweep-across-the-incubator.md`) — both fully closed per
git history (`7ba1669`, `a82d1f7`) and deleted per sessions.kb lifecycle.

Taskfile: `.claude/todo.md` (this incubator's own tactical list; project-wide
work lives in `../../../../.claude/todo.md`).

## Landed 2026-07-09/10 (all pushed as of 2026-07-10)

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
  `chatfs_layout.py`/`chatfs_render.py` code. This is original synthesis
  I wrote this session — worth a read since it's new prose, not a
  transcription of something already agreed.
- `f85d485` — while writing the above, carried forward stale
  "two-provider lessons" wording from before AI Studio landed as the
  third provider (caught by user, not by me — worth noting I should have
  caught it myself). Fixed there and in the sibling
  `shared-code-among-providers.md` strategic file, which had the same
  staleness in its Priority line and an unresolved-but-actually-answered
  rule-of-three Open Question.

## Not started — carried forward in `.claude/todo.md`/`todo.kb/` as-is

- Branch enumeration in splat, debug-intermediates flag: well-scoped,
  no blockers, just not reached.
- Rename incubator to `chatfs-cli-mockup`: project-level task (touches
  `pyproject.toml` + ADR), deferred rather than started mid-sweep.
- Shared-code boundary refinement (what else belongs in
  `chatfs_layout.py`) and incubator-local vs. `packages/chatfs-core/`:
  genuinely open questions, not mine to resolve unilaterally.

## Blocked on the user specifically

- **AI Studio index rung** and **har-browse `has_more=false` wait fix**
  both need a live authenticated browser session to capture/test against
  — not something I can drive.
- **claude-code as next provider**: its own todo.kb file has real open
  design questions (locator shape, `claudecode`/`claudeai` naming
  collision, sequencing) — project CLAUDE.md says discuss before
  writing, not fill in solo.
- **Unification driver-model decision** (pipe vs. delegation, in the
  cross-provider-drift todo.kb's "Solve by unification" section): the
  file itself says "decide once, document" — a real decision point.
