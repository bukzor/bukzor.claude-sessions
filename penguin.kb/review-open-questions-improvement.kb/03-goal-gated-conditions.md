# Rewritten in the collection's own form, not ratified as it stood

Ruled 2026-09-01: it fails the writer/consumer razor "pretty badly" —
"perhaps there's something that does belong under use-cases related to
this, but it would look quite different."

Confirmed, and the collection had said so in advance.
`use-cases.kb/CLAUDE.md` requires "the need, what serves it today, and
what 'satisficed' means — stated as effects, not mechanisms," and
sends solutions to `040-design.kb/`. Three of the four paragraphs were
neither: a defect definition, a provenance block (two commit SHAs,
"caught by the owner within hours", the quoted ruling), and a repair.
Only the satisficed clause was in house form. `arrival-fired-directives.md`
is the model — need, `Today:`, `Satisficed when:`.

**Done, not ratified.** Rewritten to three paragraphs in that form:
the need is stated as two disjoint populations and which one the
condition must select; `Today:` describes what an author's natural
phrasing does, keeping `when: writing the side-by-side` as the
deployed shape the way `payload-gated-conditions.md` keeps `depends:`;
the satisficed clause is unchanged. Provenance and the repair
paragraph moved to the fleet devlog. `status: proposal` stays — the
rewrite is mine, the ratification is yours.

**Rider, resolved:** the collection now has
`use-cases.jsonschema.yaml` — `status` only, `proposal`/`rejected`, no
layer-entry base and no `why:`, since use cases are auxiliary and
unnumbered. `llm.kb-validate design.kb/` → 27 files, 0 errors; the
tower's standing validation error is gone. The schema was required by
the pattern once any entry carried frontmatter, so writing it was
compliance rather than a decision.

**Left open:** whether this shape earns a file separate from
`arrival-fired-directives.md`. Both name the same need — the delivery
must reach the agent *about to* act — and differ only in which
direction the condition misses: arrival-fired fires too broadly,
goal-gated too narrowly. The collection organizes by condition shape,
which argues for keeping both; the add-criterion says "not reducible
to an existing entry," which argues against. Not acted on.
