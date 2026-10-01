---
captured: "2026-09-23"
method: ./2026-09-23-005-tmux-process-age-and-journalctl-user-around-the-oom-kill-window-redo-of-failed-002.sh
---

# tmux process age and journalctl --user around the OOM kill window (redo of failed 002)

```sh
'/home/bukzor/claude/mitmproxy/trash/tmux_journal_check.sh'
```

```
--- tmux process ages now ---
 2593   269 Wed Sep 23 10:47:48 2026       25:16 tmux new -s claude
 8797  7043 Wed Sep 23 11:01:26 2026       11:37 tmux new -s holistics
--- journalctl --user 10:35-10:50 local ---
Sep 23 10:44:43 penguin garcon[634]: [634]: Received request to launch vshd in container
Sep 23 10:46:38 penguin sudo[1659]:   bukzor : TTY=pts/3 ; PWD=/home/bukzor ; USER=root ; COMMAND=/usr/bin/renice -n -20 689 687
Sep 23 10:46:38 penguin sudo[1659]: pam_unix(sudo:session): session opened for user root(uid=0) by bukzor(uid=1000)
Sep 23 10:46:38 penguin sudo[1659]: pam_unix(sudo:session): session closed for user root
--- journalctl -k (kernel) same window, if forwarded ---
-- No entries --
--- last log entries mentioning renice ---
Sep 23 10:46:38 penguin sudo[1659]:   bukzor : TTY=pts/3 ; PWD=/home/bukzor ; USER=root ; COMMAND=/usr/bin/renice -n -20 689 687
```
