# 2026-07-23 pickup: cut-semantics formalization; abort-cut + auto-attach todos

Discussion of `b571e99`'s grace-period drain (landed 2026-07-22) surfaced
that it waits for response data arriving *after* the Done click — outside
anything the user or client JS ever witnessed. Formalized as a durable
requirement,
`packages/har-browse/design.kb/030-requirements.kb/capture-cut-completeness.md`
(cohort = events before the cut; no timer may participate in drain
correctness), with supporting design entry
`packages/har-browse/design.kb/040-design.kb/capture-cut-model.md`
(swim-lane model + five-class gap taxonomy).

Consequences:

- `2026-07-22-000`'s fix 3 (truncation-marker flush) is **superseded**,
  not implemented — new taskfile
  `todo.kb/2026-07-23-000-Replace-grace-period-drain-with-abort-based-cut-at-Done.md`
  replaces the grace period with forced termination (abort in-flight
  requests at the cut) + event-driven settle. Two spikes gate it
  (offline-emulation abort behavior; CDP command/event ordering for a
  delivery barrier), both runnable against existing fixtures, not yet
  run.
- New taskfile
  `todo.kb/2026-07-23-001-Zero-miss-target-coverage-via-Target-setAutoAttach.md`,
  promoted from an ideas.kb entry — service-worker/OOPIF/popup-pre-attach
  traffic invisible to per-page CDP sessions. Forensic pass + Playwright-
  transport venue spike are the first steps, not yet run.

Commit: `884cfed` ("har-browse: formalize capture cut/cohort semantics;
design.kb graduation").

## Note for the next pickup (as of this write-up)

A concurrent session (not this one) was independently deepening
`design.kb/`'s mission/goals/requirements/design layers around the same
date (data-possession mission, capture-everything goal,
crash-durability/in-flow-termination/unblocked-sessions requirements, a
`capture-tap.kb/` sub-collection, and per-layer jsonschema validation)
and, as of this pickup's end, was still actively adding a
`070-future-work.kb/capture-implementation-frontier.kb/` survey of
capture-tap alternatives (pure-CDP, puppeteer-core, mitm-proxy,
browser-extension, etc.) with uncommitted changes left in the working
tree on purpose — not swept up by this pickup's commit.

Two sessions independently reached the same conclusion at one point (both
deleted the same 4 mutation-testing.kb + 1 ideas.kb entries for the
superseded fix 3 / target-coverage idea); only one commit (`25fd900`, not
this pickup's `884cfed`) ended up owning that deletion — a reminder that
`git status`/`git diff` against the actual parent commit is more
trustworthy than which `git rm`/commit call you personally issued, when
two agents share one working tree.
