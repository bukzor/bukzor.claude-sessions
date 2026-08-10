# 2026-07-12 (later): todo.md/todo.kb clear pass, dead-link cleanup

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
