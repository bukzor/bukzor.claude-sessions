---
cwd: /home/bukzor
session:
  uuid: # chronological; append your uuid when picking this entry up
    - df89c432-f858-45e6-bdd7-4334f033ff17
  started: 2026-09-18T11:05:19-05:00
  ended: null
focus:
  - docs/dev/sh-config-loading.claims.md
  - .config/sh/rc.d/edit-line-in-editor.sh
---
# Shell config: intent-first loader (`intent.d/`)

Started as "ctrl-g edits the command line in $EDITOR, like claude-code"
and escalated, one question at a time, into a redesign of how
`~/.config/sh/*.d` is organized: from consumer-first (`env.d`,
`bashrc.d`, `zshrc.d`, `rc.d`) to intent-first (one directory per
behavior, one leg-file per invocation context), with a formal basis for
the load-order problem. Formal account:
`~/docs/dev/sh-config-loading.claims.md` (`[!DRAFT]`, agent-signed `+`
claims await veto). Trajectory and reversals: `## Addenda`.

Nothing is committed yet: the ctrl-g file and the ledger are both
untracked in the dotfiles working tree (branch `svelte-crostini`).

## Delivered

- `~/.config/sh/rc.d/edit-line-in-editor.sh` -- ctrl-g in bash (bind -x
  round-trip through `$EDITOR`, returns to prompt, does not execute)
  and zsh (`edit-command-line` widget, viins + vicmd). Guarded
  `BASH_VERSINFO>=4` so macOS `/bin/bash` 3.2 skips it; homebrew bash
  gets it automatically. OS-independent (`mktemp -d`, no `--suffix`).
  Verified under a pty with a sed "editor"; `bind -X` / `bindkey` show
  the binding in both shells.
- `~/docs/dev/sh-config-loading.claims.md` -- the /formalize ledger.

## Key findings

- Keybind census: 20 distinct (key → intent) bindings across `.inputrc`
  and `zshrc.d/040-keybindings.sh`; 7 already implemented in both
  shells, with the bash half in `.inputrc`. Eight `.inputrc` lines
  restate readline defaults (delete candidates).
- readline `$include` takes one literal path: no glob, no env var,
  only `~` expands (tested). No `redo --watch` exists (apenwarr 0.42d).
  Neither matters: `.inputrc` is read at shell start, so any rebuild
  is a `-nt` check at startup -- and the chosen design needs none.
- nvim filetype: `inputrc`, `bashrc`, `zshrc`, `*.sh` detect; bare
  `bash`, `shrc`, and `*.inputrc` don't. Leg names chosen accordingly.
- The macOS "readline thingy" is libedit (`~/.editrc`); nothing in the
  dotfiles references it, and it has no edit-in-editor command.
- The consumer-first tree has already drifted on the intent axis
  (`history.sh` vs `020-history.sh`, `completion.sh` vs
  `050-completion.sh`): evidence for putting the open set (intents) on
  the directory axis and the closed set (contexts) on filenames.
- `env.d`'s numbering encodes ~13 true edges over ~30 units; the true
  relation is a DAG, not a tree and not series-parallel (two N's: one
  through `060-basics`, one through `300-homebrew`). A grab-bag unit
  serving two unrelated readers is what generates an N.
- `profile.d/00-basics.sh` is a duplicate of `.profile`'s inline
  HOME/USER bootstrap plus a PATH default that belongs to `path`.

## Conclusions (recommendations, pending ruling)

- Ontology: **intent** (dir), **leg** (file; name = invocation
  context: `env.sh profile rc.sh bashrc zshrc inputrc tmux.conf
  init.lua`), **prerequisite** (`Y requires X`). Leg names are the
  filter subclass of prerequisite (must be decided before parsing).
  "Bootstrap", "must-be-first", "last-wins merge" are not classes.
- Load order: sourcing is sequential, so any superset of the true
  relation is correct; representation cost is false edges only.
