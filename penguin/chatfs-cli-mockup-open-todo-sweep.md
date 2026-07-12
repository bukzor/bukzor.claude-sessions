---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.chatfs/docs/dev/design-incubators/chatfs-cli-mockup
session:
  uuid:
    - f3fa93d2-9158-45a0-b99a-01dde66f390d
    - 4946d6c3-7543-43a1-98a7-5750f04e1f04
    - c562c738-bcfd-4c3c-8007-257a12992899
    - f3faf947-fbfe-4c44-bd81-1d1125b64e9e
  started: 2026-07-09T14:07:41-05:00
  ended: null # step 4 (unification) still open
---
# Chatfs-Cli-Mockup Open Todo Sweep

Work through the open backlog in this incubator's `.claude/todo.md` and
`.claude/todo.kb/`. Renamed from `chatfs-mockup-chatgpt-open-todo-sweep.md`
2026-07-10 when the incubator itself was renamed. Superseded two now-stale
sessions.kb entries (`provider-code-reuse-stutter-step.md`,
`pyright-clean-sweep-across-the-incubator.md`) — both fully closed per git
history (`7ba1669`, `a82d1f7`) and deleted per sessions.kb lifecycle.

Taskfile: `.claude/todo.md` (this incubator's own tactical list; project-wide
work lives in `../../../../.claude/todo.md`, which now carries an "Immediate
plan" section — read that first on pickup).

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

## Decisions resolved this session (2026-07-10)

- **Driver model** (cross-provider-drift's last open item): not
  pipe-vs-delegation either/or. User: a well-decomposed CLI with
  importable generator functions gives both — pipe and delegation
  become thin drivers over the same library. Documentation of this in
  `cli-command-shape.kb/` deferred to the actual unification work
  (Immediate plan step 4).
- **Shared-lib destination**: `$REPO/lib/chatfs/` once libraryized —
  not `packages/chatfs-core/`, and not permanent incubator residence.

## Immediate plan (agreed with user, recorded in `.claude/todo.md`)

1. [x] Rename to `chatfs-cli-mockup` — done 2026-07-10.
2. [x] Live-capture sitting — AI Studio index. Accepted done-for-now by
       user 2026-07-11 ("as done as we can get it at the present
       time"). Reverse-engineering half done 2026-07-11 (devlog
       `2026-07-11-000-AI-Studio-ListPrompts-index-rung...`, commit
       `705f6dc`): endpoint confirmed as `ListPrompts` (shares
       `ResolveDriveResource`'s PROMPT/METADATA schema — verified via
       `docs/dev/aistudio-schema/rosetta/`, pivoted to this RPC this
       session, left uncommitted for the user to commit separately).
       Surfaced and fixed a real bug this unblocked: `IndexItem`/
       `index_item()`/`place_meta()` assumed `create_time` was always
       derivable — it isn't, for index-only entries — now split into a
       required `last_modified` + `NotRequired[create_time]`, with a
       new uniform `Created=`/`LastModified=` view-tree label convention
       in shared `chatfs_layout.py`. **Still not done, deliberately
       deferred** (not blocked — schema/endpoint known, test fixtures
       exist): `chatfs_aistudio_index_pluck.jq` +
       `chatfs_aistudio_index_splat.py` + `..._index_browse.sh`
       themselves, the `has_more=false` pagination shape (this
       account's 42 prompts never triggered pagination), and
       end-to-end verification of the (unwritten) scripts. Revisit at
       a future live sitting if/when it happens; not otherwise
       scheduled.
3. [x] Finish AI Studio's conversation side — done 2026-07-11.
       `chatfs_aistudio_conversation_render.py` (verified the
       linear/no-forks assumption first — recorded in
       `dev.kb/claims.kb/aistudio-jspb-prompt-shape.md` — then reused
       `chatfs_render.render_tree` over a degenerate single-child-chain
       tree, rather than a bespoke linear renderer), `..._path_render.py`
       (byte-for-byte the claude shape), and `url_browse` now delegates
       to it. Live end-to-end tested against the demo capture (15
       turns, zero fork artifacts in the output); new
       `chatfs_aistudio_conversation_render_test.py` (9 tests,
       mutation-checked). Devlog:
       `devlog/2026-07-11-001-aistudio-conversation-render-linear-chain.md`.
       Deliberately did not write `path_browse`/`url_render` — those
       fold into step 4.
4. [ ] Unify — execute cross-provider-drift's "solve by unification"
       (5 requirements), applying the driver-model decision above.
       Closes the drift file and the shared-code file's tactical half.
       **Next up.**

## Blocked on the user specifically

- **AI Studio index rung, remaining**: no longer blocking (step 2
  accepted done-for-now 2026-07-11) — the three scripts are NOT blocked
  (schema/endpoint known), just deprioritized behind step 4; only the
  pagination/has_more question and final live end-to-end verification
  still want a browser sitting, whenever one next happens.
- **claude-code as next provider**: its own todo.kb file has real open
  design questions (locator shape, `claudecode`/`claudeai` naming
  collision, sequencing) — project CLAUDE.md says discuss before
  writing, not fill in solo. Not part of the Immediate plan; sequenced
  after it.

## Not started — carried forward in `.claude/todo.md`/`todo.kb/` as-is

- Branch enumeration in splat, debug-intermediates flag: well-scoped,
  no blockers, just not reached.
- Shared-code boundary refinement (what else belongs in
  `chatfs_layout.py`): answered by the unification work itself (step 4),
  not a standalone decision anymore. (`chatfs_layout.py` did gain one
  small addition 2026-07-11 — the `Created=`/`LastModified=` label
  param — but that's orthogonal to the boundary question, not a
  preemption of it.)

## 2026-07-11 addendum (morning: index reverse-engineering)

Also touched `docs/dev/aistudio-schema/` (a sibling project, not this
incubator): pivoted `rosetta/`'s golden-pair tooling from
`ResolveDriveResource` to `ListPrompts` to reverse-engineer the index
endpoint. Left uncommitted at the user's request ("i'll take care of
aistudio-schema myself") — not part of `705f6dc`. If a future session
lands there, check `git status -s docs/dev/aistudio-schema/` first;
don't assume it's clean. Still true as of this session's end — those
files remain staged-but-uncommitted; left untouched again.

## 2026-07-11 addendum (evening: conversation render/path_render)

Landed Immediate plan steps 2 (accepted done-for-now) and 3 (done) in
one sitting — see the Immediate plan section above for what shipped.
Two things worth a future pickup's attention, both recorded as open
questions in
`devlog/2026-07-11-001-aistudio-conversation-render-linear-chain.md`
rather than as todo items (neither is scheduled work, just caveats):

- The "AI Studio editing discards history, never forks" claim
  (`dev.kb/claims.kb/aistudio-jspb-prompt-shape.md`, "Turn order is
  linear") is inferred from data shape (no parent/child field
  anywhere), not a captured edit/regenerate round-trip. If a future
  live sitting captures an edited prompt, check whether this holds and
  promote the claim's status from `observed` to `settled` (or refute
  it — a fork would need real `chatfs_aistudio_conversation_render.py`
  rework, not just a status flip).
- `chatfs_aistudio_conversation_render.py`'s heading timestamps are
  computed at render time (epoch seconds → local wall clock via
  `.astimezone()`), unlike claude/chatgpt whose local-time-with-offset
  is baked into the message filename once, at splat time. Re-rendering
  `chat.md` on a machine in a different timezone than the original
  capture would show a different wall-clock hour for AI Studio only.
  Accepted as-is (chat.md is gitignored/regenerated freely; AI Studio's
  deliberately id-less, index-led basenames have nowhere to bake a
  timestamp without either changing that naming scheme or writing a
  synthetic field into the otherwise-raw per-turn `.json`) — revisit
  only if it ever causes real confusion.

Not committed by this session's end — will be committed as part of
`/session-end`'s own commit step, alongside this sessions.kb update.
