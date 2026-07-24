---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.chatfs/packages/har-browse
session:
  uuid:
    - 0f825524-668f-43a1-aaba-e056db478802
  started: 2026-07-23T00:00:00-05:00
  ended: null
---
# har-browse Capture-Implementation Frontier

Started from classifying `tests/` assertions into acceptance-criteria
vs. implementation-detail vs. historically-contingent-proxy. That
classification surfaced a green-field question: quotienting away every
historically-contingent commitment (including the CDP-shaped JSONL
record itself, and the toy overlay/BARRIER machinery), what's the
minimal-complexity implementation of BB1 capture? Traced a frontier
across owned-code / total-middleware / silent-miss-risk axes and
realigned `design.kb/` to the corrected understanding: new mission
(`010-mission.kb/data-possession.md`), goal (`capture-everything`),
requirements (`crash-durability`, `unblocked-sessions`,
`in-flow-termination`), and a `040-design.kb/capture-tap.kb/`
sub-decision (promoted from an overgrown flat file — tap point / record
format / marks).

The frontier itself is recorded as a Decision Point:
`070-future-work.kb/capture-implementation-frontier.md` +
`.kb/` (8 candidates, 4 frontier-optimal). Comparison table is
generated from each candidate's frontmatter by
`capture-implementation-frontier.sh` (`md-frontmatter` + `jq`) —
regenerate it rather than hand-editing the table in the `.md`.

## Open thread

`design.kb/050-components.kb/toy-capture.md` carries a `[!QUESTION]`:
should Playwright be demoted to a dev/test-only dependency, given the
survey found it dominated on both owned-code and footprint axes by
`pure-cdp-spawned.md` / `puppeteer-core-node.md`? Unresolved — pick up
by reading that question plus the two named candidates. If it resolves
toward replacement, this is a real implementation project (rewrite the
production capture path), not just a doc update; size it as its own
session.

## Note for whoever picks this up

A concurrent process (own commit 884cfed, "har-browse: formalize
capture cut/cohort semantics; design.kb graduation") is actively
editing `design.kb/040-design.kb/capture-cut-model.md` and
`.claude/todo.kb/2026-07-23-000-*` on the abort-based-cut line of work.
Unrelated to this entry — left untouched — but expect drift there
between sessions; see `har-browse-completeness-bugs.md` for that
thread.

## Addenda

Per-pickup write-ups: `har-browse-capture-implementation-frontier.kb/`.
