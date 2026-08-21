---
cwd: /home/bukzor/claude/homedir-archeology
session:
  uuid:
    - 1b4592f6-145b-429b-ad4b-1b9f9e55772d
  started: null
  ended: null
---
# Editable llm-kb/llm-claims-kb Deps — Follow-Ups

Swept every path-based `uv.sources` dependency on llm-kb/llm-claims-kb
homedir-wide (15 entries across 15 repos) and added `editable = true` to
each, synced, committed, and pushed all 15 of them (2 of the 15 have no
configured git remote — local-only repos, committed but unpushed by
design). Also updated `llm-kb`/`llm-claims-kb` `SKILL.md` `setup:` docs to
prescribe `uv add --editable ../path/...` for external
(non-workspace-member) consumers, which was previously undocumented.

`bukzor/template.python-project`'s `prettier` pre-commit hook
(`entry: pnpm-run prettier --write --ignore-unknown`) initially failed with
`Executable 'pnpm-run' not found` — `pnpm-run` is a repo-local script
(`bin/pnpm-run`) only resolvable once the repo's `.envrc` is activated
(`cd <repo> && eval "$(direnv export bash)"`), which a bare non-interactive
shell doesn't do automatically. Activated it and committed `1486fb3`,
pushed. Not a hook bug — just needed direnv active.

One loose end remains:

- [ ] `md-frontmatter`/`md-frontmatter-set` (via `yq -f extract`) mis-parses
  any `CLAUDE.md` whose frontmatter opens with the `--- # workaround:
  anthropics/claude-code#13003` comment-fence pattern **and** has 2+
  top-level keys: emits `@value` containing only the first key (others
  silently dropped) and then errors `did not find expected <document
  start>`. Reproduced on `bukzor-tools/packages/git-localhost-store/CLAUDE.md`
  (pre-existing, untouched) and on freshly-edited
  `template.python-project`/`ideation.epistemics`/`bukzor.samsung-debloat`
  CLAUDE.md files. Files with a bare `---` opener (no comment) parse
  fine regardless of key count — isolates the trigger to the comment
  fence specifically. Python's `yaml.safe_load` parses the same content
  correctly, so this is a `yq` front-matter-extract quirk, not invalid
  YAML. Affects every CLAUDE.md using that workaround with >1 frontmatter
  key — likely more than the 4 found here; worth a homedir-wide
  `bukzor-homedir-archeology claudefiles` sweep once someone picks this
  up.
