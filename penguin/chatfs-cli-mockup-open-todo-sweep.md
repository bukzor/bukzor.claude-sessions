---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.chatfs/docs/dev/design-incubators/chatfs-cli-mockup
session:
  uuid:
    - f3fa93d2-9158-45a0-b99a-01dde66f390d
    - 4946d6c3-7543-43a1-98a7-5750f04e1f04
    - c562c738-bcfd-4c3c-8007-257a12992899
    - f3faf947-fbfe-4c44-bd81-1d1125b64e9e
    - 8602bab8-384d-4178-afd3-611e7f0d2b05
    - 8068e7ac-66aa-487d-ad03-f8880b5f5b3f
    - ecf21946-d236-43fe-9b38-cabb926410ae
    - 29151e94-01fc-4c9b-afad-3dd8b32be0f2
    - aa2f4a4a-e185-4b4b-9197-09759f811e2d
    - 6e4979ba-ba34-4389-89ff-ecd5a3544c30
    - d69e481a-fdaf-46c4-8e3b-6ad42bd88e95
  started: 2026-07-09T14:07:41-05:00
  ended: null # Immediate plan (all 4 steps) done 2026-07-11; backlog remains (Next/Strategic/Later in todo.md)
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
2. [x] Live-capture sitting — AI Studio index. **Fully landed 2026-07-12**
       (was "done-for-now"/scripts-deferred as of 2026-07-11 — see the
       superseded write-up this replaces, still visible in git blame).
       `chatfs_aistudio_index_pluck.jq` + `chatfs_aistudio_index_splat.py`
       + `..._index_browse.sh` written and live-tested against a real
       browser sitting the user drove (42 prompts, one `ListPrompts`
       page, no pagination token observed — `has_more=false` still
       unreproduced, since pagination never triggered). Amended into the
       existing index-rung commit rather than added as a new one, so the
       commit message and devlog read as if written correctly the first
       time (user's explicit instruction — see devlog
       `2026-07-11-000-aistudio-index-rung-indexitem-honesty-fix.md`,
       substantially rewritten same session). Endpoint confirmed as
       `ListPrompts` (shares `ResolveDriveResource`'s PROMPT/METADATA
       schema — verified via `docs/dev/aistudio-schema/rosetta/`).
       Surfaced and fixed two real bugs: `IndexItem`/`index_item()`/
       `place_meta()` assumed `create_time` was always derivable — it
       isn't, for index-only entries — now split into a required
       `last_modified` + `NotRequired[create_time]` with a uniform
       `Created=`/`LastModified=` view-tree label convention in shared
       `chatfs_layout.py`; and `is_conversation`'s `chunks` guard read
       `.get("chunks")` instead of `.get("chunks", [])`, rejecting every
       index-only entry despite the field being declared `NotRequired`.
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
4. [x] Unify — done 2026-07-11: executed cross-provider-drift's "solve
       by unification" (all 5 requirements) — shared `capture()`/
       `run_pluck()` in `chatfs_layout.py`; chatgpt's endpoint cross-check
       (`chatfs_url_browse.py::null_tolerant_mismatches`, with a
       `_index_shaped()` normalization step chatgpt needs that claude
       doesn't, since chatgpt's two endpoints don't share literal key
       names/representations); `<details type="thinking"|"tool_call">`
       wrapping landed in `packages/bukzor.chatgpt-export`'s splat (TDD,
       4 new tests); driver-model decision documented in new
       `design.kb/040-design.kb/driver-model.md`. Also wrote AI Studio's
       remaining entry points (`path_browse.py`/`url_render.py`) against
       the shared `capture()`. `basedpyright` 0/0/0; `pytest` 76/76
       (incubator 28 + chatgpt-export 48). Devlog:
       `devlog/2026-07-11-002-unification-shared-capture-and-drift-fixes.md`.
       Closes both the drift file and the shared-code file (all items now
       `[x]`). This closes the Immediate plan's 4 steps.

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
aistudio-schema myself") — not part of `705f6dc`. Confirmed clean as
of 2026-07-11's session (user committed it themselves, `805fe4b`); no
longer a concern for future sessions here.

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

Not committed by this session's end. No session-end-only commit policy
is established here: `git add` aggressively whenever code is "better",
commit freely whenever code is better *and* test+lint is clean.

## 2026-07-11 addendum (Immediate plan step 4: unification)

Closed the Immediate plan (all 4 steps) — see step 4 above for what
shipped. Also touched `packages/bukzor.chatgpt-export/` (outside this
incubator) for the `<details>`-wrapping requirement.

