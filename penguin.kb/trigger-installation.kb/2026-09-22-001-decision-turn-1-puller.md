# Decision: a mechanical puller for the turn-1 install?

Posed 2026-09-22. Distinct from compaction (ruled in
`../must-read-sharding.kb/2026-09-22-000-decision-after-compaction.md`,
whose `SessionStart compact` hook fires only after a compaction). This is
about the *first* install of a fresh session, which no `SessionStart`
matcher reaches without also firing in no-tool-call sessions -- your
stated objection.

ruling:        # edit in place: now / after re-measure / never, with words

## The mechanism

A `PreToolUse` hook (any tool) that, on the first call of a `session_id`,
emits `llm-must-read-ls ~` as additional context. First-call detection is
not native: it needs a marker file keyed on `session_id` (one `touch`,
one `test -e`), which `must-read-sharding` counted against it. Cost per
session: one listing, ~1.4k bytes, once. It cannot honor the "explicitly
requested calls need no listing" ruling -- a hook cannot tell a `! cmd`
from a chosen call -- so it would over-install on exactly those.

Under `must-read-sharding`'s GRADIENT/BACKSTOP frame it is a backstop
beneath the judgment puller (the frontmatter trigger), fires after
planning, and so is late for the first call's own `before/` entries but
in time for everything after.

## What it would have bought

From the 45-day table (`2026-09-19-000-archeology-of-a9fd5254.md`):

| model      | turn-1 misses under current wording | of sessions |
| ---------- | ----------------------------------- | ----------- |
| fable      | 0                                   | 19          |
| opus       | 2 (both fired by call 5)            | 14          |
| sonnet     | 4 (2 never)                         | 9           |

You set fable as the default model on 09-19. On fable the hook fires
usefully about never; on sonnet about 4 in 9 sessions.

## Second projection

- **Dated consequence:** 09-16 in this session, the hook fires at `L23`
  (`cat` of the cron log), the listing lands, and `before/git/` is in
  context before `L42`'s first git command -- the wrong refusal on 09-18
  does not happen.
- **The check that settles it:** after the install-change decision lands,
  the sonnet turn-1 rate over the re-measure window. >= 8/9 and the hook
  buys nothing; still ~5/9 and it is the remaining fix for that model.

## Live alternatives

- **Now.** Closes sonnet turn-1 regardless of wording. Costs a marker-file
  hook to maintain and over-installs on requested calls.
- **After re-measure** (position). The frontmatter change is the cheaper
  fix for the same hole and is untested; build the backstop only if it is
  still needed on a model you still use.
- **Never.** Accept ~44% turn-1 miss on sonnet, 6% on opus.
