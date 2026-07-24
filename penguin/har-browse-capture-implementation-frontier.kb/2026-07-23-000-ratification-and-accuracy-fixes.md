# 2026-07-23 pickup: user review, accuracy fixes, ratification

A separate session (not the one that authored the frontier survey)
reviewed it at the user's request — the survey and the capture-cut
synthesis around it had been agent-generated and not yet reviewed by the
user. Left this session's own in-flight schema-migration work
(`capture-implementation-frontier.sh` rewrite, `"@value"`/`description`
shorthand, `jsonschema/valued.jsonschema.yaml`) untouched; that's this
entry's own thread, not this pickup's to resolve.

## What this pickup found and fixed

- Verified the survey mechanically (`llm.kb-validate`,
  `llm.kb-validate-links`, `why:` chain tracing, byte-diff of the
  comparison table against its generator) — cohesive overall.
- Two false claims in candidate prose, self-contradicted by their own
  frontmatter numbers: `mitm-proxy.md`'s "least owned code of any
  candidate considered" (false against `~250` vs. others' lower
  numbers) and `pure-cdp-spawned.md`'s "most owned code of the three
  frontier-optimal candidates" (there are four).
- Discussed the frontier trade-offs explicitly: the axes aren't equally
  weighted — this project's own requirements
  (`crash-durability`, `unblocked-sessions`) rank silent-miss/
  crash-durability above owned-LOC, which the survey's
  "frontier-optimal" tag alone doesn't capture. Measured the current
  Playwright implementation's actual owned-LOC split (~667 total in
  `src/`, ~180 existing only to fight the framework) to ground the
  comparison in fact.
- **Ratified:** two winners, not one — `puppeteer-core`/chromiumoxide as
  the near-term host (same architecture as `pure-cdp-spawned.md`,
  library-mediated), and `browser-extension-tap.md` as the eventual
  production surface, gated on the capture-semantics layer stabilizing
  first. The current implementation is dominated.
- Turned the ratification into a new strategic todo,
  `packages/har-browse/.claude/todo.kb/2026-07-23-002-Migrate-capture-host-to-puppeteer-core.md`,
  cross-linked from `2026-07-23-000-*`/`2026-07-23-001-*`.

## Open, unresolved (belongs to this entry's own thread)

`design.kb/070-future-work.kb/capture-implementation-frontier.md`'s
`## Comparison Table` (marked generated, "re-run and paste over") is
stale against this session's own in-flight rewrite of
`capture-implementation-frontier.sh`, which as of this pickup no longer
emits a markdown table — it emits one YAML document per candidate.
Filed as a `packages/har-browse/.claude/todo.md` bullet rather than
resolved by the reviewing session, since the resolution (table vs.
YAML-passthrough) is this thread's call. See that todo.md bullet or
`docs/dev/devlog/2026-07-23-002-Frontier-ratification--doc-accuracy-pass--todo-restructuring.md`
for the reviewing session's full account.
