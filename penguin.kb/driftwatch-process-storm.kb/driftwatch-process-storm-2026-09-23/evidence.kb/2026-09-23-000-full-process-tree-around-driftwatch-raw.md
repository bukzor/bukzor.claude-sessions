---
captured: "2026-09-23"
method: ./2026-09-23-000-full-process-tree-around-driftwatch-raw.sh
---

# Full process tree around driftwatch (raw)

```sh
'bash' '-c' 'ps -efly --forest | grep -C10 driftwatch'
```

```
S bukzor   11196   269  0  90  10  2492 12586359 x64_sy Sep04 ?     00:00:00  \_ /home/bukzor/.cache/ms-playwright/chromium-1217/chrome-linux64/chrome_crashpad_handler --monitor-self -
S bukzor   11198   269  0  90  10  1988 12584306 x64_sy Sep04 ?     00:00:00  \_ /home/bukzor/.cache/ms-playwright/chromium-1217/chrome-linux64/chrome_crashpad_handler --no-periodic-ta
S bukzor   23029   269  0  80   0 28604 263723 do_epo Sep04 ?       00:00:00  \_ prettierd
S bukzor   27043   269  0  80   0 29480 263723 do_epo Sep04 ?       00:00:00  \_ prettierd
S bukzor   24368   269  0  80   0 21668 262703 do_epo Sep04 ?       00:00:00  \_ prettierd
S bukzor   28044   269  0  80   0  1032  4702 x64_sy Sep10 ?        00:00:00  \_ /opt/google/cros-containers/bin/../lib/ld-linux-x86-64.so.2 --argv0 /opt/google/cros-containers/bin/not
S bukzor   10066   269  0  80   0 18248 262319 do_epo Sep10 ?       00:00:00  \_ prettierd
S bukzor    5121   269  0  80   0 17844 262319 do_epo Sep10 ?       00:00:00  \_ prettierd
S bukzor   25489   269  0  80   0 35168 265123 do_epo Sep10 ?       00:00:01  \_ prettierd
S bukzor   20368   269  0  80   0  2552  1839 do_wai Sep11 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789148730905-b6wm97.sh 2>/dev/n
S bukzor   20370 20368  0  80   0  3296  1804 do_wai Sep11 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2170 20370  0  80   0  1676   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor    2185   269  0  80   0 29676 263983 do_epo Sep11 ?       00:00:01  \_ prettierd
S bukzor   12681   269  0  80   0 20340 262607 do_epo Sep16 ?       00:00:00  \_ prettierd
S bukzor    9402   269  0  80   0 27848 263407 do_epo Sep18 ?       00:00:00  \_ prettierd
S bukzor   26627   269  0  80   0  2548  1839 do_wai 10:26 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   26629 26627  0  80   0  3292  1806 do_wai 10:26 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1904 26629  0  80   0  1776   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   28803   269  0  80   0  2552  1839 do_wai 10:30 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   28805 28803  0  80   0  3244  1806 do_wai 10:30 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2205 28805  0  80   0  1692   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   28848   269  0  80   0  2608  1839 do_wai 10:31 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   28850 28848  0  80   0  3188  1806 do_wai 10:31 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2199 28850  0  80   0  1704   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   28880   269  0  80   0  2648  1839 do_wai 10:31 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   28882 28880  0  80   0  3236  1806 do_wai 10:31 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1932 28882  0  80   0  1700   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   28917   269  0  80   0  2644  1839 do_wai 10:31 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   28919 28917  0  80   0  3360  1806 do_wai 10:31 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1857 28919  0  80   0  1716   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   28960   269  0  80   0  2596  1839 do_wai 10:31 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   28962 28960  0  80   0  3244  1806 do_wai 10:31 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1876 28962  0  80   0  1732   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29009   269  0  80   0  2644  1839 do_wai 10:31 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29011 29009  0  80   0  3128  1806 do_wai 10:31 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2207 29011  0  80   0  1696   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29057   269  0  80   0  2552  1839 do_wai 10:31 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29063 29057  0  80   0  3224  1806 do_wai 10:31 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1870 29063  0  80   0  1676   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29100   269  0  80   0  2644  1839 do_wai 10:31 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29102 29100  0  80   0  3212  1806 do_wai 10:31 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2237 29102  0  80   0  1700   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29136   269  0  80   0  2624  1839 do_wai 10:31 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29138 29136  0  80   0  3180  1806 do_wai 10:31 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1850 29138  0  80   0  1740   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29159   269  0  80   0  2612  1839 do_wai 10:31 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29161 29159  0  80   0  3188  1806 do_wai 10:31 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2208 29161  0  80   0  1704   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29191   269  0  80   0  2564  1839 do_wai 10:31 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29193 29191  0  80   0  3236  1806 do_wai 10:31 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1878 29193  0  80   0  1704   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29211   269  0  80   0  2548  1839 do_wai 10:31 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29213 29211  0  80   0  3200  1806 do_wai 10:31 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1955 29213  0  80   0  1704   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29246   269  0  80   0  2648  1839 do_wai 10:31 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29248 29246  0  80   0  3236  1806 do_wai 10:31 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2212 29248  0  80   0  1676   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29268   269  0  80   0  2668  1839 do_wai 10:31 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29270 29268  0  80   0  3256  1806 do_wai 10:31 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2160 29270  0  80   0  1676   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29309   269  0  80   0  2600  1839 do_wai 10:32 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29311 29309  0  80   0  3300  1806 do_wai 10:32 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1926 29311  0  80   0  1680   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29337   269  0  80   0  2648  1839 do_wai 10:32 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29340 29337  0  80   0  3152  1806 do_wai 10:32 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2143 29340  0  80   0  1684   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29363   269  0  80   0  2644  1839 do_wai 10:32 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29365 29363  0  80   0  3288  1806 do_wai 10:32 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1950 29365  0  80   0  1692   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29382   269  0  80   0  2644  1839 do_wai 10:32 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29384 29382  0  80   0  3324  1806 do_wai 10:32 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2198 29384  0  80   0  1708   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29401   269  0  80   0  2660  1839 do_wai 10:32 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29403 29401  0  80   0  3140  1806 do_wai 10:32 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2032 29403  0  80   0  1700   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29438   269  0  80   0  2568  1839 do_wai 10:32 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29440 29438  0  80   0  3308  1806 do_wai 10:32 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2238 29440  0  80   0  1700   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29460   269  0  80   0  2608  1839 do_wai 10:32 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29462 29460  0  80   0  3184  1806 do_wai 10:32 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2229 29462  0  80   0  1796   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29477   269  0  80   0  2636  1839 do_wai 10:32 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29479 29477  0  80   0  3168  1806 do_wai 10:32 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1877 29479  0  80   0  1716   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29500   269  0  80   0  2604  1839 do_wai 10:32 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29502 29500  0  80   0  3312  1806 do_wai 10:32 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2094 29502  0  80   0  1708   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29518   269  0  80   0  2564  1839 do_wai 10:32 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29520 29518  0  80   0  3256  1806 do_wai 10:32 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1873 29520  0  80   0  1692   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29534   269  0  80   0  2584  1839 do_wai 10:32 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29536 29534  0  80   0  3288  1806 do_wai 10:32 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2226 29536  0  80   0  1704   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29567   269  0  80   0  2584  1839 do_wai 10:32 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29569 29567  0  80   0  3252  1806 do_wai 10:32 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2163 29569  0  80   0  1676   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29586   269  0  80   0  2608  1839 do_wai 10:32 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29588 29586  0  80   0  3224  1806 do_wai 10:32 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1959 29588  0  80   0  1680   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29604   269  0  80   0  2636  1839 do_wai 10:33 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29606 29604  0  80   0  3244  1806 do_wai 10:33 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2174 29606  0  80   0  1676   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29621   269  0  80   0  2580  1839 do_wai 10:33 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29623 29621  0  80   0  3252  1806 do_wai 10:33 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2023 29623  0  80   0  1680   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29643   269  0  80   0  2568  1839 do_wai 10:33 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29645 29643  0  80   0  3216  1806 do_wai 10:33 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2178 29645  0  80   0  1680   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29659   269  0  80   0  2644  1839 do_wai 10:33 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29661 29659  0  80   0  3280  1806 do_wai 10:33 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2054 29661  0  80   0  1736   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29686   269  0  80   0  2580  1839 do_wai 10:33 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29688 29686  0  80   0  3248  1806 do_wai 10:33 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2089 29688  0  80   0  1800   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29718   269  0  80   0  2624  1839 do_wai 10:33 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29720 29718  0  80   0  3224  1806 do_wai 10:33 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2222 29720  0  80   0  1680   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29734   269  0  80   0  2600  1839 do_wai 10:33 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29736 29734  0  80   0  3252  1806 do_wai 10:33 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2068 29736  0  80   0  1728   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29755   269  0  80   0  2640  1839 do_wai 10:33 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29757 29755  0  80   0  3308  1806 do_wai 10:33 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1954 29757  0  80   0  1704   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29779   269  0  80   0  2580  1839 do_wai 10:33 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29781 29779  0  80   0  3256  1806 do_wai 10:33 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2044 29781  0  80   0  1680   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29802   269  0  80   0  2724  1839 do_wai 10:33 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29804 29802  0  80   0  3280  1806 do_wai 10:33 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1992 29804  0  80   0  1676   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29818   269  0  80   0  2616  1839 do_wai 10:33 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29820 29818  0  80   0  3204  1806 do_wai 10:33 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1910 29820  0  80   0  1720   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29836   269  0  80   0  2572  1839 do_wai 10:33 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29838 29836  0  80   0  3248  1806 do_wai 10:33 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1929 29838  0  80   0  1700   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29868   269  0  80   0  2548  1839 do_wai 10:33 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29870 29868  0  80   0  3236  1806 do_wai 10:33 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2206 29870  0  80   0  1740   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29886   269  0  80   0  2640  1839 do_wai 10:34 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29888 29886  0  80   0  3168  1806 do_wai 10:34 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2197 29888  0  80   0  1700   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29906   269  0  80   0  2552  1839 do_wai 10:34 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29908 29906  0  80   0  3144  1806 do_wai 10:34 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2242 29908  0  80   0  1704   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29933   269  0  80   0  2552  1839 do_wai 10:34 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29935 29933  0  80   0  3128  1806 do_wai 10:34 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2215 29935  0  80   0  1736   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29955   269  0  80   0  2604  1839 do_wai 10:34 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29957 29955  0  80   0  3340  1806 do_wai 10:34 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2224 29957  0  80   0  1704   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   29970   269  0  80   0  2624  1839 do_wai 10:34 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   29972 29970  0  80   0  3252  1806 do_wai 10:34 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2244 29972  0  80   0  1680   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30003   269  0  80   0  2580  1839 do_wai 10:34 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30005 30003  0  80   0  3252  1806 do_wai 10:34 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1905 30005  0  80   0  1708   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30019   269  0  80   0  2620  1839 do_wai 10:34 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30021 30019  0  80   0  3256  1806 do_wai 10:34 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2030 30021  0  80   0  1800   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30069   269  0  80   0  2668  1839 do_wai 10:34 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30071 30069  0  80   0  3192  1806 do_wai 10:34 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2227 30071  0  80   0  1700   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30090   269  0  80   0  2640  1839 do_wai 10:34 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30092 30090  0  80   0  3212  1806 do_wai 10:34 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2102 30092  0  80   0  1728   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30115   269  0  80   0  2672  1839 do_wai 10:34 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30117 30115  0  80   0  3280  1806 do_wai 10:34 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2209 30117  0  80   0  1676   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30132   269  0  80   0  2596  1839 do_wai 10:34 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30134 30132  0  80   0  3288  1806 do_wai 10:34 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2067 30134  0  80   0  1736   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30163   269  0  80   0  2552  1839 do_wai 10:34 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30165 30163  0  80   0  3184  1806 do_wai 10:34 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2085 30165  0  80   0  1728   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30180   269  0  80   0  2624  1839 do_wai 10:35 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30182 30180  0  80   0  3140  1806 do_wai 10:35 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1931 30182  0  80   0  1704   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30214   269  0  80   0  2604  1839 do_wai 10:35 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30216 30214  0  80   0  3248  1806 do_wai 10:35 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1849 30216  0  80   0  1708   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30232   269  0  80   0  2632  1839 do_wai 10:35 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30234 30232  0  80   0  3152  1806 do_wai 10:35 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1884 30234  0  80   0  1720   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30259   269  0  80   0  2660  1839 do_wai 10:35 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30261 30259  0  80   0  3200  1806 do_wai 10:35 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1841 30261  0  80   0  1680   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30290   269  0  80   0  2644  1839 do_wai 10:35 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30292 30290  0  80   0  3236  1806 do_wai 10:35 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2230 30292  0  80   0  1708   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30307   269  0  80   0  2604  1839 do_wai 10:35 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30309 30307  0  80   0  3200  1806 do_wai 10:35 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2043 30309  0  80   0  1716   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30334   269  0  80   0  2568  1839 do_wai 10:35 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30337 30334  0  80   0  3224  1806 do_wai 10:35 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2145 30337  0  80   0  1728   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30352   269  0  80   0  2648  1839 do_wai 10:35 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30354 30352  0  80   0  3100  1806 do_wai 10:35 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2221 30354  0  80   0  1624   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30385   269  0  80   0  2608  1839 do_wai 10:35 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30387 30385  0  80   0  3236  1806 do_wai 10:35 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1844 30387  0  80   0  1728   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30406   269  0  80   0  2724  1839 do_wai 10:35 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30408 30406  0  80   0  3236  1806 do_wai 10:35 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2010 30408  0  80   0  1624   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30472   269  0  80   0  2612  1839 do_wai 10:35 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30474 30472  0  80   0  3248  1806 do_wai 10:35 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2173 30474  0  80   0  1796   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30499   269  0  80   0  2608  1839 do_wai 10:35 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30501 30499  0  80   0  3224  1806 do_wai 10:35 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2166 30501  0  80   0  1624   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30518   269  0  80   0  2584  1839 do_wai 10:36 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30520 30518  0  80   0  3264  1806 do_wai 10:36 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2101 30520  0  80   0  1768   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30564   269  0  80   0  2644  1839 do_wai 10:36 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30566 30564  0  80   0  3228  1806 do_wai 10:36 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1958 30566  0  80   0  1708   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30595   269  0  80   0  2576  1839 do_wai 10:36 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30597 30595  0  80   0  3140  1806 do_wai 10:36 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2004 30597  0  80   0  1684   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30635   269  0  80   0  2600  1839 do_wai 10:36 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30637 30635  0  80   0  3280  1806 do_wai 10:36 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2231 30637  0  80   0  1740   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30680   269  0  80   0  2584  1839 do_wai 10:36 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30682 30680  0  80   0  3208  1806 do_wai 10:36 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1879 30682  0  80   0  1728   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30708   269  0  80   0  2672  1839 do_wai 10:36 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30710 30708  0  80   0  3156  1806 do_wai 10:36 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2233 30710  0  80   0  1716   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30751   269  0  80   0  2580  1839 do_wai 10:36 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30753 30751  0  80   0  3248  1806 do_wai 10:36 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2203 30753  0  80   0  1740   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30783   269  0  80   0  2556  1839 do_wai 10:36 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30785 30783  0  80   0  3336  1806 do_wai 10:36 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2066 30785  0  80   0  1704   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30818   269  0  80   0  2640  1839 do_wai 10:36 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30820 30818  0  80   0  3220  1806 do_wai 10:36 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1990 30820  0  80   0  1712   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30836   269  0  80   0  2596  1839 do_wai 10:37 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30838 30836  0  80   0  3204  1806 do_wai 10:37 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1948 30838  0  80   0  1712   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30875   269  0  80   0  2608  1839 do_wai 10:37 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30877 30875  0  80   0  3180  1806 do_wai 10:37 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1897 30877  0  80   0  1708   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30890   269  0  80   0  2724  1839 do_wai 10:37 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30892 30890  0  80   0  3296  1806 do_wai 10:37 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2018 30892  0  80   0  1696   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30922   269  0  80   0  2644  1839 do_wai 10:37 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30924 30922  0  80   0  3204  1806 do_wai 10:37 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1949 30924  0  80   0  1772   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30941   269  0  80   0  2660  1839 do_wai 10:37 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30943 30941  0  80   0  3188  1806 do_wai 10:37 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2176 30943  0  80   0  1708   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   30964   269  0  80   0  2608  1839 do_wai 10:37 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   30966 30964  0  80   0  3192  1806 do_wai 10:37 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2172 30966  0  80   0  1796   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31037   269  0  80   0  2552  1839 do_wai 10:37 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31039 31037  0  80   0  3200  1806 do_wai 10:37 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2175 31039  0  80   0  1728   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31054   269  0  80   0  2600  1839 do_wai 10:37 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31056 31054  0  80   0  3272  1806 do_wai 10:37 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2155 31056  0  80   0  1620   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31104   269  0  80   0  2724  1839 do_wai 10:38 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31106 31104  0  80   0  3124  1806 do_wai 10:38 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2167 31106  0  80   0  1720   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31145   269  0  80   0  2644  1839 do_wai 10:38 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31147 31145  0  80   0  3280  1806 do_wai 10:38 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2234 31147  0  80   0  1708   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31174   269  0  80   0  2644  1839 do_wai 10:38 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31176 31174  0  80   0  3236  1806 do_wai 10:38 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2135 31176  0  80   0  1696   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31259   269  0  80   0  2668  1839 do_wai 10:38 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31261 31259  0  80   0  3176  1806 do_wai 10:38 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2213 31261  0  80   0  1704   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31313   269  0  80   0  2672  1839 do_wai 10:38 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31315 31313  0  80   0  3264  1806 do_wai 10:38 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1888 31315  0  80   0  1696   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31329   269  0  80   0  2724  1839 do_wai 10:38 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31331 31329  0  80   0  3256  1806 do_wai 10:38 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1906 31331  0  80   0  1680   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31362   269  0  80   0  2648  1839 do_wai 10:38 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31364 31362  0  80   0  3284  1806 do_wai 10:38 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1902 31364  0  80   0  1712   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31395   269  0  80   0  2608  1839 do_wai 10:39 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31397 31395  0  80   0  3264  1806 do_wai 10:39 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2201 31397  0  80   0  1712   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31452   269  0  80   0  2648  1839 do_wai 10:39 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31454 31452  0  80   0  3156  1806 do_wai 10:39 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2082 31454  0  80   0  1676   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31469   269  0  80   0  2564  1839 do_wai 10:39 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31471 31469  0  80   0  3184  1806 do_wai 10:39 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2216 31471  0  80   0  1704   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31507   269  0  80   0  2724  1839 do_wai 10:39 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31509 31507  0  80   0  3236  1806 do_wai 10:39 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1898 31509  0  80   0  1680   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31539   269  0  80   0  2604  1839 do_wai 10:39 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31541 31539  0  80   0  3284  1806 do_wai 10:39 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2214 31541  0  80   0  1704   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31556   269  0  80   0  2616  1839 do_wai 10:39 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31558 31556  0  80   0  3316  1806 do_wai 10:39 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2243 31558  0  80   0  1740   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31579   269  0  80   0  2556  1839 do_wai 10:39 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31581 31579  0  80   0  3156  1806 do_wai 10:39 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2159 31581  0  80   0  1676   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31596   269  0  80   0  2568  1839 do_wai 10:39 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31598 31596  0  80   0  3192  1806 do_wai 10:39 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2239 31598  0  80   0  1720   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31613   269  0  80   0  2724  1839 do_wai 10:39 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31615 31613  0  80   0  3212  1806 do_wai 10:39 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2105 31615  0  80   0  1704   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31647   269  0  80   0  2648  1839 do_wai 10:39 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31649 31647  0  80   0  3228  1806 do_wai 10:39 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2103 31649  0  80   0  1728   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31665   269  0  80   0  2612  1839 do_wai 10:40 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31667 31665  0  80   0  3204  1806 do_wai 10:40 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1843 31667  0  80   0  1736   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31683   269  0  80   0  2608  1839 do_wai 10:40 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31685 31683  0  80   0  3280  1806 do_wai 10:40 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1861 31685  0  80   0  1680   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31705   269  0  80   0  2580  1839 do_wai 10:40 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31707 31705  0  80   0  3212  1806 do_wai 10:40 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2040 31707  0  80   0  1616   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31725   269  0  80   0  2616  1839 do_wai 10:40 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31727 31725  0  80   0  3232  1806 do_wai 10:40 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2177 31727  0  80   0  1696   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31758   269  0  80   0  2552  1839 do_wai 10:40 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31760 31758  0  80   0  3172  1806 do_wai 10:40 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2059 31760  0  80   0  1732   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31773   269  0  80   0  2616  1839 do_wai 10:40 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31775 31773  0  80   0  3292  1806 do_wai 10:40 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2225 31775  0  80   0  1796   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31796   269  0  80   0  2552  1839 do_wai 10:40 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31798 31796  0  80   0  3296  1806 do_wai 10:40 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2200 31798  0  80   0  1720   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31821   269  0  80   0  2640  1839 do_wai 10:40 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31823 31821  0  80   0  3308  1806 do_wai 10:40 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2232 31823  0  80   0  1776   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31840   269  0  80   0  2580  1839 do_wai 10:40 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31842 31840  0  80   0  3256  1806 do_wai 10:40 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2171 31842  0  80   0  1728   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31860   269  0  80   0  2608  1839 do_wai 10:40 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31862 31860  0  80   0  3164  1806 do_wai 10:40 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1979 31862  0  80   0  1728   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31891   269  0  80   0  2668  1839 do_wai 10:40 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31893 31891  0  80   0  3260  1806 do_wai 10:40 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1859 31893  0  80   0  1728   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31908   269  0  80   0  2648  1839 do_wai 10:41 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31910 31908  0  80   0  3252  1806 do_wai 10:41 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2095 31910  0  80   0  1700   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31926   269  0  80   0  2660  1839 do_wai 10:41 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31928 31926  0  80   0  3184  1806 do_wai 10:41 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2228 31928  0  80   0  1716   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31949   269  0  80   0  2660  1839 do_wai 10:41 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31951 31949  0  80   0  3280  1806 do_wai 10:41 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1951 31951  0  80   0  1708   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31966   269  0  80   0  2604  1839 do_wai 10:41 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31968 31966  0  80   0  3128  1806 do_wai 10:41 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2158 31968  0  80   0  1700   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   31997   269  0  80   0  2644  1839 do_wai 10:41 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   31999 31997  0  80   0  3216  1806 do_wai 10:41 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2204 31999  0  80   0  1772   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   32013   269  0  80   0  2668  1839 do_wai 10:41 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   32015 32013  0  80   0  3132  1806 do_wai 10:41 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2125 32015  0  80   0  1776   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   32032   269  0  80   0  2596  1839 do_wai 10:41 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   32034 32032  0  80   0  3280  1806 do_wai 10:41 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2100 32034  0  80   0  1720   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   32056   269  0  80   0  2636  1839 do_wai 10:41 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   32058 32056  0  80   0  3236  1806 do_wai 10:41 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2035 32058  0  80   0  1696   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   32089   269  0  80   0  2668  1839 do_wai 10:41 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   32091 32089  0  80   0  3172  1806 do_wai 10:41 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2202 32091  0  80   0  1800   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   32112   269  0  80   0  2604  1839 do_wai 10:41 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   32114 32112  0  80   0  3164  1806 do_wai 10:41 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2223 32114  0  80   0  1680   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   32137   269  0  80   0  2612  1839 do_wai 10:41 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   32139 32137  0  80   0  3264  1806 do_wai 10:41 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2048 32139  0  80   0  1716   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   32155   269  0  80   0  2644  1839 do_wai 10:42 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   32157 32155  0  80   0  3188  1806 do_wai 10:42 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1921 32157  0  80   0  1708   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   32177   269  0  80   0  2636  1839 do_wai 10:42 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   32179 32177  0  80   0  3180  1806 do_wai 10:42 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1833 32179  0  80   0  1796   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   32272   269  0  80   0  2660  1839 do_wai 10:42 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   32274 32272  0  80   0  3300  1806 do_wai 10:42 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2031 32274  0  80   0  1684   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   32293   269  0  80   0  2644  1839 do_wai 10:42 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   32295 32293  0  80   0  3280  1806 do_wai 10:42 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2045 32295  0  80   0  1728   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   32340   269  0  80   0  2564  1839 do_wai 10:42 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   32342 32340  0  80   0  3140  1806 do_wai 10:42 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1937 32342  0  80   0  1676   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   32355   269  0  80   0  2640  1839 do_wai 10:42 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   32357 32355  0  80   0  3216  1806 do_wai 10:42 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1886 32357  0  80   0  1680   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   32394   269  0  80   0  2668  1839 do_wai 10:42 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   32396 32394  0  80   0  3160  1806 do_wai 10:42 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    2183 32396  0  80   0  1680   695 do_sel 10:47 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor   32518   269  0  80   0  2636  1839 do_wai 10:42 ?        00:00:00  \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1789743954380-gji1zi.sh 2>/dev/n
S bukzor   32520 32518  0  80   0  3244  1806 do_wai 10:42 ?        00:00:00  |   \_ /bin/bash ./driftwatch.sh
S bukzor    1208 32520  0  80   0  1680   695 do_sel 10:46 ?        00:00:00  |       \_ inotifywait -qq -t 3600 -e modify,close_write,create,delete,moved_to,moved_from log/events/capt
S bukzor    2593   269  0  60 -20  7300  2950 x64_sy 10:47 ?        00:00:03  \_ tmux new -s claude
S bukzor    2594  2593  0  60 -20  8224  2820 do_wai 10:47 pts/2    00:00:00      \_ -bash
S bukzor    2918  2594 17  60 -20 389984 1400063 do_epo 10:47 pts/2 00:01:32      |   \_ claude
S bukzor    6960  2918  0  60 -20  3736  1839 do_wai 10:56 ?        00:00:00      |       \_ /bin/bash -c source /home/bukzor/.claude/shell-snapshots/snapshot-bash-1790178492793-98e2mb
S bukzor    6962  6960  0  70 -10  4200  1979 do_wai 10:56 ?        00:00:00      |           \_ bash
S bukzor    6963  6962  0  70 -10  3500  1773 do_wai 10:56 ?        00:00:00      |               \_ /bin/bash /home/bukzor/.claude/skills/incident-forensics/bin/incident-forensics-cap
S bukzor    6974  6963  0  70 -10  1804   671 do_wai 10:56 ?        00:00:00      |                   \_ sh evidence.kb/2026-09-23-000-full-process-tree-around-driftwatch-raw.sh
S bukzor    6975  6974  0  70 -10  4068  1978 do_wai 10:56 ?        00:00:00      |                       \_ bash -c ps -efly --forest | grep -C10 driftwatch
R bukzor    6976  6975  0  70 -10  5520  2630 -      10:56 ?        00:00:00      |                           \_ ps -efly --forest
S bukzor    6977  6975  0  70 -10  2404  1633 pipe_r 10:56 ?        00:00:00      |                           \_ grep -C10 driftwatch
S bukzor    3219  2593  0  60 -20  8300  2820 do_wai 10:48 pts/4    00:00:00      \_ -bash
S bukzor    3543  3219  0  60 -20 88608 236876 x64_sy 10:48 pts/4   00:00:03      |   \_ /home/bukzor/.local/share/uv/tools/mitmproxy/bin/python /home/bukzor/.local/bin/mitmdump --mode
Z bukzor    3602  3543  0  60 -20     0     0 -      10:48 ?        00:00:00      |       \_ [python] <defunct>
S bukzor    6507  2593  1  60 -20  8252  2820 do_wai 10:56 pts/1    00:00:00      \_ -bash
S bukzor    6866  6507 66  60 -20 265924 1400027 do_epo 10:56 pts/1 00:00:02          \_ claude
S Debian-+   476     1  0  80   0 17308 10378 -      Aug24 ?        00:02:55 /usr/sbin/exim4 -bdf -q30m
S rtkit      512     1  0  81   1  2420 21752 -      Aug24 ?        00:00:51 /usr/libexec/rtkit-daemon
S polkitd    541     1  0  80   0  4524 95310 -      Aug24 ?        00:01:55 /usr/lib/polkit-1/polkitd --no-debug --log-level=notice
S earlyoom   544     1  0  60 -20  1820   647 -      Aug24 ?        00:15:32 /usr/bin/earlyoom -r 3600 -m 6,3
S root     20334     1  0  80   0 14592 26071 -      Aug26 ?        00:01:50 /usr/lib/systemd/systemd-journald
```
