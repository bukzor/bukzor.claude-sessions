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
    - 697262c3-a774-445e-9fbe-483249dcfd1b
    - 66297935-bc0a-4b2c-a1f8-0052cfa1142f
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

Current state: the Immediate plan (4 steps) is done; the incubator has since
graduated (see Addenda), so the backlog below is carried against
`packages/chatfs-cli/`.

Taskfile: `.claude/todo.md` (this incubator's own tactical list; project-wide
work lives in `../../../../.claude/todo.md`, which now carries an "Immediate
plan" section — read that first on pickup).

## Decisions in force

- **Driver model**: a well-decomposed CLI with importable generator
  functions; pipe and delegation are thin drivers over the same library.
  Documented in the design kb's `driver-model.md` (landed 2026-07-11, step 4
  below).
- The 2026-07-10 shared-lib-destination ruling (`$REPO/lib/chatfs/`) is
  superseded: the incubator graduated to `packages/chatfs-cli/` (see
  Addenda).

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

## Addenda

Dated pickup write-ups (2026-07-09 through 2026-07-20) moved to
`chatfs-cli-mockup-open-todo-sweep.kb/` — one file per addendum,
`ls` for the full chronological list. Latest: 2026-07-20, the claude
family edit pass (real package imports, pure/shell split, subprocess→
in-process conversion) — closes module-shape-refactor's "move one
provider family end-to-end" step; chatgpt/aistudio sweep against this
template is next.

2026-08-08: the incubator has graduated — code to `packages/chatfs-cli/`
(2026-08-07, umbrella children 000/001), its `design.kb/` followed
(2026-08-08, child 005; ADR `docs/dev/adr/2026-08-08-000-chatfs-cli-graduates-from-the-incubator-with-its-design-kb.md`).
The incubator README carries a Historical banner; work continues against
`packages/chatfs-cli/`, not here. (The earlier `$REPO/lib/chatfs/`
graduation-target decision was superseded by the landing.)
