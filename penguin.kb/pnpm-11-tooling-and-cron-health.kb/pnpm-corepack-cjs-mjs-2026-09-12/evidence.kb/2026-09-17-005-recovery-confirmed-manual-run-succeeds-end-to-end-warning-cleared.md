---
captured: "2026-09-17"
method: ./2026-09-17-005-recovery-confirmed-manual-run-succeeds-end-to-end-warning-cleared.sh
---

# Recovery confirmed: manual run succeeds end-to-end, warning cleared

```sh
'bash' '-c' 'echo "status:"; cat /home/bukzor/.local/state/cron/pnpm-upgrade-g.status; echo "cron-status (empty = clean):"; /home/bukzor/bin/cron-status; echo "(none)"; echo "log tail:"; tail -25 /home/bukzor/.local/state/cron/pnpm-upgrade-g.log'
```

```
status:
0
cron-status (empty = clean):
(none)
log tail:
  Virtual store is at:             prefix/pnpm/global/v11/2ada-18d635470de8ec62-0/node_modules/.pnpm
.../global/v11/2ada-18d635470de8ec62-0   | Progress: resolved 2, reused 2, downloaded 0, added 2, done

dependencies:
+ @openai/codex 0.154.0

[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../global/v11/2ada-18d635471a8c1f9b-1   | Progress: resolved 141, reused 142, downloaded 0, added 141, done
.../global/v11/2ada-18d6354729f50a0a-2   | Progress: resolved 1, reused 1, downloaded 0, added 1, done
.../global/v11/2ada-18d635474432b3e3-3   | Progress: resolved 1, reused 1, downloaded 0, added 1, done
.../global/v11/2ada-18d63547479f35ba-4   | Progress: resolved 18, reused 18, downloaded 0, added 18, done
.../global/v11/2ada-18d635474b5657be-5   | Progress: resolved 31, reused 31, downloaded 0, added 31, done
.../global/v11/2ada-18d6354750a1db21-6   | Progress: resolved 1, reused 1, downloaded 0, added 1, done
Done in 1.2s using pnpm v12.4.2

Upgrading pnpm itself...
Installing pnpm@12.4.2 in the project...

Already up to date
Done in 1ms using pnpm v12.4.2
  packageManager: pnpm@12.4.2+sha512.08adc6613180275c7c9edada39dcf08c9c61ad4e7eaf330a4f3461f102b0f907423454d117f98e72d47fef0616070644d7bffc973a6a57f5090a6d7c368b07c9

Checking...
[WARN] Using --global skips the package manager check for this project
  ok
```
