---
cwd: /home/bukzor/claude/homedir-archeology
session:
  uuid:
    - 84b029a6-74c9-4155-92f8-2c7381d4746f
  started: 2026-07-08T21:01:41-05:00
  ended: 2026-07-08T22:11:13-05:00
---
# Loose Ends from the .d→.kb Rename Sweep

The main sweep (`~/.claude/todo.kb/2026-05-15-000-rename-outmoded-d-dirs-to-kb-case-by-case-eval.md`)
is done and committed/pushed. Three small items surfaced during it that
are out of scope for that taskfile (different repos, unrelated bugs)
and were never resolved:

- [ ] `~/claude/research.llm-filesystem-collab/docs/procedures/dot-d--*.md`
      — three filenames still reference the old "dot-d" pattern name
      generically (they're meta-procedure docs about the itemized-directory
      pattern, not project-specific). Internal path references were
      already fixed; only the filenames themselves are stale. Decide
      whether to rename them too.
- [ ] `~/claude/github-manager/CLAUDE.md` — root frontmatter has a stale
      `depends: - skills/llm.d` entry, predating the original
      `llm.d`→`llm.kb` rename entirely. Unrelated pre-existing bug,
      noticed but not fixed (out of scope for the sweep that found it).
- [ ] Confirm whether these four repos should get a git remote (they
      have local commits from the sweep but no remote configured at
      all, so nothing was pushed): `~/claude/research.llm-filesystem-collab`,
      `~/claude/ai-coding-tools-facts.d`, `~/claude/fixing-claude-introspection`,
      `~/repo/claude-code-reverse-ng`. Asked the user once, unanswered.
