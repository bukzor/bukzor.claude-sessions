---
cwd: /home/bukzor
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 10dfad2d-6c36-40c4-a012-222965022fcc
    - 17b60946-a452-4069-838b-2b35bf98cebb
  started: 2026-09-10T09:08:47-05:00
  ended: null
---
# tmux Window Naming and Alert Identity

Windows are named by a precedence ladder rather than by what runs in
them: a name I assigned, else the title the program declares (OSC 2),
else tmux's inference from the running command. The shell declares its
cwd so an idle pane names itself; `alert` reads the resolved
`#{window_name}` back out of tmux so a notification says which window
wants attention, and logs every alert to
`~/.local/state/alert.jsonl`. Shipped and live -- commits `87cb6b3`,
`f2b773d`, `a90da60` on `svelte-crostini`.

Reasoning, rejected alternatives, and the conventions this session
established are in
`docs/dev/devlog/2026-09-10-001-tmux-window-naming--a-precedence-ladder--not-a-program-list.md`.

## Read into a claim ledger, 2026-09-17

A later session (unrelated line of work: cron-alerting, see
`pnpm-11-tooling-and-cron-health.md`) read `bin/alert`, its commits, and
this devlog while extending `docs/dev/user-attention.claims.md`
(`Skill(llm-claims-kb)`, pushed `80149a4`). `alert` is now formalized there
as a **push channel** -- fires when the caller calls out rather than being
polled or triggered by session lifecycle, so its coverage is exactly its
call sites (`ALERT_PUSH`, `PUSH_BOUNDED_BY_CALLSITES`,
`PUSH_ATTEMPTS_LOGGED` in `docs/dev/user-attention.claims.kb/`). The
`log_alert`-under-`set -e` follow-up below is now also tracked as an open
claim there (`ALERT_LOG_DESYNC`) -- same open question, now checkable
alongside the ledger's others rather than only living in this file's prose.
Nothing here was built or fixed; this is a cross-reference, not a
resolution.

## Open follow-ups

- [ ] The claude mark (U+EC82) sits at the head of the name while names
      truncate from the tail, so any title over 24 columns loses it.
      Fix is a three-branch `automatic-rename-format` that pins the
      glyph and truncates only the body. Offered to the user; no ruling
      yet, so it stays unbuilt.
- [ ] `~/.local/state/alert.jsonl` grows without bound -- no rotation,
      no pruning. Small today (3 entries); decide a policy before it
      matters.
- [ ] `log_alert` runs after the notification is already out, under
      `set -e`. A logging failure exits non-zero on an alert that did
      reach the user, which misreports success. Log failures should
      probably warn, not fail.
- [ ] The 24-column truncation budget was picked against this
      terminal's width and never tested narrow.

## Notes for whoever picks this up

`automatic-rename-format` is the single point of policy -- `alert`,
the status bar, and the window list all consume what it resolves.
Change it there, not in the consumers.

Expect long-lived windows to read `bash` for a while, and don't "fix"
it. No live shell has sourced `pane-title.sh` yet: every shell running
when this shipped was started between Aug 24 and Sep 4, and the hook
landed 2026-09-10T10:34:48. Those shells never will -- the rc runs at
startup -- so their panes stay undeclared and the ladder correctly
falls through to `pane_current_command`. The cwd rung is proven on an
isolated tmux server, not yet by any live pane; it takes effect as
shells are replaced.

tmux re-derives an automatic name only on **pane activity**: after
`source-file`, idle windows keep stale names and look like they opted
out. Distinguish real opt-outs (`automatic-rename off`, meaning a human
named the window) from stale inheritance before touching live state.
