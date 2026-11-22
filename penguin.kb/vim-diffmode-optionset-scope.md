---
cwd: /home/bukzor/.vim
session:
  uuid: []
  started: null
  ended: null
---
# Vim Diffmode OptionSet Scope

Fix `~/.vim/pack/invented-here/start/diffmode/plugin/diffmode.vim`:
`au VimEnter,OptionSet * call DiffEvent()` fires on *every* option change,
so outside diff mode `DiffModeExit` buffer-locally maps `m`/`M` to
`:cn`/`:cN` in whatever buffer is current. Result: `m` differs per buffer
(observed 2026-11-22 in a live nvim: buffers 1-4 had `m`=`:cn`, 5/6/11 had
stock marks).

## Settled

- Filter by the autocmd pattern, not a wrapper: split into
  `au VimEnter * call DiffEvent()` and `au OptionSet diff call DiffEvent()`.
  A `MaybeDiffEvent` wrapper was considered and rejected -- the
  `OptionSet` pattern already matches on option name, and a wrapper would
  have to special-case `VimEnter` (where `<amatch>` is a filename).
- The E31 "No such mapping" flood seen while testing is not a bug: the
  `silent!` works; `execute()` (used via `nvim --remote-expr`) captures
  suppressed errors anyway.

## Open

- [ ] User ruling: outside diff mode, should `m`/`M` be (a) global
  `:cn`/`:cN`, with diff mode overriding buffer-locally and
  `DiffModeExit` only unmapping, or (b) stock `m` (marks), no
  remapping? Agent recommends (a): the mapping is evidently intended and
  already effective in most buffers.
- [ ] Implement, test in vim and nvim (enter/leave diff via
  `<Leader>df`; check `maparg('m','n',0,1)` per buffer), commit in
  `~/repo/github.com/bukzor/dotfiles--main` per `~/CLAUDE.md`.
