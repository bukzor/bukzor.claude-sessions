---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills/llm-kb
session:
  uuid:
    - 2fc65ba3-d504-485c-8bd4-ee76beb66fa6
  started: 2026-05-27T09:33:43-05:00
  ended: null
cost-benefit-sweh:
  timebox:
    '@value': 3
    rationale: apply open migrations backlog + shell-guideline cleanup of migrate scripts + ADR home decision
    confidence: unsure
  benefit-2w:
    '@value': 0.5
    rationale: kb consistency; unblocks strict-schema rollout
    confidence: unsure
  cost-of-delay-2w:
    '@value': 0.1
    rationale: backlog is durable and self-describing
    confidence: unsure
---
# Apply the migrations.kb Backlog

Centralization point for ongoing work on
`~/.claude/skills/llm-kb/migrations.kb`. The durable part -- which entries
are open and how to apply one -- lives in that collection's `CLAUDE.md`
under "Working the backlog"; that is the source of truth, not this file.

## Open

- [ ] Apply the open migrations.kb backlog. List + procedure +
      `depends-on` ordering: `~/.claude/skills/llm-kb/migrations.kb/CLAUDE.md`
      ("Working the backlog"). Now includes the new
      `2026-05-27-000-skill-notation-to-agent-skill-uri` (planning); its
      load-directive prerequisite (convention + each SKILL.md `setup:`
      block updated before the textual sweep) is recorded in the entry.
- [ ] Migration scripts violate the user's shell guidelines
      (`2>/dev/null`, `grep` for control flow, per-process redirects).
      Cleanup pass over `migrations.kb/*/{validate,migrate}.sh`.
- [ ] Decide ADR home for the agent-skill URI scheme: currently
      `llm-kb/docs/adr/2026-05-18-000-agent-skill-uri-scheme.md` (chosen
      for `agent-skill://`-addressability + symlink-robust refs) vs
      repo-root `docs/dev/adr/` (where other cross-skill ADRs live).
      Moving it means rewriting 4 `agent-skill://` links.

## Addenda

Dated pickup write-ups moved to `apply-migrations-kb-backlog.kb/` — one
file per addendum, `ls` for the full chronological list. Latest (and
only, so far): 2026-05-27 — strict-schema-propagation advanced to
`verified`, `migrations.jsonschema.yaml` authored, agent-skill:// unit
committed; earlier schema-propagation work + unrelated in-flight
debolding remain uncommitted and intermixed.