Two mistakes, both recovered clean, full account in the devlog
(`devlog/2026-07-11-002-...`):

- Used `git stash` mid-session (project convention explicitly bans it)
  to A/B basedpyright's warning count; `basedpyright` exits 1 on any
  warning, which under the Bash tool's `set -e` skipped the paired
  `git stash pop` in the same compound command. Caught via `git stash
  list` before starting new work; recovered with a standalone `git
  stash pop`. Nothing lost, but a reminder to run stash push/pop (or
  better, not stash at all — throwaway-branch commit is the house
  convention) as fully separate commands, never chained.
- An `har-browse` stub for smoke-testing AI Studio's new
  `path_browse.py` read its replay source from the same path
  `capture()` was about to `unlink()`, clobbering the only real AI
  Studio demo fixture (`chatfs.demo/`, gitignored — no git history to
  restore from). Recovered via `aistudio.cdp.jsonl` (a root-level
  capture of the same prompt from the 2026-06-20 session) replayed
  through the real pluck → massage → place_meta → path_render
  pipeline by hand; verified restored (`chat.md` back to 439
  lines/15 turns). Lesson carried into the rest of the session's
  smoke tests: an external-tool stand-in must read from a path
  outside anything the code under test is about to write to.

## 2026-07-12: finished index rung, caught the branch up with main, fixed a stale todo bullet

Three pieces of work, in order:

1. **Finished Immediate plan step 2 for real.** The index-rung scripts
   (`pluck.jq`/`splat.py`/`browse.sh`) that 2026-07-11's write-up called
   "deliberately deferred" were actually already sitting uncommitted in
   the working tree, written and passing. User corrected the framing:
   not a new commit, an amend — "as if the work was done correctly the
   first time." Amended the 2026-07-11 index-rung commit in place (same
   author/date preserved), rewrote its message and the devlog to match,
   live-tested the browse script end-to-end with the user driving the
   actual browser interaction. See step 2's write-up above (rewritten
   this session; the old "still not done" version is git-blame-only
   now).
