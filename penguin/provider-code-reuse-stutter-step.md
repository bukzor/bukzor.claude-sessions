---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.chatfs/docs/dev/design-incubators/chatfs-mockup-chatgpt
session:
  uuid: null
  started: 2026-06-22T11:56:25-05:00
  ended: null
cost-benefit-sweh:
  timebox:
    '@value': 3
    rationale: extract shared chatfs_layout.py + 3-method adapter; the seam is already identified
    confidence: unsure
  benefit-2w:
    '@value': 1
    rationale: chatfs is actively worked (commits 2026-07-03); writes the fork-fact notation once instead of twice, closing chatgpt parity
    confidence: unsure
  cost-of-delay-2w:
    '@value': 0.3
    rationale: the identified seam is hot context; third impl fresh
    confidence: tentative
---
# Provider Code Reuse Stutter-Step

A deliberate pause before finishing the AI Studio parity ladder: with a
third provider now in (chatgpt, claude, aistudio — all browser-captured),
decide **how/whether** to factor commonalities into shared "lib" code.
The motivating concrete payoff is closing the **chatgpt parity gap** — the
chatgpt renderer predates the fork-fact notation contract and emits no
fork facts; the claude renderer is the reference. Writing that notation
once (shared) instead of twice is the immediate forcing function.

(A separate session is doing AI Studio feature work — ignore it here.)

Grounding read this session:
- `.claude/todo.kb/2026-05-11-001-shared-code-among-providers.md` (strategic when/where)
- `.claude/todo.kb/2026-06-20-000-aistudio-provider-parity-ladder.md`
- `chatfs_chatgpt_layout.py` vs `chatfs_claude_layout.py` — ~90% identical;
  diverge only on item key names (id/title/create_time vs uuid/name/created_at),
  time_dir_for str|float vs str, and claude's extra `capture()` helper.

## Rule of three — landed 2026-06-22
`chatfs_aistudio_layout.py` + `chatfs_aistudio_types.py` written and
verified end-to-end (place_meta produces the same `.chat/$UUID/.data/` +
view-symlink shape; pyright clean). Three layout.py now sit side by side.

**The seam the third impl exposed:**
- *Identical verbatim across all three* (→ shared `chatfs_layout.py`):
  `safe_filename`, `_iso_offset`, `chat_dir_for`, `data_dir_for`,
  `resolve_chat_dir`, `_purge_view_symlinks`, `DATA_DIR_NAME`, and the
  body of `place_meta` (meta.json write + view-symlink placement).
- *Provider-shaped, collapses to a 3-method adapter*: `id`, `title`,
  `created_datetime() -> datetime`. This single seam absorbs BOTH the
  key-name divergence (id/title/create_time vs uuid/name/created_at) AND
  the timestamp-type divergence (str | float | numeric-string). `time_dir_for`'s
  per-provider variation is *only* the parse-to-datetime step.
- *Stays provider-side (extraction, not layout)*: aistudio's `index_item`
  JSPB synthesis; claude's `capture()` (an orchestration helper misfiled
  in layout).

## Pre-unification fixes — landed 2026-07-04
A different session (redirected by user's "first thing first") worked
`.claude/todo.kb/2026-07-03-000-cross-provider-data-flow-drift--pre-unification-fixes-vs-unification-scope.md`
instead of this file's own open work below — but that file's "Fix
before unification" list is exactly the precondition this stutter-step
was waiting on, and it is now **fully resolved**:
- aistudio splat/index_item retarget to the massaged doc (landed 2026-07-03)
- aistudio `create_time` mislabel fixed — anchors on first-chunk
  `createTime` (true creation), not `lastModified.revisionTime`
  (modification); matches chatgpt/claude's creation-time bucketing
- chatgpt failsoft → failfast: `extract_text_content` now raises on an
  unknown `content_type`; render's directory-scan now asserts
  `set(by_uuid) == set(mapping)` (narrower than claude's leaf-only
  prune-list pattern — live-data testing showed chatgpt's tree has many
  legitimately-bodiless *non-leaf* nodes, so a leaf-only prune list
  false-positived on real data; the actual "unknown type" risk is fully
  covered by splat's raise instead)

That file's "Solve by unification — do NOT fix in place" section (5
requirements: shared `capture()`, persist every pluck output, endpoint
cross-check, provider-complete `<details>` wrapping, pipe-vs-delegation
decision) is unaffected and still applies to the extraction below.

**Net effect: nothing outstanding blocks starting the extraction below.**

## Open work
- [x] Extract shared `chatfs_layout.py` parameterized by the 3-method adapter; reduce all three provider layouts to the adapter + provider extras
- [x] Decide shared-lib home: incubator-local vs promote to `packages/chatfs-core/` — incubator-local
- [x] Land chatgpt fork-fact notation parity via the shared notation (the concrete parity-gap payoff)

## Parity landed 2026-07-06 (overnight; awaiting user review)
Two commits on main, unpushed: `ad9ac4c` (reference-renderer fixes the
user directed: assert current leaf survives pruning; created_at ties →
last sibling; divider keyed on branch-head-ness so each branch renders
as one contiguous blockquote island) and `4995320` (shared
`chatfs_render.py` — Turn/ConversationTree/Renderer/render_tree +
`normalize_turnless` — with claude byte-identical on all 4 demos and
chatgpt gaining full fork facts, bodies projection-identical on both
demos). Devlog:
`docs/dev/devlog/2026-07-06-000-chatfs-mockup-chatgpt-chatgpt-fork-fact-parity-via-shared-render.md`

Review points for the user:
- IR-over-callbacks answer to their item-4 question: normalize into the
  invariant (`normalize_turnless`), don't parameterize the renderer.
- Divider semantics change: nested asides now render *inside* their
  branch's blockquote (see `960e14cf` before/after in
  `trash/fork-parity/`); goldened in the render test.
