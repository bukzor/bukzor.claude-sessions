Part of `../reunify-dotfiles-lineages.md`.

# 2026-07-13: for user review — task 004 in progress, 7/10 themes done

Task 004 (hand-merge true divergences) is well underway: `.vim/init.lua`,
gh/gcloud/ssh config, the `bin/` trio, `.tmux.conf`, and the whole
git-config family are done and pushed on both branches. Remaining:
vim lua files (`lsp.lua`/`plugins.lua`/`tree-sitter.lua`/`which-key.lua`/
`lazy-lock.json`/`diffmode.vim`), `kitty.conf`+`.gitmodules` (2251 lines
on main), and claude config (`.claude/CLAUDE.md`/`settings.json`/
`commands/curl.md`/`.gitignore` — note `.claude/CLAUDE.md` is the live
operating-instructions file, handle with extra care). User chose to
pause here rather than continue into those three (asked directly,
given their size/sensitivity).

Also closed a stale bookkeeping gap on the way in: todo 000's checklist
said its one deferred item ("delete superseded `.sh_env`/etc.") was
still blocked on 005 — but 005 (done 2026-07-12, prior session) had
already done exactly that. Verified against the main-reunify clone
(all four legacy files confirmed gone, `.sh_lib` deliberately still
present) and marked 000 fully done.

**The git-config theme grew into resolving the long-deferred
ignore-scheme question** (flagged since 2026-07-09's CI-foundations
session as "still a separate, later effort"): main's deny-by-default
(`*`/`**/*` + narrow `!` opt-ins) vs. svelte's allow-by-default (track
everything, deny known junk). Asked directly rather than picking a
side myself. **User's resolution: keep svelte's allow-first** —
key reasoning, once untangled: under allow-first, anything unexpected
landing in `~` shows up as *untracked* in `git status`, which is the
signal that prompts cleanup; deny-first would silently swallow the
same file with no signal at all. (I initially got the causality
backwards mid-discussion and thought the user's own stated "~
shouldn't have stuff plopped into it, I use ~/tmp for that" principle
contradicted their answer — it didn't; a second round-trip cleared
it up.) Dropped main's whole deny-first apparatus as now-unnecessary,
including the narrow `!`-opt-ins that CI-foundations and this session
itself had been adding to route around it.

Other real judgment calls made while merging git config (all
documented per-file in `../../todo.kb/2026-07-08-000-Reunify-dotfiles.kb/
2026-07-06-004-Hand-merge-true-divergences.md`, not duplicated here):
kept svelte's `.gitconfig` `l`/`xl` aliases over main's same-named
but semantically different ones (this whole reunify project's own git
conventions already depend on svelte's `git l -n5 .`); dropped main's
`feature` alias because it was silently shadowing a more capable
same-named `bin/git-feature` script; retired main's `.gitignore_global`
+ the `.config/git/ignore` → `.hgignore_global` symlink (both dead
once `core.excludesfile` was dropped in favor of svelte's XDG-default
setup); kept svelte's `.gitconfig.d/vimdiff.conf` over main's inline
difftool block (fixes two real bugs: bad `$MERGED` path on renames,
`GIT_EXTERNAL_DIFF` not unset). Also found and fixed a real bug in
main's `bin/osc52` while merging the `bin/` trio: base64's default
76-column line wrap embeds newlines mid-escape-sequence for any
clipboard payload longer than a couple dozen bytes, silently breaking
OSC-52 for realistic use — main's version lacked svelte's `tr -d '\n'`
fix; combined bug-fix + main's strict-mode conventions, smoke-tested
with a 200-char payload.

**Two mistakes caught and corrected mid-session, both self-caught this
time (no user prompting needed):** (1) A commit message with markdown-
style backtick-quoted terms (`` `feature` ``, `` `![!.]*` ``) inside a
double-quoted bash `-m "..."` heredoc triggered command substitution —
bash tried to *run* `feature`/`![!.]*`/`!mine/` as commands, silently
stripping them from the resulting message (visible only as
"command not found" stderr noise plus a mangled commit body). Fixed by
re-committing with backtick-free prose. (2) Fixing that then compounded
into the *exact* recurring mistake flagged in this same session file's
2026-07-11 entry: used a bare `git commit --amend -m ...` (no pathspec)
to fix the message, which swept in an unrelated pre-existing staged
file (`bin/prettier-markdown`, part of the known D6 held-review
backlog) that had nothing to do with this commit. Caught it myself via
`git show --stat HEAD` before moving on, fixed with the same recovery
recipe as last time (`reset --soft HEAD^` + re-stage + `commit-staged`
scoped to the intended paths) — `bin/prettier-markdown` ended up back
in its original staged-not-committed state, untouched. Third time this
exact trap has bitten (07-11 entry documents the first, and its
"lesson reinforced" note evidently didn't stick against a bare
`--amend`) — worth internalizing that `commit-staged`/`commit-files`
need to be used for *every* commit-shaped operation in this repo,
amends included, not just the initial commit.

Commits this session: svelte-crostini `85619df`..`fdf769a` (bookkeeping,
init.lua, gh/gcloud/ssh, bin trio, tmux.conf, git-config family, task-file
updates); main `8efa600`..`59082f3` (counterparts). Both pushed.

Next: same three remaining 004 themes (vim lua files, kitty+gitmodules,
claude config), then 006 (final merge + switchover) strictly last.
