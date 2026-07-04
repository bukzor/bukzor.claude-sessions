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

## Open work
- [ ] Extract shared `chatfs_layout.py` parameterized by the 3-method adapter; reduce all three provider layouts to the adapter + provider extras
- [ ] Decide shared-lib home: incubator-local vs promote to `packages/chatfs-core/`
- [ ] Land chatgpt fork-fact notation parity via the shared notation (the concrete parity-gap payoff)
