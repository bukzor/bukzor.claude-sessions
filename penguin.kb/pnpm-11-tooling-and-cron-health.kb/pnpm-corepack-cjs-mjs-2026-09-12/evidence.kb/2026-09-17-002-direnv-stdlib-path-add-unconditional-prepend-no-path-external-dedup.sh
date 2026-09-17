#!/bin/sh
# Method for 2026-09-17-002-direnv-stdlib-path-add-unconditional-prepend-no-path-external-dedup.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'bash' '-c' 'grep -n '\''path_add'\'' -A 20 /home/bukzor/repo/github.com/bukzor/dotfiles--main-reunify/.config/direnv/stdlib.sh | sed -n '\''1,25p'\'''
