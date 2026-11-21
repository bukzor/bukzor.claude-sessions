# WSL toast transport, 2026-11-18 (buck-win10)

Under tmux+WSL no transport reached the user: `notify-send` absent (WSLg
has no notification daemon), and `notify_hterm` "succeeded" into
Windows Terminal, shadowing the bell. Added `bin/alert-wsl` (Windows
toast via `powershell.exe`) as the second transport, and prefixed tmux
origins with `tmux ` (`tmux 0:10 alert`). User confirmed toasts arrive.
`main` `86c7bda`+`a8dd56f`, cherry-picked to `svelte-crostini`
`4f7b4db`+`02e6114`; claims ledger `ALERT_PUSH` updated to match.
