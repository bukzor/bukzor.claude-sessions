---
cwd: /home/bukzor/claude/microwave-repair
session:
  uuid:
    - d53e2166-7488-4e16-b5e5-b88f927711a3
  started: 2026-11-27T14:59:27+00:00
  ended: 2026-11-27T17:21:42+00:00
---
# Session log of the microwave-kb session, for a colleague's review

The owner asked for a log of session `bfd5042f` (the microwave-repair kb
build, still running at the time) to send to a colleague, so the colleague
can evaluate the owner's LLM methods.

- Log: `/home/bukzor/claude/microwave-repair/trash/session-log/bfd5042f.session-log.md`
  (gitignored, deliberately not committed). It covers 14:49:46–14:54:49:
  setup, acceptance criteria, five survey briefs, launch, and a mid-flight
  amendment reaching every sub-agent. Owner-config files are linked to
  pinned commits on public GitHub (dotfiles `99a8bf8ba2c8`,
  bukzor-agent-skills `b59513ec7eaa`); kb files are inlined as of
  `b945b63`. It ends with the annotator's notes for the reviewer.
- To extend it to a later stopping point:
  `python3 -I trash/session-log/extract.py TRANSCRIPT.jsonl` linearizes the
  live branch of any transcript (sub-agent ones too).

Side quest: `open` on WSL. Dotfiles `9becce9` (pushed) adds
`~/bin/wsl-only/open` and puts `~/bin/wsl-only/` on PATH only under WSL,
via `~/.config/sh/env.d/wsl.sh` (renamed from `wsl-browser.sh`). macOS keeps
`/usr/bin/open`. The owner also installed GNU `parallel` (brew).

## Awaiting the owner's ruling

- [ ] Is the log fit to send: is the stopping point right, and do the
      "Notes for the reviewer" belong in it?
- [ ] `open` sends URLs to `wslbrowse`, not `wslview` as asked, because
      wslview mishandles URLs here and sends a HEAD request to each one first.
- [ ] Pushed by cherry-picking onto `origin/main` in a temporary worktree
      (see below), not by merging in `~`.

## Follow-ups

- [ ] Bring `~` up to date with dotfiles `origin/main`: local `main` is
      1 ahead (`0df8b25`, the same patch as the pushed `9becce9`) and 28
      behind. Merging in `~` is blocked by uncommitted edits, not from this
      session, to `.claude/todo.md`,
      `.config/claude-mitmproxy/tool-description.d/SendMessage/description.md`,
      and `.vim/lazy-lock.json`, all of which upstream also changed.
- [ ] `shellcheck` is not installed, though
      `must-read.kb/before/writing-bash-scripts.md` says to run it. It was run
      here via `uvx --from shellcheck-py shellcheck`.
- [ ] `~/bin/alternatives/` (per-host command overrides: npm, vim, gzip)
      is not on PATH, and nothing under `~/.config/sh` references it.
      Either wire it in or retire it. Not fully checked: a recursive grep
      of `~/.config` hung.
