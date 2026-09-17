#!/bin/sh
# Method for 2026-09-17-001-pure-anacron-simulated-path-sh-no-bashrc-no-direnv-has-pnpm-bin-once-after-bin.md -- re-runnable, and fair game to improve in place
# (unlike the capture, which is append-only).
'bash' '-c' '/bin/sh -c ". /home/bukzor/.profile; echo \$PATH" | tr : "\n" | nl'
