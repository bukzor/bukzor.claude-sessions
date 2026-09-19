# 2026-09-18: from ctrl-g to a formal loader

One sitting, six escalations, two retractions. Each step was a user
question that the previous answer's shape couldn't hold.

1. **ctrl-g** -- bash `bind -x` round-trip through `$EDITOR`
   (readline's `edit-and-execute-command` executes; claude-code's
   returns to the prompt). First landed in `bashrc.d/`; the user
   plans a zsh return, so it moved to `rc.d/` with an `if ZSH_VERSION`
   dispatch onto the `edit-command-line` widget. Portability fix:
   `mktemp --suffix` is GNU-only; `mktemp -d` + fixed name instead.
2. **`keybind.d/`?** -- user's bar: worthwhile at >=3 keybinds. First
   count answered a narrower question than asked ("cross-shell pairs
   needing custom code") and was called out as contradictory.
   Recount in the user's unit: 20 keybinds, 7 both-shell. Retraction
   one: the swapped unit.
3. **`inputrc.d`?** -- probed: readline `$include` is literal-path
   only. Proposed a generated index, then a startup `-nt` check
   instead of a daemon (no `redo --watch` exists). Then dropped the
   inputrc leg for keybinds entirely: bash `bind` accepts inputrc
   syntax, and the only clients that lose are gdb/psql on three
   bindings that don't matter.
4. **Intent-first for everything?** -- surveyed all of `.config/sh`,
   nvim, tmux, git. Rule offered: put the open, human-named set
   (intents) on the directory axis, the closed vocabulary (contexts)
   on filenames, because the loader enforces filenames and `ls`
   discovers directories. Evidence: the consumer-first tree had
   already drifted on the intent axis. Excluded `env.d`/`profile.d`
   as "an ordered pipeline" -- wrong, see 5.
5. **Ordering** -- user: if `intent.d` needs a dependency story
   anyway, `env.d`'s exclusion reason is gone. Correct. Full read of
   `env.d` showed three data deps, one merged resource, one
   bootstrap, not a pipeline. User then rejected "bootstrap" and
   "must-be-first" as ontology classes: they are prerequisites.
   Minimal ontology: intent, leg, prerequisite; leg names are the
   filter subclass.
6. **Nesting pocket-veto** -- I wrote "none yet share a prerequisite
   in bulk" right after naming `functions`, `HOME`, and the overlay
   as universal prerequisites. Retraction two. User's bid: alternating
   ordered/unordered directories. `/formalize` identified it as a
   series-parallel decomposition tree, nesting-by-prerequisite as its
   depth-2 case, and both as one loader rule (RANK). The true relation
   is a DAG with two N's, so the tree needs either false edges (free
   at runtime: sourcing is sequential) or a `require` residual -- and
   most edges are better removed than represented (COMMUTE).

Durable output: `~/docs/dev/sh-config-loading.claims.md`. Nothing
committed.

Pattern worth naming for next time: both retractions were the same
move -- answering a nearby, easier question and presenting it as the
asked one. The user caught each within one turn.
