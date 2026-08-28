---
cwd: /home/bukzor/claude/meta-reasoning
session:
  uuid:
    - 6c04b3e5-d49c-46e0-a5cb-d8547a4ff47d
  started: 2026-08-28T13:50:00-05:00
  ended: null
---
# Re-Validate Every kb's Links After the Whitelist Fix

`llm.kb-validate-links` was blind in two ways until
`bukzor-agent-skills` `bbcde52` (2026-08-28, pushed). Every `.kb/` on
this host was last checked by the blind version, so every one of them
may hold broken cross-references that reported green. Only
`~/claude/meta-reasoning` has been swept since; it is clean.

## What was blind, and what it means for a re-run

- **Frontmatter field whitelist.** It matched eight field names
  (`why:`, `depends:`, and friends). Any kb that invented a field name
  went unchecked: meta-reasoning alone had `suggested-reading:`,
  `also-touches:`, `lands-in:`, `requires:`. Expect the biggest yield
  wherever a kb has its own vocabulary.
- **The `---\n` opener requirement.** A file opening `--- # workaround:
  anthropics/claude-code#13003` was read as having *no frontmatter at
  all*. That is most `CLAUDE.md` files on this host — which is exactly
  where `requires:`/`depends:` edges live. Expect skill and project
  wiring edges to be the second yield.

Both failed silently: the tool printed `✅ N files, 0 with broken
links` while checking a fraction of what it named.

## Open work

- [ ] Enumerate the repos with `.kb/` content — at least
      `bukzor-agent-skills`, `dotfiles`, `~/.claude` (`must-read.kb`,
      `sessions.kb`, `skills/*/`), `private.bukzor-llc`,
      `prototype.chatfs`, `abbys-craft`.
- [ ] Run `~/.claude/skills/llm-kb/bin/llm.kb-validate-links` over each
      (it is **not** on `$PATH`). Prefer feeding it `git ls-files -z
      '*.md' | xargs -0`, per `meta-reasoning/repo-health.sh` — a bare
      directory walk descends into `trash/` and `node_modules/` and
      buries real findings.
- [ ] Triage per repo: a genuinely dangling path gets fixed; a path
      quoted *as prose* (a devlog naming the edge it repaired) gets
      de-literalized — drop the `./`/`../` prefix so it reads as a name.
      Do not exempt `devlog/`/`adr/` from the check; that trades one
      false positive for permanent blindness to real rot.
- [ ] Where a repo's checks are worth keeping runnable, copy
      `meta-reasoning/repo-health.sh`'s shape: one address, every check
      printing its count and not just its verdict.

## Why it is not just a rerun

The fix widened *what counts as a link*, so a repo that was green may
now be red without anything having changed in it. Findings are
pre-existing rot surfacing, not regressions — read them that way, and
do not go looking for the commit that "broke" them.

## Address

- `bukzor-agent-skills` `bbcde52` — the fix, with the reasoning in the
  `frontmatter_links` docstring
- `~/claude/meta-reasoning/docs/dev/devlog/2026-08-28-003-repo-health-becomes-computable--the-checker-was-passing-by-looking-away.md`
  — why a whitelist is a promise to stop checking, and the three-minute
  probe that convicted it
