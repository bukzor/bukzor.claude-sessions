---
cwd: /home/bukzor/repo/github.com/bukzor/template.python-project
session:
  uuid: 8614a837-cce4-42ad-87d5-06555a4b08ba
  started: 2026-06-24T15:35:42-05:00
  ended: 2026-06-28T11:49:42-05:00
cost-benefit-sweh:
  timebox:
    '@value': 0
    rationale: 'explicitly background: repo-specific actions moved to the repo queue; the hoist item is rated at ~/.claude/todo.kb'
    confidence: confident
  benefit-2w:
    '@value': 0
    confidence: confident
---
# template.python-project → polyglot, self-similar, buck-unified monorepo template

Started from the copier `project_type: app|lib` question and expanded into the
template's whole direction: a **polyglot, self-similar, composable repo
template** with **buck2 as the cross-ecosystem unifying spine** and native tools
(uv/pnpm/cargo) as the drive-by surface. Design persisted as two cross-linked
trees, both validating clean (`llm.kb-validate`):

- `template.python-project/discourse.kb/` — **descriptive** (what's true / what follows)
- `…/docs/dev/design/` + `…/docs/dev/technical-policy.kb/` — **normative** (goals + design-rule values, RFC-2119 `force`)

Root `CLAUDE.md` now declares the kb skills + a Knowledge-bases overview.
Reasoning of record lives in `discourse.kb` — extract and reference; do not
re-litigate.

## Open follow-ups

Repo-specific next-actions have **moved to the repo's own queue** (this entry is
background; execute there):

- `template.python-project/.claude/todo.kb/2026-06-28-000-adopt-buck2-as-the-polyglot-spine-rename--pythonnode-proof.md` — rename + Python+Node buck proof + cell-alias spike + third-party derisk
- `…/2026-06-24-000-copier-projecttype-app--lib-question.md` — the reframed `project_type` question

Personal-global hoist (still at `~` scope):

- [ ] [`~/.claude/todo.kb/2026-06-27-000-hoist-polyglot-monorepo-architecture-convention--values-to-personal-global-scope.md`](../todo.kb/2026-06-27-000-hoist-polyglot-monorepo-architecture-convention--values-to-personal-global-scope.md) — extract the convention + hoist the values; may belong under `private.bukzor-llc`
