---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.chatfs/packages/har-browse
session:
  uuid:
    - c28da494-09a8-4d0e-9f4d-0b7e0c2ce421
    - ad7fa8ea-749c-45ef-9c68-ed03db8928d6
  started: 2026-07-22T12:00:00-05:00
  ended: null
---
# har-browse completeness bugs (drain race + cache hydration)

Two real bugs behind the long-standing "wait until `has_more=false`"
flakiness on index-page captures, identified 2026-07-22.

## Current status

- **Drain race** (`todo.kb/2026-07-22-000-Done-Capturing-race-drops-in-flight-requests-with-no-drain.md`):
  fixes 1+2 (extended in-flight tracking + bounded grace-period drain)
  landed 2026-07-22, commit `b571e99`. Fix 3 superseded 2026-07-23 by
  `todo.kb/2026-07-23-000-Replace-grace-period-drain-with-abort-based-cut-at-Done.md`
  (not yet implemented — two spikes gate it, not yet run). Remaining on
  the original taskfile: `has_more=false` discriminator and live-capture
  validation, both blocked on a fresh live capture (ask-first).
- **Cache hydration** (`todo.kb/2026-07-22-001-claude-ai-revisits-render-from-persisted-React-Query-IndexedDB-cache--so-capture-sees-no-conversation-traffic.md`):
  implemented 2026-07-26 — `clearOriginStorage` (indexeddb +
  cache_storage, pre-goto, cookies preserved) behind
  `startCapture`/`--clear-origin-storage`, plus unconditional
  per-session `setCacheDisabled`/`setBypassServiceWorker`. Six tests,
  six mutation entries `done`, `pnpm test` green. Only live
  per-provider verification remains (ask-first). Devlog:
  `2026-07-26-001-*`.
- **Target coverage** (`todo.kb/2026-07-23-001-Zero-miss-target-coverage-via-Target-setAutoAttach.md`):
  service-worker/OOPIF/popup-pre-attach traffic invisible to per-page CDP
  sessions. Forensic pass + venue spike are the first steps, not yet run;
  the venue spike's verdict now also gates/triggers the host-migration
  todo below.
- **Host migration** (`todo.kb/2026-07-23-002-Migrate-capture-host-to-puppeteer-core.md`):
  CORE LANDED 2026-07-26 (devlog `2026-07-26-003`, commits
  `08023cf..df5ed11`): CaptureHost seam extracted (`capture.mjs` is the
  venue-agnostic core; `host_playwright.mjs` test shell,
  `host_puppeteer.mjs` production shell), CLI runs puppeteer-core, UA
  probe/cache subsystem deleted (user-ratified branding trade: popup
  first-requests unbranded until auto-attach), playwright demoted to
  devDeps behind `tests/import_graph.test.mjs`. Remaining: tripwire 2
  (live provider login -- batched into the standing live `--howto`
  session), `.mjs`→`.ts` fold-in, mutation entries for the new shell.
- The `has_more=false` symptom itself is still unattributed to either
  bug: the only local claude capture (`a59dc891`) has no index-page data
  to discriminate with. Needs a fresh live capture reproducing
  `has_more=false` — ask-first browser/network action, not run any
  session so far.

## Addenda

Per-pickup write-ups: `har-browse-completeness-bugs.kb/`.

## Devlogs

- `packages/har-browse/docs/dev/devlog/2026-07-22-000-har-browse-Done-Capturing-drain-race-fix.md`
- `packages/har-browse/docs/dev/devlog/2026-07-23-001-capture-cut-semantics-pivot-and-gap-closure-planning.md`
- `packages/har-browse/docs/dev/devlog/2026-07-23-002-Frontier-ratification--doc-accuracy-pass--todo-restructuring.md`
