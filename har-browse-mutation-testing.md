---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.chatfs/packages/har-browse
session:
  uuid: da61b871-fdc4-4c37-9171-77db57fa10d7
  started: 2026-05-19T15:17:25-05:00
  ended: 2026-05-19T15:52:04-05:00
---

# Har-Browse Mutation Testing

Post-hoc TDD on `packages/har-browse/` via Skill(mutation-testing).
Established `packages/har-browse/docs/dev/mutation-testing.kb/` (kb
root + 22 mutation entries), drove the small leaves through
inject→test→revert first (cache.mjs, user-agent.mjs, inject.mjs, 9/9
caught), then the larger capture.mjs (6/13 caught, 6 gap, 1 still
todo).

## Outcome

- 15 `done` (caught by tests; 7 of those by new tests added this session)
- 6 `gap` (real-but-not-exercised; documented gating fixtures each
  would need)
- 1 `todo` — `events-subscribed-after-cdp-attach` (deferred to fresh
  session)

## New tests

- `src/cache.test.mjs` — 6 unit tests for `cachePath`: string-key
  shape, hive-key shape, slash-escape (M3), `=` assertion, NUL key,
  NUL value. Switched to colocated convention (`src/X.test.mjs`
  instead of `tests/X.test.mjs`) at user's request; `package.json`
  `test` and new `test:unit` scripts now run
  `'src/**/*.test.mjs' 'tests/*.test.mjs'`.
- `src/user-agent.test.mjs` — 3 tests seeding the cache to assert
  SUFFIX wrapping and cache-key hive includes `revision` and
  `headless`. Avoids real browser launches in CI by pre-seeding the
  cache file the production lookup will hit.
- `tests/persistent_injection.spec.mjs` — added two tests:
  - `"injectOverlay is idempotent: double-register yields one
    overlay"` — calls `injectOverlay` twice, navigates, asserts
    overlay/button count is 1.
  - `"Done click handler is registered { once: true } and removed
    after first fire"` — uses CDP `DOMDebugger.getEventListeners` to
    count click listeners on `#capture-done` before/after a click.

## Gaps recorded (with fixture needed to convert to done)

- `barrier-snapshot-not-frozen` — phantom mutation; `[...inFlight]`
  vs `inFlight` is semantically identical for `Promise.allSettled`.
- `barrier-promise-not-tracked` — needs adversarial per-id delays so
  BARRIER#1's snapshot waits longer than BARRIER#2's; with track()
  removed, BARRIER#2 emits first and the reentrant test's
  consumed-size-by-position check fails.
- `done-finally-skips-inflight-drain` — needs a long-delayed
  `/payload?delay=300` issued just before Done click so its body
  fetch lands after `emitter.emit("end")` if drain is dropped.
- `awaiting-body-not-deleted` — leak, not behaviorally observable;
  would need internal-state hook.
- `loading-failed-no-rr-flush` — needs toy_server route that writes
  headers then drops connection mid-body.
- `body-attached-after-loading-finished` — original "chrome-har will
  drop entry" premise was wrong; chrome-har joins RR+LF by requestId
  regardless of CDP order. To catch, would need per-request "RR
  precedes LF" assertion on raw JSONL. Severity reassessed downward.

## Follow-up

Local todo: `packages/har-browse/.claude/todo.md` "Mutation testing"
section.

## See also

- `packages/har-browse/docs/dev/mutation-testing.kb/CLAUDE.md` — kb
  overview & workflow.
- Skill(mutation-testing) — `~/.claude/skills/mutation-testing/SKILL.md`.
