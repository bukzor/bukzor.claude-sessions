Part of `../reunify-dotfiles-lineages.md`.

# 2026-07-11: task 002 done, stale-seed adjudication

Task 002 (stale-seed adjudication) is done: 2/9 files were genuine
stale-seed (`.config/gh/.gitignore`, `.config/pnpm/rc` — took main's
side), the other 7 turned out **not** to be stale-seed at all on
closer read. The task file's date-based classifier ("main's
2025-08-20 pass is presumptively ahead") missed: content that moved
rather than went stale (`.vimrc`'s logic lives in `.vimrc.d/*.vim`
now, edited as recently as 2026-05-12), a file where svelte is
already strictly ahead (`.vim/init.lua`'s target, rewritten
2026-05-05 for nvim 0.11 vs. main's 2023 copy), and several
genuinely-mixed configs where a blind take-main would have silently
deleted live svelte content: `.gitmodules` (would drop the
sessions.kb submodule this very session runs on), `.config/gh/config.yml`
(would drop the `markdown-preview` alias backing the untracked
`.grip/` dir sitting in the tree), `.config/gcloud/.gitignore` (would
drop 5 gcloud-transient ignore patterns main lacks), `.ssh/.gitignore`
(main's `!*.pub.*` pattern is narrower than svelte's `!*.pub` and
wouldn't track svelte's actual key-naming convention),
`.config/kitty/kitty.conf` (svelte's 3-line file has a
crostini-specific `linux_display_server x11` main's 2251-line default
dump lacks, and main's file depends on a main-only theme submodule).
All 7 escalated to 004 with per-item findings recorded so it can
author the merges without re-deriving any of this. Also checked
content of every main-only `.ssh/` file this touches (7 pubkeys +
authorized_keys + client config) for secrets — none found, all public
material, though main's `.ssh/config` hardcodes macOS paths that will
need an OSTYPE guard when 004 gets there. Commits:
`a8793c4`/`a2b7ff2` (svelte, pushed); nothing needed on main for this
task. Full harness green.

Next: 003 (main-only path triage) is still fully open, not started
this session.
