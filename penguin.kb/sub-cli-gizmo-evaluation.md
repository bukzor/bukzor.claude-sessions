---
cwd: /home/bukzor/claude/empty
session:
  uuid:
    - ec3d396a-a5da-40f4-8f4e-71a0c4406841
  started: 2026-07-26T15:00:00-05:00
  ended: null
---
# Sub-CLI Gizmo -- Evaluate juanibiapina/sub as Dispatcher

Surveyed prior art for a "generalizing sub-cli gizmo" (kebab scripts ->
polished nested CLI); [juanibiapina/sub](https://github.com/juanibiapina/sub)
is a near-exact fit, verified by dogfooding a chatfs-shaped libexec tree.
Fixed the broken install (upstream tap ships mac-only binaries) with a
cargo-built formula in `~/repo/github.com/bukzor/tap` (pushed); cloned
upstream to `~/repo/github.com/juanibiapina/sub`.

Open work (details live in the pointed-to files):

- [ ] `~/.claude/todo.kb/2026-07-26-000-Evaluate-sub--patch-upstream--hard-fork--or-write-my-own.md`
      -- the patch/fork/successor decision, driven by a dogfood patch queue
- [ ] chatfs adoption:
      `~/repo/github.com/bukzor/prototype.chatfs/.claude/ideas.kb/2026-07-26-000-sub-as-chatfs-CLI-dispatcher.md`
      (probe tree in its `.d/` sibling); includes the stale
      `cli-command-shape.md` naming-section rewrite, which awaits the
      adoption decision
