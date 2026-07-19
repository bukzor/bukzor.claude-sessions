Part of `../design-next-kb-v2-refinement.md`.

# 2026-07-18: post-T2 cleanup pass

Worked the top-level `todo.md` backlog in order, resolving everything
mechanically- or quickly-decidable; left the items needing a real
dedicated session or operator collaboration alone (see Live
Follow-Ups). Commits `e17867e`..`9972588`, pushed.

- **T2 landed**: the core-and-classes rework committed as
  `78aed25`..`3f1b07f` (rename sweep → drafts → proposal tagging →
  review fixes F1–F5 → brief closeout).
- `decisions-are-settled-questions.md` rewritten to cite `kb-spec.md`'s
  synthesis-file element instead of restating it; fixed the dangling
  "supersedes the decision sub-type" sentence (`class-record.md` never
  had one to supersede).
- "summary" → "synthesis" rename swept across the whole llm-kb /
  llm-design-kb / design-next.kb tower (SKILL.md, self-audit.kb file
  rename, references, test fixtures, a couple of stale todo.kb/ideas.kb
  mentions). Devlogs and unrelated skills (llm-collab,
  llm-chat-librarian, llm-discourse-graph, llm-vitals) deliberately
  left untouched.
- `llm-design-kb/SKILL.md`'s `why:` teaching example was still bare-slug
  style, stale since the 2026-07-13 file-relative-path decision.
  Operator call: propagate the convention into llm-design-kb generally
  (its own `technical-policy.jsonschema.yaml` already treated `why:` as
  untyped paths, so nothing else relied on slugs).
- `references-are-structured-data.md`'s two open questions
  operator-ratified: `references:` labels are kebab-slugs (not free
  strings, matching every other identifier in the tower); no separate
  hardened-label registry (the promoted key's own schema entry is the
  record). `blocked-on: discussion` cleared; still `status: proposal`.
- Session-log residue test run for real: skimmed 3 actual devlog
  entries (llm-collab, llm-kb). Verdict: **cut** — every section
  (narrative-of-failure, decisions/alternatives, conventions
  established, open items) already has a better v2 home (incident,
  design entries, principles/procedures, task entries respectively);
  no residue, no nameable read-back moment. `class-record.md` and
  `core-and-classes.md` updated to drop the session-log sub-type.
- Chatfs-harmonization coordinator's own checklist was stale: the
  llm-kb `.d → .kb` rename child is actually done (verified — no
  `.d/` dirs, ADR Accepted) but was still shown unchecked.

