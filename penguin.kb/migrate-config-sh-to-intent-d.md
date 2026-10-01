---
cwd: /home/bukzor
session:
  uuid: [] # chronological; append your uuid when picking this entry up
  started: null
  ended: null
parent: shell-config-intent-first-loader.md
focus:
  - docs/dev/design.kb/intent-d.md
  - .claude/todo.kb/2026-09-22-000-migrate-config-sh-to-intent-d.md
cost-benefit-sweh:
  timebox:
    "@value": 6
    rationale: five milestones; keybind split dominates
  benefit-2w:
    "@value": 1
    rationale: pays at the zsh return, not before
---
# Migrate ~/.config/sh to intent.d

Planned. Build what `~/docs/dev/design.kb/intent-d.md` commits to:
replace `env.d`/`bashrc.d`/`zshrc.d`/`rc.d` with `intent.d/` (one
directory per behavior, one leg per shell context, ordered by
prerequisite via the RANK loader). Design content is in that ledger
and its basis `~/docs/dev/sh-config-loading.claims.md`; the work is
`~/.claude/todo.kb/2026-09-22-000-migrate-config-sh-to-intent-d.md`
(five milestones M1-M5). Nothing here restates either.

## Gate

Three `standing: open` claims want a ruling before M3/M4:
`PATH_OWNER`, `BREW_READ`, `TREE_NAME` --
`grep -rlE '^standing: open' ~/docs/dev/design.kb/`. M1 (loader +
first intent) does not depend on them and can start cold.

## Start here

1. `focus:` files above, then `llm-claims-kb-flatten ~/docs/dev/design.kb`.
2. `git -C ~ status -s .config/sh/` -- the tree is dirty on
   `svelte-crostini` with unrelated work; commit around it by path.
3. Every milestone ends with `bash -ic true; zsh -ic true` clean and a
   commit.

## Open work

- [ ] M1 loader + `edit-line-in-editor/` as first intent
- [ ] M2 rc layer
- [ ] M3 env layer (after PATH_OWNER)
- [ ] M4 keybinds + `.inputrc` shrink
- [ ] M5 close: remove old `*.d`, drop `todo: true` in the design ledger
