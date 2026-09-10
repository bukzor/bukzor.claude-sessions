---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills
session:
  uuid: # chronological; append your uuid when picking this entry up
    - abb4c2bd-f2ca-4df1-b54c-61f05b3c603d
  started: 2026-09-10T09:06:50-05:00
  ended: null
---

# Stop Mandating Per-Repo Skill Re-Declaration

Skill guidance still tells consumer repos to declare a skill in their
`CLAUDE.md` frontmatter for an occasion the skill's own `description:` already
names — a leftover from before `triggers:` existed, when a `CLAUDE.md` field was
the only way to route a skill. The owner's word on 2026-09-10: "that's a
leftover from a pre-triggers world. And there's other skills with the same
problem… I'll address it holistically in another session."

Taskfile:
/home/bukzor/repo/github.com/bukzor/bukzor-agent-skills/.claude/todo.kb/2026-09-10-000-stop-mandating-per-repo-skill-redeclaration.md

## Why it needs a session rather than an edit

llm-kb contradicts itself, and the stale side is the enforcing one. `SKILL.md`
says a root CLAUDE.md "needs no frontmatter declaring this skill; the
`description:` carries the trigger" — while `skill.kb/self-audit.kb/`'s
`claudemd-completeness.md:16` and `claudemd-enumeration.md:44` mandate exactly
that declaration, the latter supplying `when: creating or maintaining a .kb/
collection`, a verbatim abbreviation of llm-kb's own `description:`. So the
audits don't merely permit the duplication, they **generate** it in every
kb-using repo and **re-generate** it after removal. `basedpyright-as-pyright`
removed one (commit `d28b932`) and is now non-conformant to its own skill's
audits.

The deliverable is therefore a discrimination rule, not a batch of edits —
delete where the `description:` already names the occasion, migrate to
`triggers:` only where the condition is genuinely repo-specific, and leave what
isn't a directive at all. Migrating first produces a well-formed duplicate,
which lints clean and is still wrong.

## Second finding, same sitting: `depends:` has two owners

Not the same defect, but it will corrupt any mechanical sweep that trusts the
linter, so it is scoped into the same taskfile.

`llm-triggers-lint` claims the field name unconditionally
(`bin/llm-triggers-lint:51`, `DIRECTIVE_FIELDS = ('requires', 'depends',
'triggers')`; `depends` also in `RETIRED_FIELDS`) and consults no schema.
`llm-discourse-graph` declares `depends:` in five of its own schemas — "Paths to
nodes this claim depends on for context" — and `SKILL.md:131` tells authors to
add it. Both are current.

Measured consequence in `template.python-project`: of its 21
`bare-unconditional` errors, only **6** are skill declarations; the other **15**
are `discourse.kb/` claims and questions whose `depends:` is a graph edge under
a `$ref`'d schema. Those 15 are unfixable from the consumer side, and
"migrating" them would corrupt the graph. Every discourse graph in the fleet
lints dirty permanently — the same "noise that trains the eye off a red count"
this backlog already records twice.

## Open work

- [ ] Rule on the discrimination rule itself — it is agent-authored and
      vetoable, and it is the taskfile's stated deliverable.
- [ ] Fix the two llm-kb audits before sweeping any consumer, or the sweep
      undoes itself on the next self-audit pass.
- [ ] Decide who owns `depends:` — rename one side, or teach the linter that a
      key declared by the collection's own schema is data.
- [ ] Sweep the other skills. Known-plural per the owner; only llm-kb was
      confirmed on 2026-09-10. Start from
      `grep -rn --include='*.md' -iE 'declares? this skill|frontmatter declar' .`
- [ ] Check `llm-must-read-kb`, the predecessor subsystem, for the same
      assumption.

## State on disk

`bukzor-agent-skills` was left dirty with the owner's unrelated in-flight
`docs/dev/claims.kb/` work; only the taskfile and its `.claude/todo.md`
breadcrumb were committed from this session. The repo's own frontmatter is
clean (`987 files, 0 errors`), so this is a defect in guidance text, not in
data.