- chatgpt headings moved to date-minute times + branch-prefixed numbers.
- Push when satisfied; comparison renders in `trash/fork-parity/`.

## Docs-half review + reconciliation — landed 2026-07-06/07

User reviewed the docs (not code) half of `before`..HEAD under an
**alignment lens** (not accuracy-audit) via `/align`: excerpt-reader
sufficiency is primary; single-canonical-home, blockquote-isomorphism,
audience-ranking are endorsed tie-breakers; normalization-over-callbacks
is instrumental (holds only while it beats alternatives). The aborted
overnight session's uncommitted `verb=render.md` overlay was evaluated
"with two extra grains of salt" per instruction and split: its `re:N`
divider-subtitle mechanism was **reverted** (contradicts the notation's
own excerpt-redundancy principle, starves the heading-grep window); its
3 accurate additions were kept; its 2 unimplemented behavioral claims
(`***` divider, numbering-stability caveat) were re-expressed as
demarcated `[!TODO]` blocks under a new **doc-driven development**
convention (`Skill(llm-design-kb)`: undecorated prose is descriptive,
`[!TODO]` blocks are normative and worded as future-state declaratives
so landing = markup removal).

Also landed, at the user's direction, as durable knowledge from this
reconciliation:
- `~/.claude/design-rules.kb/{deterministic-by-construction,
  count-data-variants,removable-means-remove}.md` — generic principles.
- `docs/dev/technical-policy.kb/{determinism,stable-references,
  audience-ranking,normalize-into-invariants}.md` — project-scoped
  instances, `source: [user (bukzor)]`, `force: should`; the kb's
  "Partial, unvetted" banner was removed (only ever applied to the 8
  pre-2026-03-04-ChatGPT-distillation entries, distinguishable from the
  4 new ones by `source:`).
- `~/.claude/must-read.kb/when/asked-to-review-work.md` — review
  lenses ranked alignment → effectiveness (of the *specified*, incl.
  `[!TODO]`, system) → simplicity; not an accuracy audit by default.
- `technical-policy.jsonschema.yaml` gained a `source` property; the
  project's copy was a full duplicate at first (copy-drift risk
  flagged), then converted to a `skill://llm-design-kb/jsonschema/
  technical-policy.jsonschema.yaml` stub once bukzor-agent-skills'
  `$ref`/`skill://` mechanism landed (commits `55d3c1d`, `8a3a179`; the
  `schemas/`→`jsonschema/` rename for llm-design-kb itself landed
  externally mid-session too) — verified via `llm.kb-validate`, 11/11
  pass.

All landed and pushed: prototype.chatfs (`da969f9..4371e7a`, 8 commits),
dotfiles (`svelte-crostini`, `a78d3fc..de20491`), bukzor-agent-skills
(`94869df..8a3a179`, includes unrelated concurrent work on the same push).

## Open work

- [ ] **Code-half of the `before`..HEAD review, still outstanding**:
  `chatfs_render.py`, `chatfs_claude_conversation_render.py`,
  `chatfs_chatgpt_conversation_render.py`, and their tests — under the
  alignment → effectiveness → simplicity lens now codified in
  `~/.claude/must-read.kb/when/asked-to-review-work.md`. This is the
  one substantive carry-forward from this session; everything else
  above is closed.
- Not this session's scope, tracked elsewhere: `llm-design-kb/schemas/`
  → `jsonschema/` rename, for house-convention consistency with
  `llm-subtask/jsonschema/` — bukzor-agent-skills already has a live
  effort on this exact convention (`2026-02-09-000-schema-reuse-with-ref.md`
  and its 2026-07-07 follow-ons); pick up there, not here.