- One loader rule (RANK): legs before subdirs; rank = numeric prefix,
  ∞ if none; equal rank = unordered; ranks ascend. Covers today's
  numbering, nesting-by-prerequisite, and the alternating
  ordered/unordered layers (= series-parallel decomposition). Residual
  DAG edges: `require X` in the leg, sourced once on demand.
- Prefer removing edges to representing them (COMMUTE): lazy reads,
  defaulted reads, commutative writes. Survivors: `keybinds ← zkbd`
  (bulk; the one honest nesting instance, `terminal-keys/`),
  `zkbd ← TERM`, `completion ← homebrew`.
- `intent.d/` replaces `rc.d`, `bashrc.d`, `zshrc.d`, `env.d`;
  `profile.d` is deleted (PATH default → `path/env.sh`);
  `functions.d` stays -- it is the root intent, hand-sourced because
  the loader lives in it. `060-basics.sh` dissolves into editor /
  colors / make / claude / volta / python.
- `private-dotfiles` overlay demoted to a normal intent with named
  outputs; an "override anything" unit can't be depended on specifically.

## Relation to sibling sessions (reviewed 2026-09-19)

Three same-week sessions on `must-read.kb` were checked for overlap;
findings and patches in `.kb/2026-09-19-001-sibling-review.md`.

- `must-read-sharding` (`ba648ef5`): same shape of problem -- a tree
  whose nesting means "child implies parent" (occasion entailment
  there, prerequisite here), one command listing any subtree, root
  installed by the host because the loader lives in it. Imported: its
  path-decidability requirement (→ DIR_IS_INTENT: every dir is an
  intent, legless = pure node) and a corrected axis rule (AXIS). Its
  NAMESPACE! ruling is scoped to llm-kb (ruled 2026-09-19); `intent.d`
  is outside it -- no contradiction. Offered back: REENTRY as the shell analogue of its open
  COMPACTION?; MECH_PULL as a worked example of its GRADIENT's endpoint.
- `trigger-installation` (`a9fd5254`): its ruling that static triggers
  belong in CLAUDE.md frontmatter is the same ROOT theorem. No patch.
- `judgment-protocol-redesign` (`93639e4d`): about agent behavior, not
  loaders. Two data points for its audit: this session had 2 folds
  under pushback, both with the disconfirmer named in the turn
  (contradictory count; pocket-vetoed nesting) -- the healthy path its
  pre-commit proposal wants. The 2026-08-29 ruling
  ("a mode of thinking, clear success criteria and a directory of
  tools", devlog `2026-08-29-000`) should shape the eventual
  `intent.d/CLAUDE.md` -- my `+`, not theirs; whether it governs *their*
  entry is their `.kb/03`, still `?` (peer message 14:33, verified:
  "Posed 2026-09-19, unruled"). Not a dependency on that answer.

## Open questions

- OWN_PATH? -- PATH as single-owner list (recommended; it's what
  `900-path` is) vs priority-as-data in each tool intent.
- LAZY_BREW? -- lazy `HOMEBREW_PREFIX` vs one `require homebrew`.
- Name: `intent.d` vs `behavior.d`.
- Commit ctrl-g now as a standalone `rc.d` file, or land it as the
  first `intent.d/` entry?
- `.inputrc` 8-bit `set` lines likely obsolete under UTF-8 readline;
  and `~/.inputrc.swp` exists -- an editor may have it open.

## Open work

- [ ] user: veto pass over `+` claims in `sh-config-loading.claims.md`
- [ ] rule OWN_PATH?, LAZY_BREW?, dir name
- [ ] write the RANK loader (~15 lines in `functions.d/`) + `require`
- [ ] migrate `rc.d`/`bashrc.d`/`zshrc.d`/`env.d` into `intent.d/`;
      delete `profile.d`; dissolve `060-basics.sh`; split
      `040-keybindings.sh` into intents under `terminal-keys/`
- [ ] shrink `.inputrc` to settings + sequence normalization
- [ ] commit (`Skill(commit)`): ctrl-g file, ledger, this entry

## Addenda

`shell-config-intent-first-loader.kb/` -- dated pickup write-ups.
