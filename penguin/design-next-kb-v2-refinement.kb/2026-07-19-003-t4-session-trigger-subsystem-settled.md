# 2026-07-19: T4 session — trigger subsystem settled

T4 settled — all four axes, operator-ratified incrementally in
conversation before each edit. Journey ADR (derivations, corrections,
rejected alternatives):
`bukzor-agent-skills/docs/dev/adr/2026-07-19-001-Trigger-subsystem-condition-vocabulary-and-interpretation-model--T4-.md`.

- **Packaging**: in-suite, not peer — triggers depend on `llm-kb`
  outright; no triggers-without-kb consumer exists, so no revisit
  trigger. New skill `llm-triggers/` seeded as the trigger class's
  successor to `llm-must-read-kb`, holding subsystem specifics at a
  grain finer than design-next.kb's own (recording-home question,
  live-corrected mid-session: packaging and recording-home are
  independent axes, not one).
- **Condition vocabulary**: three neutral kinds (command pattern,
  path pattern, lifecycle point) plus a hooks-in-disguise admission
  test — a condition qualifies only if a mechanism-free agent could
  still notice it during planning. Recorded in
  `llm-triggers/design.kb/040-design.kb/condition-vocabulary.md`.
- **Compilation model**: rejected in favor of interpretation — one
  static per-runtime shim reads trigger files at fire time; no
  generated artifact, so staleness is structurally impossible.
  `class-trigger.md`'s old "`kb doctor` verifies the compilation" is
  replaced by a coverage report. The always-on filename-scan
  semantics ("the floor") is not a fallback — it's the meaning every
  trigger carries on every consumer, regardless of mechanical
  binding, and is what makes per-consumer support level
  non-lockstep.
- **Bank format**: one authoring format for action- and
  judgment-shaped triggers; only enforcement strength varies.
- **Task↔trigger boundary** (T3's inherited open item): a shared
  wake-condition value grammar — juncture (`at`/`before`/`when`/`after`)
  × self-disambiguating type (date/instant/`file:`/prose) — serving
  both task deferral and future-work's existing `trigger:` field as
  one primitive. `status: proposal`, per-cell sweep semantics still
  open.
- Empirical input resolved: skill-bundled `commands/` subdirectories
  do not resolve as `/<name>` or `/<skill>:<name>` — tested directly
  with a scratch skill + `claude -p` probes, then cleaned up. Only
  plugins bundle multiple verbs (`/<plugin>:<name>`); a skill itself
  is the top-level `/<skill>` command.
- `design-next.kb/040-design.kb/class-trigger.md` and
  `delivery-boundary.md` rewritten to state properties only and cite
  `llm-triggers` rather than deferring to "pending T4"; both entries'
  `status: proposal` is gone — the T4 blocker on the v2 green-light
  is cleared.
- Left open, folded into the tower-wide proposal-ratification sweep:
  several `status: proposal` entries and `[!QUESTION]` blocks inside
  `llm-triggers/design.kb/` (elaboration-frontmatter field names,
  per-cell wake-condition sweep semantics, exact hook-event
  bindings).
- Committed in three steps (`bukzor-agent-skills`, pushed status
  unchecked at time of writing): seed `llm-triggers/` + design-next.kb
  updates; `.claude/todo.md` closeout + journey ADR.
