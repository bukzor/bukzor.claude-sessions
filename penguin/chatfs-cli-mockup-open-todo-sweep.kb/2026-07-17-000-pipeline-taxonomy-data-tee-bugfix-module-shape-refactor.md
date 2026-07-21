# 2026-07-17: pipeline-class taxonomy, .data/ tee bugfix, module-shape-refactor amendment, root-capture cleanup

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