2. **Cherry-picked main onto the working branch (`post-hoc`) to catch it
   up post-hoc.** Main had progressed 11 commits past the pre-amend
   commit (render/path_render, the full unification pass, rosetta
   endpoint work) while this branch was doing the index-rung amend in
   parallel. `git cherry-pick <old-sha>..main` replayed all 11 cleanly
   except for `.claude/todo.md`/`todo.kb/...parity-ladder.md`, which
   conflicted three times — always the same two files, always because
   both branches had independently written competing "done" narratives
   for overlapping AI Studio work. Resolved by merging the narratives
   (keep whichever side reflects real landed work, drop stale "not
   written yet" text once superseded on either side) rather than picking
   a side wholesale. Zero code conflicts — `chatfs_aistudio_types.py`
   auto-merged clean even through the large unification commit. Verified
   after: `git diff main post-hoc --stat` showed exactly the 9
   index-rung files as the residual delta, nothing else diverged;
   basedpyright/pytest clean. User then renamed `post-hoc` → `main` (old
   `main` → `main.old`, later force-deleted once confirmed as pure
   history, no content loss) and force-pushed.
3. **Fixup + autosquash rebase for a stale todo bullet, and its
   knock-on hash-reference cleanup.** Asked "what's next" surfaced a
   genuinely stale `.claude/todo.md` line (`Rename incubator...` still
   `[ ]`/"in flight" — a leftover duplicate of Immediate plan step 1,
   which was already `[x]`). Root cause, found by bisecting the
   conflicts: the commit that introduced the "Immediate plan" section
   (`chatfs-cli-mockup: record the agreed execution plan and decisions`)
   wrote that stale "in flight" text onto the *old* duplicate bullet in
   the same breath it declared step 1 done in the *new* section — a
   self-inconsistency baked in at authoring time, not introduced later.
   Fixed via `git commit --fixup=<rename-commit>` + a non-interactive
   `GIT_SEQUENCE_EDITOR=true git rebase --autosquash`, which required
   resolving the same conflict shape three more times as the fixup
   replayed forward through history (each subsequent commit's diff
   still carried the stale text as unchanged context, since main never
   fixed it either). This is the *second* time in this repo's history a
   fixup-rebase has rewritten commit hashes out from under docs that
   cited them by SHA (see `0955d9b`, "Fix stale commit-hash references
   after yesterday's fixup rebase" — same failure, one day earlier).
   User's call this time: stop citing SHAs in these docs at all, switch
   to commit titles (verified unique on `main` first) — durable across
   future rebases where a SHA isn't. Landed as a follow-up commit
   ("docs: reference rebase-affected commits by title, not SHA").
   Force-pushed the rebased `main` at session end, confirmed by the user.
   basedpyright/pytest re-verified clean post-rebase.

Backlog is unchanged by any of this (see `.claude/todo.md`'s Next/Claude
gaps/Strategic/Later sections) — nothing here was scheduled work, it was
finishing already-in-flight work plus repo hygiene surfaced along the
way.

## 2026-07-15: atomic chat-dir regeneration — design redone, not implemented

Worked in the `atomic-chat-dir-regen` worktree
(`/home/bukzor/repo/github.com/bukzor/prototype.chatfs/worktree/atomic-chat-dir-regen/`),
not the main checkout this entry's `cwd:` names — same repo, separate
working tree.

User asked to fix `.claude/todo.kb/2026-07-13-000-Atomic-chat-dir-...md`,
calling it "both overdetermined and poorly designed." Ground-up redo:
problem inventory independent of any doc (five destroy-then-rebuild
sites: path_render's derived surface, `meta.json`, `capture()`,
view-symlink cleanup), then a full design session that replaced the
2026-07-14 "v2" per-artifact-helpers design (found to violate its own
success criteria — mixed old/new artifact sets visible to all readers,
an ENOENT window on every swap, in-memory buffering instead of
disk-spooled staging).

Landed design (not yet implemented):

- **Layout** moves captured exhaust out of `.chat/$UUID/` into a
  parallel `.data/$UUID/` tree, leaving `.chat/$UUID/` 100% derived and
  promotable as one unit (with a `.data` symlink back for inspection —
  keeps `grep -r`/`rg` working, since they don't follow encountered dir
  symlinks). Recorded as `[!TODO]` blocks in
  `design.kb/040-design.kb/chat-as-directory.md` (+ three
  `chat-as-directory.kb/` sub-docs) and `deterministic-regeneration.md`.
- **Mechanism** written as a design-sketch module,
  `chatfs_atomic.py` — imported nowhere yet, basedpyright-clean
  (0/0/0). Three public names (`read_locked`/`write_locked`/`staged`)
  over a private `_promote` kernel; `staged` recovers stale
  scratch/swap state on entry, promotes on success
  (`os.replace` for files/symlinks, `renameat2(RENAME_EXCHANGE)` for
  dirs with a two-rename-via-`.old` fallback), and preserves a failed
  attempt's on-disk bytes as `.fail` (latest-wins) on exception.
- Task file rewritten around this:
  `.claude/todo.kb/2026-07-13-000-Atomic-chat-dir-regeneration-...md`
  (same slug, redesigned content — problem/pointers/steps, mechanism
  detail left to the sketch).

Mid-session realignment: after the user's "one staged call for splat,
running inside it" correction, the assistant initially re-answered
inside the wrong frame (shrinking an API instead of restructuring the
pipeline) — see
`devlog/2026-07-15-000-atomic-regeneration-design-settled.md`'s
"Principles surfaced" for the pivotal-word trace
(`Skill(claude-realignment)` was invoked to unstick it).

**Not done:** no wiring. `chatfs_atomic.py` has no call sites; the
layout migration, splat's output-dir argument, and the three
`path_render` rewrites are all still `[ ]` in the task file. Two
environment notes for next pickup: `uv run basedpyright` is broken in
this worktree (`error: Distribution not found at:
file://.../worktree/basedpyright-as-pyright` — a sibling-worktree path
dependency; `uvx basedpyright <file>` works as a stopgap for
single-file checks, but won't catch cross-module issues once
`chatfs_atomic.py` gets imported); and `Skill(llm-subtask)`'s `session
end` marker still points at a `bin/session-end` that doesn't exist in
that skill's `bin/` (the dedicated `Skill(session-end)` is what
actually ran) — noticed, not fixed, not worth its own tracking entry.

Full session writeup:
`devlog/2026-07-15-000-atomic-regeneration-design-settled.md`. Not yet
committed as of this addendum — see that session's closing steps.

## 2026-07-12 (later): todo.md/todo.kb clear pass, dead-link cleanup

Ran `Skill(llm-subtask)`'s `todo clear`: verified every `[x]` item in
`.claude/todo.md` against a devlog record, stripped the verified ones out
(256 → 107 lines — all of Immediate plan's 4 steps, the 5 done "Next"
items, `provider-plugin-model.md` promotion, shared-code-among-providers),
and deleted the two fully-resolved `todo.kb/` files
(`2026-05-11-001-shared-code-among-providers.md`,
`2026-07-03-000-cross-provider-data-flow-drift...md`).

Verify-before-delete caught a real gap: the drift file's own "Success
Criteria" were all `[x]`, but one nested sub-item (thread AI Studio's
per-turn `createTime` into splat basenames, deferred 2026-07-03) was never
closed and wasn't tracked anywhere else. Promoted to a standalone
`todo.kb/2026-07-12-000-AI-Studio--thread-per-turn-createTime-into-splat-basenames.md`
(referenced from `todo.md`'s `## Later`) before deleting the drift file —
user's explicit call, not assumed. Also asked about (and user waived) a
devlog gap for the `time_dir_for`/`place_meta` test-coverage item.

Repo-wide grep for the two deleted files' basenames turned up dead links
in two *living* docs (not devlog, which is expected to reference
now-superseded state as history):
`design.kb/040-design.kb/provider-plugin-model.md` (2 links) and
`todo.kb/2026-06-20-000-aistudio-provider-parity-ladder.md` (2 links) —
all fixed, pointing at the surviving devlog record instead. Also fixed a
stale `devlog/CLAUDE.md` instruction (`llm-collab-devlog --title ... -C
../`) — verified by direct reproduction that it can't work, since the
script hardcodes `docs/dev/devlog/` and this incubator's own devlog is a
bare `devlog/`; documented as manual creation instead. Full writeup:
`devlog/2026-07-12-000-todo-clear-and-dead-link-cleanup.md`.

`basedpyright .` 0/0/0; `pytest .` 32/32 pass (no code touched, sanity
check only). Not yet committed — see this session's next turn.

## 2026-07-17: pipeline-class taxonomy, .data/ tee bugfix, module-shape-refactor amendment, root-capture cleanup

User asked for a classification of all scripts in the incubator
(decoupled-stdio vs. filesystem-coupled, plus further taxonomy). Landed
a source/filter/sink/orchestrator/lifecycle/infrastructure taxonomy
keyed by the existing verb vocabulary (browse=source, pluck/massage=
filter, splat=sink, render=view, trash=lifecycle) — reported to user,
not yet persisted into `design.kb/` (a step to do so was drafted then
explicitly removed at user request; see below).

Audit surfaced a real bug: all three `*_index_browse.py` scripts (claude,
chatgpt, aistudio) teed their debug CDP capture next to the source
scripts (`<provider>.index.cdp.jsonl`) instead of into
`chatfs.demo/<provider>/.data/`, where every other capture artifact
lands. Fixed (commit `8041c64`): routed through the shared
`DATA_DIR_NAME` constant, registered the new provider-root `.data/`
anchor in `docs/dev/technical-policy.kb/path-ownership.md`, corrected
three stale doc references (README.md, stdio-pipeline-shape.md,
incubator todo.md).

User separately suspected (correctly) that `chatfs_layout.py` should not
have absorbed pluck/capture logic during the 2026-07-15 jq→Python port
(the fold was a conscious 2026-07-14 planning decision, documented in
`.claude/todo.kb/2026-07-13-000-graduation-and-integration.kb/2026-07-13-000-module-shape-refactor.md`,
reversed here). Amended that plan (commit `905a4ac`): split
`chatfs/{pluck,capture}.py` out of a shrunk `chatfs/layout.py`
(path vocabulary/placement only), gave each provider its own
`provider/<p>/pluck.py` (wire knowledge: URL regexes, pluck functions),
and added a discussion-gate as the *first* Implementation Step — user
wants to discuss pure-vs-side-effected separation in the module
organization before any files move; the amended tree is explicitly a
checkpoint until that discussion happens, not a final answer. Two
steps drafted during the same pass (a boundaries test enforcing the
application/library exec-bit/shebang/`__main__` line; persisting the
taxonomy into `design.kb/`) were removed at explicit user request —
deferred, not forgotten, and not written down elsewhere; a future
session should not assume they're planned unless re-added.

Also repaired a dangling doc pointer (`driver-model.md`'s `[!TODO]`
referenced a tracker deleted 2026-07-12 without landing the work —
now points at the module-shape-refactor todo, which also gained the
subprocess→import conversion step and a chatgpt-splat-home decision
point for the eventual sweep).

**Root-level capture cleanup** (not committed — all gitignored, no git
action needed): ten stray `*.jsonl`/`*.json` files plus a vim swapfile
had accumulated at the incubator root since April–June, orphaned by the
`.data/` tee bug above. User pushback ("bro. no. just move them to
where they 'should have' been") after an initial pass that only
flagged them as a todo item. Content-sniffed each one rather than
guessing: `aistudio_conversation.json`'s JSPB payload named
`prompts/1vU6BlpV69d2MvI6L_oYGo_E-ZqmaI3eR`, which matched an existing
empty chat dir under `chatfs.demo/aistudio/.chat/` (had only
`meta.json`) — placed it and its paired `aistudio.cdp.jsonl` as that
chat's `.data/conversation.json.d/raw.json` + `.data/cdp.jsonl`. Claude
and chatgpt each had two competing raw-CDP captures of the same index
session; picked the more complete one by content evidence (line count /
plucked-page count, not just filename) for the single `.data/`
slot, moved the superseded one to a dated `trash/` subdir alongside
`claude.login.jsonl` (a `/new`-page capture matching no pipeline stage)
and the orphaned swapfile. Full mapping and reasoning is in this
session's chat transcript, not restated in any committed file — if the
`trash/` subdir is ever cleared, that reasoning goes with it unless
copied out first.

**Newly unlocked, not acted on:** the placed AI Studio
`conversation.json.d/raw.json` + `cdp.jsonl` mean
`docs/dev/design-incubators/chatfs-cli-mockup/.claude/todo.md`'s
"Later" item — live-verify the `conversation.json.d/raw.json` round
trip — can now be partially exercised offline (massage step only, no
Chromium) for chat `1vU6BlpV69d2MvI6L_oYGo_E-ZqmaI3eR`. Not run this
session; flagged for whoever picks that item up next.

Session ended via `/session-end` before a `subtask save`/full backlog
review — this addendum plus the two commits above are the full record
of what landed. `.claude/todo.md`'s Next/Claude gaps/Strategic/Later
sections are otherwise unchanged.

## 2026-07-18: verified and committed the 2026-07-17 chatfs_sh work

Picked up a fully-staged-but-uncommitted tree left by the prior
session (19 files: new `chatfs_sh.py`, `chatfs_locks.py`'s
`os.set_inheritable`, all 13 production call sites migrated, two
`todo.kb/` files closed, `todo.md` updated, devlog
`2026-07-17-001-chatfs-sh-close-fds-false-replaces-pass-fds-wiring.md`).
User asked "is this something we should commit?" — reviewed the full
staged diff (spot-checked representative files across all three
providers, confirmed the `subprocess.run` → `chatfs_sh.run` swap is
mechanical and consistent), independently reran `pytest -q` (86
passed) and `basedpyright .` (0/0/0) rather than trusting the
prior session's recorded numbers (75/75 — suite grew since).

The "staged changes" turned out to be an interrupted `git pull
worktree/atomic-chat-dir-regen/ --ff` (a `MERGE_HEAD` was still
present, left by a previous session that resolved but never
committed it) — not standalone work. First attempt used
`git commit-staged … -F <message-file>`, which silently produced a
*merge* commit (parents `6d98f99`+`ff1879f`) carrying a bespoke
feature-commit message instead of the repo's established
`Merge worktree/atomic-chat-dir-regen` convention (see `6d98f99`/
`d2effd0`/`0856b3f`) — pushed as `7febe2f` before the mismatch was
noticed. User caught it ("those changes shouldn't be in a merge
commit") and asked to fix rather than leave it. Reworded in place
without re-resolving anything: `git commit-tree` on `7febe2f`'s
existing (already-verified) tree with the same two parents and the
standard message, confirmed `git diff` between old and new commit
was empty, moved `main` via `git update-ref` (not `reset --hard`,
to avoid clobbering an unrelated uncommitted `todo.md` edit sitting
in the working tree), then `git push --force-with-lease`. Final
commit: `4c75787`.

This only completes the merge through `ff1879f` — the worktree
branch has since advanced 6 more commits (`aad5b3f`..`76f98c1`,
already pushed to `origin/atomic-chat-dir-regen`) that close the
*entire* parent atomic-chat-dir-regen task; see
`chatfs-atomic-regen-locks-wiring.md`. That merge is now a `todo.md`
"Next" item in the incubator (added this session, not yet
committed). No code changes made this session beyond the message
fix; no new backlog items beyond that pending merge and the
pre-existing `chatfs_sh.run` fd-inheritance coverage-gap note (now
moot — closed on the worktree branch, will resolve once that merge
lands).
