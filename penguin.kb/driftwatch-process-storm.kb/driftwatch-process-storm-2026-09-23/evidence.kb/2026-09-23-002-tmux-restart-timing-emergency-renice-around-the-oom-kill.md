---
captured: "2026-09-23"
method: ./2026-09-23-002-tmux-restart-timing-emergency-renice-around-the-oom-kill.sh
---

# tmux restart timing + emergency renice around the OOM kill

```sh
'bash' '-c' $'\n    echo "--- tmux process ages now ---"\n    ps -o pid,ppid,lstart,etime,cmd -p 2593,8797\n    echo "--- journalctl --user 10:35-10:50 ---"\n    journalctl --user --since "2026-09-23 10:35:00" --until "2026-09-23 10:50:00"\n  '
```

Exited 127.

```
bash: line 1: $n: command not found
```
