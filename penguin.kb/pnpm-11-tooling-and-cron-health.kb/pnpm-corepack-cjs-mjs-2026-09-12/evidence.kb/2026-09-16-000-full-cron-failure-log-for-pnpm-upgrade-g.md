---
captured: "2026-09-16"
method: ./2026-09-16-000-full-cron-failure-log-for-pnpm-upgrade-g.sh
---

# Full cron failure log for pnpm-upgrade-g

```sh
'cat' '/home/bukzor/.local/state/cron/pnpm-upgrade-g.log'
```

```
--
2026-03-04T10:39:01,527621927-06:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 79, reused 63, downloaded 1, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Packages: +2 -2
++--
Progress: resolved 231, reused 216, downloaded 1, added 1
Progress: resolved 231, reused 216, downloaded 2, added 1
Progress: resolved 231, reused 216, downloaded 2, added 2, done

/home/bukzor/prefix/pnpm/5:
- @openai/codex 0.106.0
+ @openai/codex 0.107.0

Done in 3.8s using pnpm v10.30.3

Syncing packageManager pin...
  packageManager: pnpm@10.30.3
--
2026-03-04T10:40:01,661781563-06:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 140, reused 127, downloaded 0, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Already up to date
Progress: resolved 231, reused 218, downloaded 0, added 0, done

Done in 1.9s using pnpm v10.30.3

Syncing packageManager pin...
  packageManager: pnpm@10.30.3
--
2026-03-04T10:41:01,788296149-06:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 118, reused 104, downloaded 0, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Already up to date
Progress: resolved 231, reused 218, downloaded 0, added 0, done

Done in 2s using pnpm v10.30.3

Syncing packageManager pin...
  packageManager: pnpm@10.30.3
--
2026-03-10T09:57:36,090636186-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0

   ╭──────────────────────────────────────────╮
   │                                          │
   │   Update available! 10.30.3 → 10.32.0.   │
   │   Changelog: https://pnpm.io/v/10.32.0   │
   │     To update, run: pnpm add -g pnpm     │
   │                                          │
   ╰──────────────────────────────────────────╯

Progress: resolved 36, reused 24, downloaded 1, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Progress: resolved 231, reused 215, downloaded 2, added 0
Packages: +3 -3
+++---
Progress: resolved 231, reused 215, downloaded 2, added 2
Progress: resolved 231, reused 215, downloaded 3, added 2
Progress: resolved 231, reused 215, downloaded 3, added 3, done

/home/bukzor/prefix/pnpm/5:
- @openai/codex 0.107.0
+ @openai/codex 0.113.0
- pnpm 10.30.3
+ pnpm 10.32.0

Done in 6.7s using pnpm v10.30.3

Syncing packageManager pin...
  packageManager: pnpm@10.32.0
--
2026-03-12T09:05:02,076638694-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest


   ╭──────────────────────────────────────────╮
   │                                          │
   │   Update available! 10.32.0 → 10.32.1.   │
   │   Changelog: https://pnpm.io/v/10.32.1   │
   │     To update, run: pnpm add -g pnpm     │
   │                                          │
   ╰──────────────────────────────────────────╯

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 29, reused 18, downloaded 2, added 0
Progress: resolved 230, reused 214, downloaded 2, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Progress: resolved 231, reused 215, downloaded 2, added 0
Packages: +3 -3
+++---
Progress: resolved 231, reused 215, downloaded 2, added 2
Progress: resolved 231, reused 215, downloaded 3, added 3, done

/home/bukzor/prefix/pnpm/5:
- @openai/codex 0.113.0
+ @openai/codex 0.114.0
- pnpm 10.32.0
+ pnpm 10.32.1

Done in 5.6s using pnpm v10.32.0

Syncing packageManager pin...
  packageManager: pnpm@10.32.1
--
2026-03-16T14:05:01,667129324-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 118, reused 105, downloaded 0, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Already up to date
Progress: resolved 231, reused 218, downloaded 0, added 0, done

Done in 2.4s using pnpm v10.32.1

Syncing packageManager pin...
  packageManager: pnpm@10.32.1
--
2026-03-19T15:05:01,866053812-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 29, reused 22, downloaded 2, added 0
Progress: resolved 142, reused 119, downloaded 2, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Packages: +7 -7
+++++++-------
Progress: resolved 231, reused 211, downloaded 2, added 2
Progress: resolved 231, reused 211, downloaded 3, added 2
Progress: resolved 231, reused 211, downloaded 6, added 6
Progress: resolved 231, reused 211, downloaded 7, added 6
Progress: resolved 231, reused 211, downloaded 7, added 7, done

/home/bukzor/prefix/pnpm/5:
- @openai/codex 0.114.0
+ @openai/codex 0.116.0
- bun 1.3.10
+ bun 1.3.11

╭ Warning ─────────────────────────────────────────────────────────────────────╮
│                                                                              │
│   Ignored build scripts: bun@1.3.11.                                         │
│   Run "pnpm approve-builds -g" to pick which dependencies should be          │
│   allowed to run scripts.                                                    │
│                                                                              │
╰──────────────────────────────────────────────────────────────────────────────╯
Done in 10.1s using pnpm v10.32.1

Syncing packageManager pin...
  packageManager: pnpm@10.32.1
--
2026-03-20T11:05:01,318369416-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 37, reused 26, downloaded 0, added 0
Progress: resolved 227, reused 214, downloaded 0, added 0
Progress: resolved 229, reused 216, downloaded 0, added 0
Progress: resolved 230, reused 216, downloaded 0, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Already up to date
Progress: resolved 231, reused 218, downloaded 0, added 0, done

Done in 5.6s using pnpm v10.32.1

Syncing packageManager pin...
  packageManager: pnpm@10.32.1
--
2026-03-24T14:50:09,833167461-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0

   ╭──────────────────────────────────────────╮
   │                                          │
   │   Update available! 10.32.1 → 10.33.0.   │
   │   Changelog: https://pnpm.io/v/10.33.0   │
   │     To update, run: pnpm add -g pnpm     │
   │                                          │
   ╰──────────────────────────────────────────╯

Progress: resolved 37, reused 26, downloaded 0, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Packages: +1 -1
+-
Progress: resolved 231, reused 217, downloaded 1, added 1, done

/home/bukzor/prefix/pnpm/5:
- pnpm 10.32.1
+ pnpm 10.33.0

Done in 2.6s using pnpm v10.32.1

Syncing packageManager pin...
  packageManager: pnpm@10.33.0
--
2026-03-25T12:05:02,061411723-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 85, reused 69, downloaded 0, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Already up to date
Progress: resolved 231, reused 218, downloaded 0, added 0, done

Done in 2.3s using pnpm v10.33.0

Syncing packageManager pin...
  packageManager: pnpm@10.33.0
--
2026-03-28T14:42:52,136166256-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 99, reused 83, downloaded 1, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Packages: +2 -2
++--
Progress: resolved 231, reused 216, downloaded 1, added 1
Progress: resolved 231, reused 216, downloaded 2, added 1
Progress: resolved 231, reused 216, downloaded 2, added 2, done

/home/bukzor/prefix/pnpm/5:
- @openai/codex 0.116.0
+ @openai/codex 0.117.0

Done in 5.9s using pnpm v10.33.0

Syncing packageManager pin...
  packageManager: pnpm@10.33.0
--
2026-04-04T14:52:19,637422370-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 35, reused 20, downloaded 1, added 0
Progress: resolved 183, reused 168, downloaded 1, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Packages: +2 -2
++--
Progress: resolved 231, reused 216, downloaded 1, added 1
Progress: resolved 231, reused 216, downloaded 2, added 1
Progress: resolved 231, reused 216, downloaded 2, added 2, done

/home/bukzor/prefix/pnpm/5:
- @openai/codex 0.117.0
+ @openai/codex 0.118.0

Done in 12.8s using pnpm v10.33.0

Syncing packageManager pin...
  packageManager: pnpm@10.33.0
--
2026-04-08T10:05:01,722262025-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 120, reused 107, downloaded 0, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Already up to date
Progress: resolved 231, reused 218, downloaded 0, added 0, done

Done in 2.3s using pnpm v10.33.0

Syncing packageManager pin...
  packageManager: pnpm@10.33.0
--
2026-04-17T14:39:32,093923228-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 21, reused 18, downloaded 2, added 0
Progress: resolved 94, reused 73, downloaded 2, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Packages: +7 -7
+++++++-------
Progress: resolved 231, reused 211, downloaded 2, added 2
Progress: resolved 231, reused 211, downloaded 3, added 2
Progress: resolved 231, reused 211, downloaded 3, added 3
Progress: resolved 231, reused 211, downloaded 5, added 5
Progress: resolved 231, reused 211, downloaded 6, added 6
Progress: resolved 231, reused 211, downloaded 7, added 6
Progress: resolved 231, reused 211, downloaded 7, added 7, done

/home/bukzor/prefix/pnpm/5:
- @openai/codex 0.118.0
+ @openai/codex 0.121.0
- bun 1.3.11
+ bun 1.3.12

╭ Warning ─────────────────────────────────────────────────────────────────────╮
│                                                                              │
│   Ignored build scripts: bun@1.3.12.                                         │
│   Run "pnpm approve-builds -g" to pick which dependencies should be          │
│   allowed to run scripts.                                                    │
│                                                                              │
╰──────────────────────────────────────────────────────────────────────────────╯
Done in 13.9s using pnpm v10.33.0

Syncing packageManager pin...
  packageManager: pnpm@10.33.0
--
2026-04-20T16:05:01,832454494-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 26, reused 22, downloaded 2, added 0
Progress: resolved 99, reused 79, downloaded 2, added 0
Progress: resolved 229, reused 209, downloaded 2, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Packages: +7 -7
+++++++-------
Progress: resolved 231, reused 211, downloaded 2, added 2
Progress: resolved 231, reused 211, downloaded 3, added 2
Progress: resolved 231, reused 211, downloaded 3, added 3
Progress: resolved 231, reused 211, downloaded 4, added 4
Progress: resolved 231, reused 211, downloaded 5, added 4
Progress: resolved 231, reused 211, downloaded 5, added 5
Progress: resolved 231, reused 211, downloaded 6, added 6
Progress: resolved 231, reused 211, downloaded 7, added 6
Progress: resolved 231, reused 211, downloaded 7, added 7, done

/home/bukzor/prefix/pnpm/5:
- @openai/codex 0.121.0
+ @openai/codex 0.122.0
- bun 1.3.12
+ bun 1.3.13

╭ Warning ─────────────────────────────────────────────────────────────────────╮
│                                                                              │
│   Ignored build scripts: bun@1.3.13.                                         │
│   Run "pnpm approve-builds -g" to pick which dependencies should be          │
│   allowed to run scripts.                                                    │
│                                                                              │
╰──────────────────────────────────────────────────────────────────────────────╯
Done in 20.6s using pnpm v10.33.0

Syncing packageManager pin...
  packageManager: pnpm@10.33.0
--
2026-04-21T09:05:01,833842902-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 77, reused 62, downloaded 0, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Already up to date
Progress: resolved 231, reused 218, downloaded 0, added 0, done

Done in 2.4s using pnpm v10.33.0

Syncing packageManager pin...
  packageManager: pnpm@10.33.0
--
2026-04-24T15:05:01,748991379-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0

   ╭──────────────────────────────────────────╮
   │                                          │
   │   Update available! 10.33.0 → 10.33.2.   │
   │   Changelog: https://pnpm.io/v/10.33.2   │
   │     To update, run: pnpm add -g pnpm     │
   │                                          │
   ╰──────────────────────────────────────────╯

Progress: resolved 49, reused 39, downloaded 1, added 0
Progress: resolved 171, reused 154, downloaded 2, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Progress: resolved 231, reused 215, downloaded 2, added 0
Packages: +3 -3
+++---
Progress: resolved 231, reused 215, downloaded 2, added 2
Progress: resolved 231, reused 215, downloaded 3, added 2
Progress: resolved 231, reused 215, downloaded 3, added 3, done

/home/bukzor/prefix/pnpm/5:
- @openai/codex 0.122.0
+ @openai/codex 0.125.0
- pnpm 10.33.0
+ pnpm 10.33.2

Done in 12.6s using pnpm v10.33.0

Syncing packageManager pin...
  packageManager: pnpm@10.33.2
--
2026-04-28T15:05:01,727101202-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 35, reused 25, downloaded 0, added 0
Progress: resolved 227, reused 214, downloaded 0, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Already up to date
Progress: resolved 231, reused 218, downloaded 0, added 0, done

Done in 3s using pnpm v10.33.2

Syncing packageManager pin...
  packageManager: pnpm@10.33.2
--
2026-04-29T13:05:02,090366381-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 50, reused 39, downloaded 0, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Already up to date
Progress: resolved 231, reused 218, downloaded 0, added 0, done

Done in 2.9s using pnpm v10.33.2

Syncing packageManager pin...
  packageManager: pnpm@10.33.2
--
2026-04-30T17:05:01,250115513-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 24, reused 14, downloaded 1, added 0
Progress: resolved 106, reused 89, downloaded 1, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Packages: +2 -2
++--
Progress: resolved 231, reused 216, downloaded 1, added 1
Progress: resolved 231, reused 216, downloaded 2, added 1
Progress: resolved 231, reused 216, downloaded 2, added 2, done

/home/bukzor/prefix/pnpm/5:
- @openai/codex 0.125.0
+ @openai/codex 0.128.0

Done in 14.4s using pnpm v10.33.2

Syncing packageManager pin...
  packageManager: pnpm@10.33.2
--
2026-05-01T14:05:21,062884292-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 67, reused 55, downloaded 0, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Already up to date
Progress: resolved 231, reused 218, downloaded 0, added 0, done

Done in 2.4s using pnpm v10.33.2

Syncing packageManager pin...
  packageManager: pnpm@10.33.2
--
2026-05-04T16:05:01,877980430-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 49, reused 38, downloaded 0, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Already up to date
Progress: resolved 231, reused 218, downloaded 0, added 0, done

Done in 2.6s using pnpm v10.33.2

Syncing packageManager pin...
  packageManager: pnpm@10.33.2
--
2026-05-05T13:05:01,905901205-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 76, reused 62, downloaded 0, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Packages: +1 -1
+-
Progress: resolved 231, reused 217, downloaded 1, added 1, done

/home/bukzor/prefix/pnpm/5:
- pnpm 10.33.2
+ pnpm 10.33.3

Done in 2.5s using pnpm v10.33.2

Syncing packageManager pin...
  packageManager: pnpm@10.33.3
--
2026-05-06T01:05:02,266644451-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0
Progress: resolved 49, reused 38, downloaded 0, added 0
Progress: resolved 230, reused 217, downloaded 0, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Already up to date
Progress: resolved 231, reused 218, downloaded 0, added 0, done

Done in 3.2s using pnpm v10.33.3

Syncing packageManager pin...
  packageManager: pnpm@10.33.3
--
2026-05-08T18:05:01,974166722-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  pnpm@latest
  vim-language-server@latest

Progress: resolved 1, reused 0, downloaded 0, added 0

   ╭─────────────────────────────────────────╮
   │                                         │
   │   Update available! 10.33.3 → 11.0.8.   │
   │   Changelog: https://pnpm.io/v/11.0.8   │
   │    To update, run: pnpm add -g pnpm     │
   │                                         │
   ╰─────────────────────────────────────────╯

Progress: resolved 34, reused 24, downloaded 1, added 0
Progress: resolved 145, reused 129, downloaded 2, added 0
 WARN  8 deprecated subdependencies found: glob@10.5.0, har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
Packages: +3 -3
+++---
Progress: resolved 231, reused 215, downloaded 2, added 2
Progress: resolved 231, reused 215, downloaded 3, added 2
Progress: resolved 231, reused 215, downloaded 3, added 3, done

/home/bukzor/prefix/pnpm/5:
- @openai/codex 0.128.0
+ @openai/codex 0.129.0
- pnpm 10.33.3
+ pnpm 11.0.8

Done in 15.7s using pnpm v10.33.3

Syncing packageManager pin...
  packageManager: pnpm@11.0.8
--
2026-05-11T15:05:01,627928414-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-05-12T09:05:01,721404976-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-05-13T00:05:01,945336877-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-05-14T00:05:01,102785499-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-05-15T13:05:01,868013671-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-05-16T17:05:01,622895466-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-05-17T15:05:01,838838025-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-05-18T18:05:01,936139681-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-05-19T13:05:01,689766515-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-05-20T13:05:01,690493641-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-05-21T10:05:01,738355379-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-05-22T17:05:02,119344343-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-05-25T12:05:01,776764959-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-05-26T18:05:01,288010403-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-05-27T10:05:01,840909334-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-05-28T00:05:02,063105929-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-06-03T09:47:49,962403815-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-06-12T10:36:32,242404305-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-06-18T20:05:01,692070032-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-06-20T13:05:01,413871606-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-06-22T10:05:02,028003107-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-06-23T10:05:01,246421040-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-06-24T14:05:01,582783595-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-06-25T17:05:02,002876037-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-06-27T16:05:01,330433335-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-06-28T12:05:01,590719184-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-06-30T18:05:01,712907494-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-07-01T00:05:01,694934555-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-07-02T14:05:01,906904052-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-07-03T11:05:01,672941996-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-07-04T17:29:11,369295636-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-07-05T17:05:01,802579109-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-07-06T00:05:01,999916133-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-07-07T10:05:01,765560225-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-07-09T10:05:01,936122367-05:00
[ERROR] The configured global bin directory "/home/bukzor/.local/share/pnpm/bin" is not in PATH
Run "pnpm setup" to update your shell configuration.
No global packages found
--
2026-08-27T16:43:23,680290693-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

.../54c2-1a0452d80c6-e99dab7681b66313    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../54c2-1a0452d80c6-e99dab7681b66313    |   +2 +
.../54c2-1a0452d80c6-e99dab7681b66313    | Progress: resolved 7, reused 2, downloaded 0, added 0
.../54c2-1a0452d80c6-e99dab7681b66313    | Progress: resolved 7, reused 2, downloaded 0, added 0, done
.../54c2-1a0452d8611-6bfd1aab83600566    | Progress: resolved 1, reused 0, downloaded 0, added 0
[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../54c2-1a0452d8611-6bfd1aab83600566    | +141 ++++++++++++++
.../54c2-1a0452d8611-6bfd1aab83600566    | Progress: resolved 141, reused 141, downloaded 0, added 0, done
.../54c2-1a0452d8836-74f147362fee6d43    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../54c2-1a0452d8836-74f147362fee6d43    |   +2 +
.../54c2-1a0452d8836-74f147362fee6d43    | Progress: resolved 13, reused 2, downloaded 0, added 0, done
.../54c2-1a0452d930b-16a349723d89f2d4    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../54c2-1a0452d930b-16a349723d89f2d4    |  +18 ++
.../54c2-1a0452d930b-16a349723d89f2d4    | Progress: resolved 18, reused 18, downloaded 0, added 0, done
.../54c2-1a0452d936f-398b0074b393d1f7    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../54c2-1a0452d936f-398b0074b393d1f7    |  +30 +++
.../54c2-1a0452d936f-398b0074b393d1f7    | Progress: resolved 30, reused 30, downloaded 0, added 0, done
.../54c2-1a0452d93db-67cd26a8273fd27d    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../54c2-1a0452d93db-67cd26a8273fd27d    |   +1 +
.../54c2-1a0452d93db-67cd26a8273fd27d    | Progress: resolved 1, reused 1, downloaded 0, added 0, done

global:
+ @openai/codex 0.150.0
+ amazon-buddy 2.2.45
+ bun 1.4.0
+ js-beautify 2.0.3
+ neovim 5.4.0
+ vim-language-server 2.3.1

Done in 5.4s using pnpm v11.24.0

Upgrading pnpm itself...
Checking for updates...
The current project is already set to use pnpm v11.24.0
  packageManager: pnpm@11.24.0

Checking...
  ok
--
2026-08-27T17:28:57,008791839-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

[WARN] Using --global skips the package manager check for this project
.../6d6f-1a04557324e-c6b7282c88dcf027    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../6d6f-1a04557324e-c6b7282c88dcf027    |   +2 +
.../6d6f-1a04557324e-c6b7282c88dcf027    | Progress: resolved 7, reused 2, downloaded 0, added 0, done
.../6d6f-1a045573717-2e11a347831c2247    | Progress: resolved 1, reused 0, downloaded 0, added 0
[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../6d6f-1a045573717-2e11a347831c2247    | +141 ++++++++++++++
.../6d6f-1a045573717-2e11a347831c2247    | Progress: resolved 141, reused 141, downloaded 0, added 0, done
.../6d6f-1a04557395b-7710e022d42cab3a    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../6d6f-1a04557395b-7710e022d42cab3a    |   +2 +
.../6d6f-1a04557395b-7710e022d42cab3a    | Progress: resolved 13, reused 2, downloaded 0, added 0, done
.../6d6f-1a045574279-8dd4fcdbf4e12f6b    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../6d6f-1a045574279-8dd4fcdbf4e12f6b    |  +18 ++
.../6d6f-1a045574279-8dd4fcdbf4e12f6b    | Progress: resolved 18, reused 18, downloaded 0, added 0, done
.../6d6f-1a0455742da-c6d95cb4d1f6a9a3    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../6d6f-1a0455742da-c6d95cb4d1f6a9a3    |  +30 +++
.../6d6f-1a0455742da-c6d95cb4d1f6a9a3    | Progress: resolved 30, reused 30, downloaded 0, added 0, done
.../6d6f-1a04557435b-1c4d82562daecae7    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../6d6f-1a04557435b-1c4d82562daecae7    |   +1 +
.../6d6f-1a04557435b-1c4d82562daecae7    | Progress: resolved 1, reused 1, downloaded 0, added 0, done

global:
+ @openai/codex 0.150.0
+ amazon-buddy 2.2.45
+ bun 1.4.0
+ js-beautify 2.0.3
+ neovim 5.4.0
+ vim-language-server 2.3.1

Done in 4.8s using pnpm v11.24.0

Upgrading pnpm itself...
Installing pnpm@11.24.0 in the project...

Already up to date
Done in 645ms using pnpm v11.24.0
  packageManager: pnpm@11.24.0+sha512.bd27e345e976dcb0be0b7a1228217b049a817e21b1f355c90dbe7dc46671895a8bc1e6d06c24554505ea93ea0b45f489a27ec1bfbc8de6a9659fca0f16fa0000

Checking...
[WARN] Using --global skips the package manager check for this project
  ok
--
2026-08-27T17:34:15,963659078-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

[WARN] Using --global skips the package manager check for this project
.../34c7-1a0455c1067-eb6c8ad0e39cea9e    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../34c7-1a0455c1067-eb6c8ad0e39cea9e    |   +2 +
.../34c7-1a0455c1067-eb6c8ad0e39cea9e    | Progress: resolved 7, reused 2, downloaded 0, added 0, done
.../34c7-1a0455c1518-7781356c6152e734    | Progress: resolved 1, reused 0, downloaded 0, added 0
[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../34c7-1a0455c1518-7781356c6152e734    | +141 ++++++++++++++
.../34c7-1a0455c1518-7781356c6152e734    | Progress: resolved 141, reused 141, downloaded 0, added 0, done
.../34c7-1a0455c16e2-83cc40e798623cb9    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../34c7-1a0455c16e2-83cc40e798623cb9    |   +2 +
.../34c7-1a0455c16e2-83cc40e798623cb9    | Progress: resolved 13, reused 2, downloaded 0, added 0, done
.../34c7-1a0455c202f-44eedeff917014e1    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../34c7-1a0455c202f-44eedeff917014e1    |  +18 ++
.../34c7-1a0455c202f-44eedeff917014e1    | Progress: resolved 18, reused 18, downloaded 0, added 0, done
.../34c7-1a0455c2089-b6b95d1036083821    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../34c7-1a0455c2089-b6b95d1036083821    |  +30 +++
.../34c7-1a0455c2089-b6b95d1036083821    | Progress: resolved 30, reused 30, downloaded 0, added 0, done
.../34c7-1a0455c2103-db98ebcf6043bed8    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../34c7-1a0455c2103-db98ebcf6043bed8    |   +1 +
.../34c7-1a0455c2103-db98ebcf6043bed8    | Progress: resolved 1, reused 1, downloaded 0, added 0, done

global:
+ @openai/codex 0.150.0
+ amazon-buddy 2.2.45
+ bun 1.4.0
+ js-beautify 2.0.3
+ neovim 5.4.0
+ vim-language-server 2.3.1

Done in 4.8s using pnpm v11.24.0

Upgrading pnpm itself...
Installing pnpm@11.24.0 in the project...

Already up to date

Done in 644ms using pnpm v11.24.0
  packageManager: pnpm@11.24.0+sha512.bd27e345e976dcb0be0b7a1228217b049a817e21b1f355c90dbe7dc46671895a8bc1e6d06c24554505ea93ea0b45f489a27ec1bfbc8de6a9659fca0f16fa0000

Checking...
[WARN] Using --global skips the package manager check for this project
  ok
--
2026-08-27T18:14:27,136673088-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

[WARN] Using --global skips the package manager check for this project
.../63d5-1a04580dbba-2011c5f6379b3c91    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../63d5-1a04580dbba-2011c5f6379b3c91    |   +2 +
.../63d5-1a04580dbba-2011c5f6379b3c91    | Progress: resolved 7, reused 2, downloaded 0, added 0, done
.../63d5-1a04580e095-e8782cfc30309598    | Progress: resolved 1, reused 0, downloaded 0, added 0
[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../63d5-1a04580e095-e8782cfc30309598    | +141 ++++++++++++++
.../63d5-1a04580e095-e8782cfc30309598    | Progress: resolved 141, reused 141, downloaded 0, added 0, done
.../63d5-1a04580e2cd-4e7b03916f9f6def    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../63d5-1a04580e2cd-4e7b03916f9f6def    |   +2 +
.../63d5-1a04580e2cd-4e7b03916f9f6def    | Progress: resolved 13, reused 2, downloaded 0, added 0, done
.../63d5-1a04580ec0a-956b1527661ecc00    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../63d5-1a04580ec0a-956b1527661ecc00    |  +18 ++
.../63d5-1a04580ec0a-956b1527661ecc00    | Progress: resolved 18, reused 18, downloaded 0, added 0, done
.../63d5-1a04580ec75-43d9314e0627bf5a    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../63d5-1a04580ec75-43d9314e0627bf5a    |  +30 +++
.../63d5-1a04580ec75-43d9314e0627bf5a    | Progress: resolved 30, reused 30, downloaded 0, added 0, done
.../63d5-1a04580ece2-0d548b1b9b2f3019    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../63d5-1a04580ece2-0d548b1b9b2f3019    |   +1 +
.../63d5-1a04580ece2-0d548b1b9b2f3019    | Progress: resolved 1, reused 1, downloaded 0, added 0, done

global:
+ @openai/codex 0.150.0
+ amazon-buddy 2.2.45
+ bun 1.4.0
+ js-beautify 2.0.3
+ neovim 5.4.0
+ vim-language-server 2.3.1

Done in 5.1s using pnpm v11.24.0

Upgrading pnpm itself...
Installing pnpm@11.24.0 in the project...

Already up to date
Done in 760ms using pnpm v11.24.0
  packageManager: pnpm@11.24.0+sha512.bd27e345e976dcb0be0b7a1228217b049a817e21b1f355c90dbe7dc46671895a8bc1e6d06c24554505ea93ea0b45f489a27ec1bfbc8de6a9659fca0f16fa0000

Checking...
[WARN] Using --global skips the package manager check for this project
  ok
--
2026-08-28T00:05:02,130330652-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

[WARN] Using --global skips the package manager check for this project
.../33ad-1a046c1d3e8-ba16a76cd2648c7b    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../33ad-1a046c1d3e8-ba16a76cd2648c7b    |   +2 +
Packages are cloned from the content-addressable store to the virtual store.
  Content-addressable store is at: /home/bukzor/.local/share/pnpm/store/v11
  Virtual store is at:             .local/share/pnpm/store/v11/links
.../33ad-1a046c1d3e8-ba16a76cd2648c7b    | Progress: resolved 7, reused 0, downloaded 1, added 1
.../33ad-1a046c1d3e8-ba16a76cd2648c7b    | Progress: resolved 7, reused 0, downloaded 2, added 1
.../33ad-1a046c1d3e8-ba16a76cd2648c7b    | Progress: resolved 7, reused 0, downloaded 2, added 2, done
.../33ad-1a046c1fe1e-5ed76281b2bb7de4    | Progress: resolved 1, reused 0, downloaded 0, added 0
[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../33ad-1a046c1fe1e-5ed76281b2bb7de4    | +141 ++++++++++++++
.../33ad-1a046c1fe1e-5ed76281b2bb7de4    | Progress: resolved 141, reused 141, downloaded 0, added 0, done
.../33ad-1a046c2003c-571ae8cd00ea96f6    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../33ad-1a046c2003c-571ae8cd00ea96f6    |   +2 +
.../33ad-1a046c2003c-571ae8cd00ea96f6    | Progress: resolved 13, reused 2, downloaded 0, added 0, done
.../33ad-1a046c20a48-608cc1bb619a7fdc    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../33ad-1a046c20a48-608cc1bb619a7fdc    |  +18 ++
.../33ad-1a046c20a48-608cc1bb619a7fdc    | Progress: resolved 18, reused 18, downloaded 0, added 0, done
.../33ad-1a046c20aa5-3dff261e979c8b03    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../33ad-1a046c20aa5-3dff261e979c8b03    |  +30 +++
.../33ad-1a046c20aa5-3dff261e979c8b03    | Progress: resolved 30, reused 30, downloaded 0, added 0, done
.../33ad-1a046c20b14-6906f604f9718b45    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../33ad-1a046c20b14-6906f604f9718b45    |   +1 +
.../33ad-1a046c20b14-6906f604f9718b45    | Progress: resolved 1, reused 1, downloaded 0, added 0, done

global:
+ @openai/codex 0.150.1
+ amazon-buddy 2.2.45
+ bun 1.4.0
+ js-beautify 2.0.3
+ neovim 5.4.0
+ vim-language-server 2.3.1

Done in 14.8s using pnpm v11.24.0

Upgrading pnpm itself...
Installing pnpm@11.24.0 in the project...

Already up to date
Done in 749ms using pnpm v11.24.0
  packageManager: pnpm@11.24.0+sha512.bd27e345e976dcb0be0b7a1228217b049a817e21b1f355c90dbe7dc46671895a8bc1e6d06c24554505ea93ea0b45f489a27ec1bfbc8de6a9659fca0f16fa0000

Checking...
[WARN] Using --global skips the package manager check for this project
  ok
--
2026-08-29T00:05:01,738354053-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

[WARN] Using --global skips the package manager check for this project
.../38a9-1a04be82ed6-ee8771a5113f0024    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../38a9-1a04be82ed6-ee8771a5113f0024    |   +2 +
.../38a9-1a04be82ed6-ee8771a5113f0024    | Progress: resolved 7, reused 2, downloaded 0, added 0, done
.../38a9-1a04be83596-6dda6f3740f6b2e3    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../38a9-1a04be83596-6dda6f3740f6b2e3    | Progress: resolved 98, reused 98, downloaded 0, added 0
[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../38a9-1a04be83596-6dda6f3740f6b2e3    | +141 ++++++++++++++
.../38a9-1a04be83596-6dda6f3740f6b2e3    | Progress: resolved 141, reused 141, downloaded 0, added 0, done
.../38a9-1a04be83bf0-1244f2dcdf88e144    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../38a9-1a04be83bf0-1244f2dcdf88e144    |   +2 +
.../38a9-1a04be83bf0-1244f2dcdf88e144    | Progress: resolved 13, reused 2, downloaded 0, added 0, done
.../38a9-1a04be8467a-106d3565a2101cab    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../38a9-1a04be8467a-106d3565a2101cab    |  +18 ++
.../38a9-1a04be8467a-106d3565a2101cab    | Progress: resolved 18, reused 18, downloaded 0, added 0, done
.../38a9-1a04be84808-6255a56b2fdadbdc    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../38a9-1a04be84808-6255a56b2fdadbdc    |  +30 +++
.../38a9-1a04be84808-6255a56b2fdadbdc    | Progress: resolved 30, reused 30, downloaded 0, added 0, done
.../38a9-1a04be84b0b-cf18a8fdea74f149    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../38a9-1a04be84b0b-cf18a8fdea74f149    |   +1 +
.../38a9-1a04be84b0b-cf18a8fdea74f149    | Progress: resolved 1, reused 1, downloaded 0, added 0, done

global:
+ @openai/codex 0.150.1
+ amazon-buddy 2.2.45
+ bun 1.4.0
+ js-beautify 2.0.3
+ neovim 5.4.0
+ vim-language-server 2.3.1

Done in 8.2s using pnpm v11.24.0

Upgrading pnpm itself...
Installing pnpm@11.24.0 in the project...

Already up to date
Done in 671ms using pnpm v11.24.0
  packageManager: pnpm@11.24.0+sha512.bd27e345e976dcb0be0b7a1228217b049a817e21b1f355c90dbe7dc46671895a8bc1e6d06c24554505ea93ea0b45f489a27ec1bfbc8de6a9659fca0f16fa0000

Checking...
[WARN] Using --global skips the package manager check for this project
  ok
--
2026-08-30T00:05:01,396306532-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

[WARN] Using --global skips the package manager check for this project
.../v11/1e2-1a0510e893e-43e5f510e5924aa0 | Progress: resolved 1, reused 0, downloaded 0, added 0
.../v11/1e2-1a0510e893e-43e5f510e5924aa0 |   +2 +
.../v11/1e2-1a0510e893e-43e5f510e5924aa0 | Progress: resolved 7, reused 2, downloaded 0, added 0, done
.../v11/1e2-1a0510e8cf7-8aa3c2b1f235a994 | Progress: resolved 1, reused 0, downloaded 0, added 0
[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../v11/1e2-1a0510e8cf7-8aa3c2b1f235a994 | +141 ++++++++++++++
Packages are cloned from the content-addressable store to the virtual store.
  Content-addressable store is at: /home/bukzor/.local/share/pnpm/store/v11
  Virtual store is at:             .local/share/pnpm/store/v11/links
.../v11/1e2-1a0510e8cf7-8aa3c2b1f235a994 | Progress: resolved 141, reused 140, downloaded 1, added 4, done
.../v11/1e2-1a0510e8f87-370fe97d8f82c1bf | Progress: resolved 1, reused 0, downloaded 0, added 0
.../v11/1e2-1a0510e8f87-370fe97d8f82c1bf |   +2 +
.../v11/1e2-1a0510e8f87-370fe97d8f82c1bf | Progress: resolved 13, reused 2, downloaded 0, added 0, done
.../v11/1e2-1a0510e98c9-db1610ea21f39a15 | Progress: resolved 1, reused 0, downloaded 0, added 0
.../v11/1e2-1a0510e98c9-db1610ea21f39a15 |  +18 ++
.../v11/1e2-1a0510e98c9-db1610ea21f39a15 | Progress: resolved 18, reused 18, downloaded 0, added 0, done
.../v11/1e2-1a0510e99d0-0e71ee38be0e160c | Progress: resolved 1, reused 0, downloaded 0, added 0
.../v11/1e2-1a0510e99d0-0e71ee38be0e160c |  +30 +++
.../v11/1e2-1a0510e99d0-0e71ee38be0e160c | Progress: resolved 30, reused 30, downloaded 0, added 0, done
.../v11/1e2-1a0510e9b16-9063b165f7807a59 | Progress: resolved 1, reused 0, downloaded 0, added 0
.../v11/1e2-1a0510e9b16-9063b165f7807a59 |   +1 +
.../v11/1e2-1a0510e9b16-9063b165f7807a59 | Progress: resolved 1, reused 1, downloaded 0, added 0, done

global:
+ @openai/codex 0.150.1
+ amazon-buddy 2.2.45
+ bun 1.4.0
+ js-beautify 2.0.3
+ neovim 5.4.0
+ vim-language-server 2.3.1

Done in 5.4s using pnpm v11.24.0

Upgrading pnpm itself...
Installing pnpm@11.24.0 in the project...

Already up to date
Done in 602ms using pnpm v11.24.0
  packageManager: pnpm@11.24.0+sha512.bd27e345e976dcb0be0b7a1228217b049a817e21b1f355c90dbe7dc46671895a8bc1e6d06c24554505ea93ea0b45f489a27ec1bfbc8de6a9659fca0f16fa0000

Checking...
[WARN] Using --global skips the package manager check for this project
  ok
--
2026-08-31T00:05:01,978870160-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

[WARN] Using --global skips the package manager check for this project
.../59f4-1a05634e7fa-029f687a51ddd8e1    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../59f4-1a05634e7fa-029f687a51ddd8e1    | Progress: resolved 7, reused 0, downloaded 1, added 0
.../59f4-1a05634e7fa-029f687a51ddd8e1    |   +2 +
Packages are cloned from the content-addressable store to the virtual store.
  Content-addressable store is at: /home/bukzor/.local/share/pnpm/store/v11
  Virtual store is at:             .local/share/pnpm/store/v11/links
.../59f4-1a05634e7fa-029f687a51ddd8e1    | Progress: resolved 7, reused 0, downloaded 1, added 1
.../59f4-1a05634e7fa-029f687a51ddd8e1    | Progress: resolved 7, reused 0, downloaded 2, added 1
.../59f4-1a05634e7fa-029f687a51ddd8e1    | Progress: resolved 7, reused 0, downloaded 2, added 2, done
.../59f4-1a056351cdc-8d09340bbea0563a    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../59f4-1a056351cdc-8d09340bbea0563a    | Progress: resolved 76, reused 76, downloaded 0, added 0
[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../59f4-1a056351cdc-8d09340bbea0563a    | +141 ++++++++++++++
.../59f4-1a056351cdc-8d09340bbea0563a    | Progress: resolved 141, reused 141, downloaded 0, added 0, done
.../59f4-1a05635255a-0753d5b55fa2f3b3    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../59f4-1a05635255a-0753d5b55fa2f3b3    |   +2 +
.../59f4-1a05635255a-0753d5b55fa2f3b3    | Progress: resolved 13, reused 2, downloaded 0, added 0, done
.../59f4-1a056353110-5773b9be698a020d    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../59f4-1a056353110-5773b9be698a020d    |  +18 ++
.../59f4-1a056353110-5773b9be698a020d    | Progress: resolved 18, reused 18, downloaded 0, added 0, done
.../59f4-1a0563532bc-3d235387e5e11a5d    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../59f4-1a0563532bc-3d235387e5e11a5d    |  +30 +++
.../59f4-1a0563532bc-3d235387e5e11a5d    | Progress: resolved 30, reused 30, downloaded 0, added 0, done
.../59f4-1a0563534cb-076b3ed1ebe27255    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../59f4-1a0563534cb-076b3ed1ebe27255    |   +1 +
.../59f4-1a0563534cb-076b3ed1ebe27255    | Progress: resolved 1, reused 1, downloaded 0, added 0, done

global:
+ @openai/codex 0.151.0
+ amazon-buddy 2.2.45
+ bun 1.4.0
+ js-beautify 2.0.3
+ neovim 5.4.0
+ vim-language-server 2.3.1

Done in 20.8s using pnpm v11.24.0

Upgrading pnpm itself...
Installing pnpm@11.24.0 in the project...

Already up to date
Done in 887ms using pnpm v11.24.0
  packageManager: pnpm@11.24.0+sha512.bd27e345e976dcb0be0b7a1228217b049a817e21b1f355c90dbe7dc46671895a8bc1e6d06c24554505ea93ea0b45f489a27ec1bfbc8de6a9659fca0f16fa0000

Checking...
[WARN] Using --global skips the package manager check for this project
  ok
--
2026-09-01T00:05:02,221581867-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

[WARN] Using --global skips the package manager check for this project
.../5228-1a05b5b4576-9f6de61eb878505f    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../5228-1a05b5b4576-9f6de61eb878505f    |   +2 +
.../5228-1a05b5b4576-9f6de61eb878505f    | Progress: resolved 7, reused 2, downloaded 0, added 0, done
.../5228-1a05b5b4a36-d2c80a09c1aa1746    | Progress: resolved 1, reused 0, downloaded 0, added 0
[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../5228-1a05b5b4a36-d2c80a09c1aa1746    | +141 ++++++++++++++
.../5228-1a05b5b4a36-d2c80a09c1aa1746    | Progress: resolved 141, reused 141, downloaded 0, added 0, done
.../5228-1a05b5b4d2e-f391e8a14a23cddf    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../5228-1a05b5b4d2e-f391e8a14a23cddf    |   +2 +
.../5228-1a05b5b4d2e-f391e8a14a23cddf    | Progress: resolved 13, reused 2, downloaded 0, added 0, done
.../5228-1a05b5b583d-b4135d3c87ff023b    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../5228-1a05b5b583d-b4135d3c87ff023b    |  +18 ++
.../5228-1a05b5b583d-b4135d3c87ff023b    | Progress: resolved 18, reused 18, downloaded 0, added 0, done
.../5228-1a05b5b58bf-24d373ad0c43a165    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../5228-1a05b5b58bf-24d373ad0c43a165    |  +30 +++
.../5228-1a05b5b58bf-24d373ad0c43a165    | Progress: resolved 30, reused 30, downloaded 0, added 0, done
.../5228-1a05b5b5940-f525e4c4fed77f36    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../5228-1a05b5b5940-f525e4c4fed77f36    |   +1 +
.../5228-1a05b5b5940-f525e4c4fed77f36    | Progress: resolved 1, reused 1, downloaded 0, added 0, done

global:
+ @openai/codex 0.151.0
+ amazon-buddy 2.2.45
+ bun 1.4.0
+ js-beautify 2.0.3
+ neovim 5.4.0
+ vim-language-server 2.3.1

Done in 5.9s using pnpm v11.24.0

Upgrading pnpm itself...
Installing pnpm@11.25.0 in the project...

Already up to date
Done in 890ms using pnpm v11.25.0
  packageManager: pnpm@11.25.0+sha512.5cde925b4f075f725eb71fbae18a42ffe784524789f19b61c731cb8721ec28aaee160e01a8d5af4fedb2a42cdbf300efe23db356b0d4a17b4d63e11f8ab7c956

Checking...
[WARN] Using --global skips the package manager check for this project
  ok
--
2026-09-02T00:05:01,854331989-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

[WARN] Using --global skips the package manager check for this project
.../6fab-1a06081a035-fab6c91dce8d3cb2    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../6fab-1a06081a035-fab6c91dce8d3cb2    | Progress: resolved 1, reused 0, downloaded 1, added 0
.../6fab-1a06081a035-fab6c91dce8d3cb2    |   +2 +
Packages are cloned from the content-addressable store to the virtual store.
  Content-addressable store is at: /home/bukzor/.local/share/pnpm/store/v11
  Virtual store is at:             .local/share/pnpm/store/v11/links
.../6fab-1a06081a035-fab6c91dce8d3cb2    | Progress: resolved 7, reused 0, downloaded 1, added 1
.../6fab-1a06081a035-fab6c91dce8d3cb2    | Progress: resolved 7, reused 0, downloaded 2, added 1
.../6fab-1a06081a035-fab6c91dce8d3cb2    | Progress: resolved 7, reused 0, downloaded 2, added 2, done
.../6fab-1a06081d629-68c340bbbcc9c04a    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../6fab-1a06081d629-68c340bbbcc9c04a    | Progress: resolved 76, reused 76, downloaded 0, added 0
[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../6fab-1a06081d629-68c340bbbcc9c04a    | +141 ++++++++++++++
.../6fab-1a06081d629-68c340bbbcc9c04a    | Progress: resolved 141, reused 141, downloaded 0, added 0, done
.../6fab-1a06081de88-be3001f095ae2e67    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../6fab-1a06081de88-be3001f095ae2e67    |   +2 +
.../6fab-1a06081de88-be3001f095ae2e67    | Progress: resolved 13, reused 2, downloaded 0, added 0, done
.../6fab-1a06081edf9-b6c824802a53e8b4    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../6fab-1a06081edf9-b6c824802a53e8b4    |  +18 ++
.../6fab-1a06081edf9-b6c824802a53e8b4    | Progress: resolved 18, reused 18, downloaded 0, added 0, done
.../6fab-1a06081ef84-53ba4888bbbbde5a    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../6fab-1a06081ef84-53ba4888bbbbde5a    |  +30 +++
.../6fab-1a06081ef84-53ba4888bbbbde5a    | Progress: resolved 30, reused 30, downloaded 0, added 0, done
.../6fab-1a06081f27a-da944af6d2d1775d    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../6fab-1a06081f27a-da944af6d2d1775d    |   +1 +
.../6fab-1a06081f27a-da944af6d2d1775d    | Progress: resolved 1, reused 1, downloaded 0, added 0, done

global:
+ @openai/codex 0.152.0
+ amazon-buddy 2.2.45
+ bun 1.4.0
+ js-beautify 2.0.3
+ neovim 5.4.0
+ vim-language-server 2.3.1

Done in 22.2s using pnpm v11.25.0

Upgrading pnpm itself...
Installing pnpm@11.25.0 in the project...

Already up to date
Done in 691ms using pnpm v11.25.0
  packageManager: pnpm@11.25.0+sha512.5cde925b4f075f725eb71fbae18a42ffe784524789f19b61c731cb8721ec28aaee160e01a8d5af4fedb2a42cdbf300efe23db356b0d4a17b4d63e11f8ab7c956

Checking...
[WARN] Using --global skips the package manager check for this project
  ok
--
2026-09-03T00:05:01,847846233-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

[WARN] Using --global skips the package manager check for this project
.../3c40-1a065a7fb99-4e8e15104747bb53    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../3c40-1a065a7fb99-4e8e15104747bb53    |   +2 +
Packages are cloned from the content-addressable store to the virtual store.
  Content-addressable store is at: /home/bukzor/.local/share/pnpm/store/v11
  Virtual store is at:             .local/share/pnpm/store/v11/links
.../3c40-1a065a7fb99-4e8e15104747bb53    | Progress: resolved 7, reused 0, downloaded 1, added 1
.../3c40-1a065a7fb99-4e8e15104747bb53    | Progress: resolved 7, reused 0, downloaded 2, added 1
.../3c40-1a065a7fb99-4e8e15104747bb53    | Progress: resolved 7, reused 0, downloaded 2, added 2, done
.../3c40-1a065a82bec-2b98364c10451aa0    | Progress: resolved 1, reused 0, downloaded 0, added 0
[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../3c40-1a065a82bec-2b98364c10451aa0    | +141 ++++++++++++++
.../3c40-1a065a82bec-2b98364c10451aa0    | Progress: resolved 141, reused 141, downloaded 0, added 0, done
.../3c40-1a065a82ea1-f00e6a5265e7648a    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../3c40-1a065a82ea1-f00e6a5265e7648a    |   +2 +
.../3c40-1a065a82ea1-f00e6a5265e7648a    | Progress: resolved 13, reused 2, downloaded 0, added 0, done
.../3c40-1a065a838e0-1e32d53e6659d940    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../3c40-1a065a838e0-1e32d53e6659d940    |  +18 ++
.../3c40-1a065a838e0-1e32d53e6659d940    | Progress: resolved 18, reused 18, downloaded 0, added 0, done
.../3c40-1a065a83a9d-b635046f64892ddc    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../3c40-1a065a83a9d-b635046f64892ddc    |  +30 +++
.../3c40-1a065a83a9d-b635046f64892ddc    | Progress: resolved 30, reused 30, downloaded 0, added 0, done
.../3c40-1a065a83c33-16b36ad61d9ae680    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../3c40-1a065a83c33-16b36ad61d9ae680    |   +1 +
.../3c40-1a065a83c33-16b36ad61d9ae680    | Progress: resolved 1, reused 1, downloaded 0, added 0, done

global:
+ @openai/codex 0.152.1
+ amazon-buddy 2.2.45
+ bun 1.4.0
+ js-beautify 2.0.3
+ neovim 5.4.0
+ vim-language-server 2.3.1

Done in 17.4s using pnpm v11.25.0

Upgrading pnpm itself...
Installing pnpm@11.25.0 in the project...

Already up to date
Done in 956ms using pnpm v11.25.0
  packageManager: pnpm@11.25.0+sha512.5cde925b4f075f725eb71fbae18a42ffe784524789f19b61c731cb8721ec28aaee160e01a8d5af4fedb2a42cdbf300efe23db356b0d4a17b4d63e11f8ab7c956

Checking...
[WARN] Using --global skips the package manager check for this project
  ok
--
2026-09-04T00:05:01,357113835-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

[WARN] Using --global skips the package manager check for this project
.../184f-1a06ace5549-c7afd026f42ff63a    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../184f-1a06ace5549-c7afd026f42ff63a    | Progress: resolved 1, reused 0, downloaded 1, added 0
.../184f-1a06ace5549-c7afd026f42ff63a    |   +2 +
Packages are cloned from the content-addressable store to the virtual store.
  Content-addressable store is at: /home/bukzor/.local/share/pnpm/store/v11
  Virtual store is at:             .local/share/pnpm/store/v11/links
.../184f-1a06ace5549-c7afd026f42ff63a    | Progress: resolved 7, reused 0, downloaded 1, added 1
.../184f-1a06ace5549-c7afd026f42ff63a    | Progress: resolved 7, reused 0, downloaded 2, added 1
.../184f-1a06ace5549-c7afd026f42ff63a    | Progress: resolved 7, reused 0, downloaded 2, added 2, done
.../184f-1a06ace954f-dd566cc795419945    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../184f-1a06ace954f-dd566cc795419945    | Progress: resolved 112, reused 110, downloaded 1, added 0
[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../184f-1a06ace954f-dd566cc795419945    | +141 ++++++++++++++
.../184f-1a06ace954f-dd566cc795419945    | Progress: resolved 141, reused 140, downloaded 1, added 3, done
.../184f-1a06ace9cbe-b18d9f91cd3b724e    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../184f-1a06ace9cbe-b18d9f91cd3b724e    |   +2 +
.../184f-1a06ace9cbe-b18d9f91cd3b724e    | Progress: resolved 13, reused 2, downloaded 0, added 0, done
.../184f-1a06acea90c-3780b2c3e27f40d4    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../184f-1a06acea90c-3780b2c3e27f40d4    |  +18 ++
.../184f-1a06acea90c-3780b2c3e27f40d4    | Progress: resolved 18, reused 18, downloaded 0, added 0, done
.../184f-1a06aceac3e-6f3fde8a88f598c9    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../184f-1a06aceac3e-6f3fde8a88f598c9    |  +30 +++
.../184f-1a06aceac3e-6f3fde8a88f598c9    | Progress: resolved 30, reused 30, downloaded 0, added 0, done
.../184f-1a06aceaf0c-65fa770c05f891c2    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../184f-1a06aceaf0c-65fa770c05f891c2    |   +1 +
.../184f-1a06aceaf0c-65fa770c05f891c2    | Progress: resolved 1, reused 1, downloaded 0, added 0, done

global:
+ @openai/codex 0.153.0
+ amazon-buddy 2.2.45
+ bun 1.4.0
+ js-beautify 2.0.3
+ neovim 5.4.0
+ vim-language-server 2.3.1

Done in 24s using pnpm v11.25.0

Upgrading pnpm itself...
Installing pnpm@11.25.0 in the project...

Already up to date
Done in 688ms using pnpm v11.25.0
  packageManager: pnpm@11.25.0+sha512.5cde925b4f075f725eb71fbae18a42ffe784524789f19b61c731cb8721ec28aaee160e01a8d5af4fedb2a42cdbf300efe23db356b0d4a17b4d63e11f8ab7c956

Checking...
[WARN] Using --global skips the package manager check for this project
  ok
--
2026-09-05T00:05:01,725729008-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

[WARN] Using --global skips the package manager check for this project
.../4018-1a06ff4b388-d61079d901d31f43    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../4018-1a06ff4b388-d61079d901d31f43    |   +2 +
Packages are cloned from the content-addressable store to the virtual store.
  Content-addressable store is at: /home/bukzor/.local/share/pnpm/store/v11
  Virtual store is at:             .local/share/pnpm/store/v11/links
.../4018-1a06ff4b388-d61079d901d31f43    | Progress: resolved 7, reused 0, downloaded 1, added 1
.../4018-1a06ff4b388-d61079d901d31f43    | Progress: resolved 7, reused 0, downloaded 2, added 1
.../4018-1a06ff4b388-d61079d901d31f43    | Progress: resolved 7, reused 0, downloaded 2, added 2, done
.../4018-1a06ff4e51f-61068d27dd84af9d    | Progress: resolved 1, reused 0, downloaded 0, added 0
[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../4018-1a06ff4e51f-61068d27dd84af9d    | +141 ++++++++++++++
.../4018-1a06ff4e51f-61068d27dd84af9d    | Progress: resolved 141, reused 141, downloaded 0, added 0, done
.../4018-1a06ff4e80f-e3f08d2e14aa456c    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../4018-1a06ff4e80f-e3f08d2e14aa456c    |   +2 +
.../4018-1a06ff4e80f-e3f08d2e14aa456c    | Progress: resolved 13, reused 2, downloaded 0, added 0, done
.../4018-1a06ff4f350-4df0f134bf4ec4f3    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../4018-1a06ff4f350-4df0f134bf4ec4f3    |  +18 ++
.../4018-1a06ff4f350-4df0f134bf4ec4f3    | Progress: resolved 18, reused 18, downloaded 0, added 0, done
.../4018-1a06ff4f3f3-b19e82bc8026c2d3    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../4018-1a06ff4f3f3-b19e82bc8026c2d3    |  +30 +++
.../4018-1a06ff4f3f3-b19e82bc8026c2d3    | Progress: resolved 30, reused 30, downloaded 0, added 0, done
.../4018-1a06ff4f460-69dfa1247cc03089    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../4018-1a06ff4f460-69dfa1247cc03089    |   +1 +
.../4018-1a06ff4f460-69dfa1247cc03089    | Progress: resolved 1, reused 1, downloaded 0, added 0, done

global:
+ @openai/codex 0.153.2
+ amazon-buddy 2.2.45
+ bun 1.4.0
+ js-beautify 2.0.3
+ neovim 5.4.0
+ vim-language-server 2.3.1

Done in 17.5s using pnpm v11.25.0

Upgrading pnpm itself...
Installing pnpm@11.25.0 in the project...

Already up to date
Done in 1s using pnpm v11.25.0
  packageManager: pnpm@11.25.0+sha512.5cde925b4f075f725eb71fbae18a42ffe784524789f19b61c731cb8721ec28aaee160e01a8d5af4fedb2a42cdbf300efe23db356b0d4a17b4d63e11f8ab7c956

Checking...
[WARN] Using --global skips the package manager check for this project
  ok
--
2026-09-06T00:05:02,217106709-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

[WARN] Using --global skips the package manager check for this project

   ╭──────────────────────────────────────────────────────────────────────╮
   │                                                                      │
   │                 Update available! 11.25.0 → 12.3.4.                  │
   │                 Changelog: https://pnpm.io/v/12.3.4                  │
   │   To update, run: curl -fsSL https://get.pnpm.io/install.sh | sh -   │
   │                                                                      │
   ╰──────────────────────────────────────────────────────────────────────╯

.../5c84-1a0751b10e8-3be829501e937ca6    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../5c84-1a0751b10e8-3be829501e937ca6    | Progress: resolved 1, reused 0, downloaded 1, added 0
.../5c84-1a0751b10e8-3be829501e937ca6    |   +2 +
Packages are cloned from the content-addressable store to the virtual store.
  Content-addressable store is at: /home/bukzor/.local/share/pnpm/store/v11
  Virtual store is at:             .local/share/pnpm/store/v11/links
.../5c84-1a0751b10e8-3be829501e937ca6    | Progress: resolved 7, reused 0, downloaded 1, added 1
.../5c84-1a0751b10e8-3be829501e937ca6    | Progress: resolved 7, reused 0, downloaded 2, added 1
.../5c84-1a0751b10e8-3be829501e937ca6    | Progress: resolved 7, reused 0, downloaded 2, added 2, done
.../5c84-1a0751b4c90-3d5c3068b3935158    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../5c84-1a0751b4c90-3d5c3068b3935158    | Progress: resolved 112, reused 110, downloaded 1, added 0
[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../5c84-1a0751b4c90-3d5c3068b3935158    | +141 ++++++++++++++
.../5c84-1a0751b4c90-3d5c3068b3935158    | Progress: resolved 141, reused 140, downloaded 1, added 3, done
.../5c84-1a0751b5474-67988f74cfca1f3b    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../5c84-1a0751b5474-67988f74cfca1f3b    |   +2 +
.../5c84-1a0751b5474-67988f74cfca1f3b    | Progress: resolved 13, reused 0, downloaded 1, added 1
.../5c84-1a0751b5474-67988f74cfca1f3b    | Progress: resolved 13, reused 0, downloaded 2, added 1
.../5c84-1a0751b5474-67988f74cfca1f3b    | Progress: resolved 13, reused 0, downloaded 2, added 2, done
.../node_modules/bun postinstall$ node install.js
.../node_modules/bun postinstall: Done
.../5c84-1a0751b72fe-4bbe7ccb0b7613a5    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../5c84-1a0751b72fe-4bbe7ccb0b7613a5    |  +18 ++
.../5c84-1a0751b72fe-4bbe7ccb0b7613a5    | Progress: resolved 18, reused 18, downloaded 0, added 0, done
.../5c84-1a0751b74bd-fc3a541761e5b5f9    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../5c84-1a0751b74bd-fc3a541761e5b5f9    |  +30 +++
.../5c84-1a0751b74bd-fc3a541761e5b5f9    | Progress: resolved 30, reused 30, downloaded 0, added 0, done
.../5c84-1a0751b7889-6a3080bb079dc173    | Progress: resolved 1, reused 0, downloaded 0, added 0
.../5c84-1a0751b7889-6a3080bb079dc173    |   +1 +
.../5c84-1a0751b7889-6a3080bb079dc173    | Progress: resolved 1, reused 1, downloaded 0, added 0, done

global:
+ @openai/codex 0.153.4
+ amazon-buddy 2.2.45
+ bun 1.4.1
+ js-beautify 2.0.3
+ neovim 5.4.0
+ vim-language-server 2.3.1

Done in 27.6s using pnpm v11.25.0

Upgrading pnpm itself...
Installing pnpm@12.3.4 in the project...

node:internal/modules/cjs/loader:1386
  throw err;
  ^

Error: Cannot find module '/home/bukzor/.cache/node/corepack/v1/pnpm/12.3.4/bin/pnpm.cjs'
    at Function._resolveFilename (node:internal/modules/cjs/loader:1383:15)
    at defaultResolveImpl (node:internal/modules/cjs/loader:1025:19)
    at resolveForCJSWithHooks (node:internal/modules/cjs/loader:1030:22)
    at Function._load (node:internal/modules/cjs/loader:1192:37)
    at TracingChannel.traceSync (node:diagnostics_channel:328:14)
    at wrapModuleLoad (node:internal/modules/cjs/loader:237:24)
    at executeUserEntryPoint (node:internal/modules/run_main:171:5)
    at process.processTicksAndRejections (node:internal/process/task_queues:89:21) {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

Node.js v22.21.1
ERROR(1)
--
2026-09-07T00:05:02,334508130-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

node:internal/modules/cjs/loader:1386
  throw err;
  ^

Error: Cannot find module '/home/bukzor/.cache/node/corepack/v1/pnpm/12.3.4/bin/pnpm.cjs'
    at Function._resolveFilename (node:internal/modules/cjs/loader:1383:15)
    at defaultResolveImpl (node:internal/modules/cjs/loader:1025:19)
    at resolveForCJSWithHooks (node:internal/modules/cjs/loader:1030:22)
    at Function._load (node:internal/modules/cjs/loader:1192:37)
    at TracingChannel.traceSync (node:diagnostics_channel:328:14)
    at wrapModuleLoad (node:internal/modules/cjs/loader:237:24)
    at executeUserEntryPoint (node:internal/modules/run_main:171:5)
    at process.processTicksAndRejections (node:internal/process/task_queues:89:21) {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

Node.js v22.21.1
ERROR(1)
--
2026-09-08T00:05:02,245997307-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

node:internal/modules/cjs/loader:1386
  throw err;
  ^

Error: Cannot find module '/home/bukzor/.cache/node/corepack/v1/pnpm/12.3.4/bin/pnpm.cjs'
    at Function._resolveFilename (node:internal/modules/cjs/loader:1383:15)
    at defaultResolveImpl (node:internal/modules/cjs/loader:1025:19)
    at resolveForCJSWithHooks (node:internal/modules/cjs/loader:1030:22)
    at Function._load (node:internal/modules/cjs/loader:1192:37)
    at TracingChannel.traceSync (node:diagnostics_channel:328:14)
    at wrapModuleLoad (node:internal/modules/cjs/loader:237:24)
    at executeUserEntryPoint (node:internal/modules/run_main:171:5)
    at process.processTicksAndRejections (node:internal/process/task_queues:89:21) {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

Node.js v22.21.1
ERROR(1)
--
2026-09-09T00:05:02,233903547-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

node:internal/modules/cjs/loader:1386
  throw err;
  ^

Error: Cannot find module '/home/bukzor/.cache/node/corepack/v1/pnpm/12.3.4/bin/pnpm.cjs'
    at Function._resolveFilename (node:internal/modules/cjs/loader:1383:15)
    at defaultResolveImpl (node:internal/modules/cjs/loader:1025:19)
    at resolveForCJSWithHooks (node:internal/modules/cjs/loader:1030:22)
    at Function._load (node:internal/modules/cjs/loader:1192:37)
    at TracingChannel.traceSync (node:diagnostics_channel:328:14)
    at wrapModuleLoad (node:internal/modules/cjs/loader:237:24)
    at executeUserEntryPoint (node:internal/modules/run_main:171:5)
    at process.processTicksAndRejections (node:internal/process/task_queues:89:21) {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

Node.js v22.21.1
ERROR(1)
--
2026-09-10T09:05:01,616510966-05:00
Upgrading 6 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

node:internal/modules/cjs/loader:1386
  throw err;
  ^

Error: Cannot find module '/home/bukzor/.cache/node/corepack/v1/pnpm/12.3.4/bin/pnpm.cjs'
    at Function._resolveFilename (node:internal/modules/cjs/loader:1383:15)
    at defaultResolveImpl (node:internal/modules/cjs/loader:1025:19)
    at resolveForCJSWithHooks (node:internal/modules/cjs/loader:1030:22)
    at Function._load (node:internal/modules/cjs/loader:1192:37)
    at TracingChannel.traceSync (node:diagnostics_channel:328:14)
    at wrapModuleLoad (node:internal/modules/cjs/loader:237:24)
    at executeUserEntryPoint (node:internal/modules/run_main:171:5)
    at process.processTicksAndRejections (node:internal/process/task_queues:89:21) {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

Node.js v22.21.1
ERROR(1)
--
2026-09-11T00:05:01,700763311-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  corepack@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

[WARN] Using --global skips the package manager check for this project
Packages are hard linked from the content-addressable store to the virtual store.
  Content-addressable store is at: /home/bukzor/.local/share/pnpm/store/v11
  Virtual store is at:             prefix/pnpm/global/v11/40e1-18d42bcac268b525-0/node_modules/.pnpm
Downloading @openai/codex@0.154.0-linux-x64: 0.00 B/129.65 MB
Downloading @openai/codex@0.154.0-linux-x64: 11.76 MB/129.65 MB
Downloading @openai/codex@0.154.0-linux-x64: 18.99 MB/129.65 MB
Downloading @openai/codex@0.154.0-linux-x64: 32.30 MB/129.65 MB
Downloading @openai/codex@0.154.0-linux-x64: 46.81 MB/129.65 MB
Downloading @openai/codex@0.154.0-linux-x64: 61.29 MB/129.65 MB
Downloading @openai/codex@0.154.0-linux-x64: 75.18 MB/129.65 MB
Downloading @openai/codex@0.154.0-linux-x64: 89.84 MB/129.65 MB
Downloading @openai/codex@0.154.0-linux-x64: 105.21 MB/129.65 MB
Downloading @openai/codex@0.154.0-linux-x64: 120.31 MB/129.65 MB
.../global/v11/40e1-18d42bcac268b525-0   | Progress: resolved 2, reused 0, downloaded 2, added 2, done

dependencies:
+ @openai/codex 0.154.0

[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../global/v11/40e1-18d42bcd4b6800ec-1   | Progress: resolved 141, reused 142, downloaded 0, added 141, done
.../global/v11/40e1-18d42bcd64bf343c-2   | Progress: resolved 1, reused 1, downloaded 0, added 1, done
.../global/v11/40e1-18d42bcd8c056f48-3   | Progress: resolved 1, reused 1, downloaded 0, added 1, done
.../global/v11/40e1-18d42bcd8e76795c-4   | Progress: resolved 18, reused 18, downloaded 0, added 18, done
.../global/v11/40e1-18d42bcd92f5619b-5   | Progress: resolved 31, reused 31, downloaded 0, added 31, done
.../global/v11/40e1-18d42bcd981c7457-6   | Progress: resolved 1, reused 1, downloaded 0, added 1, done
Done in 12.2s using pnpm v12.3.4

Upgrading pnpm itself...
Installing pnpm@12.3.4 in the project...

Already up to date
Done in 8ms using pnpm v12.3.4
  packageManager: pnpm@12.3.4+sha512.961aa41fb077da3a04a441d9f8e15ebc0c96da8ef710b2eb67bf9ee7cb0610eabd48f1fd85f51cffe73846785fa0f87c56a3a872a1d893f8446741b5cce45457

Checking...
[WARN] Using --global skips the package manager check for this project
  ok
--
2026-09-12T00:05:02,231990366-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  corepack@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

[WARN] Using --global skips the package manager check for this project
Update available! 12.3.4 → 12.4.1.
Changelog: https://pnpm.io/v/12.4.1
To update, run: curl -fsSL https://get.pnpm.io/install.sh | sh -
Packages are hard linked from the content-addressable store to the virtual store.
  Content-addressable store is at: /home/bukzor/.local/share/pnpm/store/v11
  Virtual store is at:             prefix/pnpm/global/v11/266b-18d47a5f78675266-0/node_modules/.pnpm
.../global/v11/266b-18d47a5f78675266-0   | Progress: resolved 2, reused 2, downloaded 0, added 2, done

dependencies:
+ @openai/codex 0.154.0

[WARN] 7 deprecated subdependencies found: har-validator@5.1.5, json2csv@4.5.4, lodash.get@4.4.2, request-promise@4.2.6, request@2.88.2, uuid@3.4.0, whatwg-encoding@3.1.1
.../global/v11/266b-18d47a5fb9580d0e-1   | Progress: resolved 141, reused 142, downloaded 0, added 141, done
.../global/v11/266b-18d47a5ff9229e0d-2   | Progress: resolved 1, reused 1, downloaded 0, added 1, done
.../global/v11/266b-18d47a601bb4dbe8-3   | Progress: resolved 1, reused 1, downloaded 0, added 1, done
.../global/v11/266b-18d47a6026553c00-4   | Progress: resolved 18, reused 18, downloaded 0, added 18, done
.../global/v11/266b-18d47a603cec509a-5   | Progress: resolved 31, reused 31, downloaded 0, added 31, done
.../global/v11/266b-18d47a606d900046-6   | Progress: resolved 1, reused 1, downloaded 0, added 1, done
Done in 4.5s using pnpm v12.3.4

Upgrading pnpm itself...
Installing pnpm@12.4.1 in the project...

node:internal/modules/cjs/loader:1386
  throw err;
  ^

Error: Cannot find module '/home/bukzor/.cache/node/corepack/v1/pnpm/12.4.1/bin/pnpm.cjs'
    at Function._resolveFilename (node:internal/modules/cjs/loader:1383:15)
    at defaultResolveImpl (node:internal/modules/cjs/loader:1025:19)
    at resolveForCJSWithHooks (node:internal/modules/cjs/loader:1030:22)
    at Function._load (node:internal/modules/cjs/loader:1192:37)
    at TracingChannel.traceSync (node:diagnostics_channel:328:14)
    at wrapModuleLoad (node:internal/modules/cjs/loader:237:24)
    at executeUserEntryPoint (node:internal/modules/run_main:171:5)
    at process.processTicksAndRejections (node:internal/process/task_queues:89:21) {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

Node.js v22.21.1
ERROR(1)
--
2026-09-13T00:05:01,309704616-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  corepack@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

node:internal/modules/cjs/loader:1386
  throw err;
  ^

Error: Cannot find module '/home/bukzor/.cache/node/corepack/v1/pnpm/12.4.1/bin/pnpm.cjs'
    at Function._resolveFilename (node:internal/modules/cjs/loader:1383:15)
    at defaultResolveImpl (node:internal/modules/cjs/loader:1025:19)
    at resolveForCJSWithHooks (node:internal/modules/cjs/loader:1030:22)
    at Function._load (node:internal/modules/cjs/loader:1192:37)
    at TracingChannel.traceSync (node:diagnostics_channel:328:14)
    at wrapModuleLoad (node:internal/modules/cjs/loader:237:24)
    at executeUserEntryPoint (node:internal/modules/run_main:171:5)
    at process.processTicksAndRejections (node:internal/process/task_queues:89:21) {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

Node.js v22.21.1
ERROR(1)
--
2026-09-14T00:05:01,534155751-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  corepack@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

node:internal/modules/cjs/loader:1386
  throw err;
  ^

Error: Cannot find module '/home/bukzor/.cache/node/corepack/v1/pnpm/12.4.1/bin/pnpm.cjs'
    at Function._resolveFilename (node:internal/modules/cjs/loader:1383:15)
    at defaultResolveImpl (node:internal/modules/cjs/loader:1025:19)
    at resolveForCJSWithHooks (node:internal/modules/cjs/loader:1030:22)
    at Function._load (node:internal/modules/cjs/loader:1192:37)
    at TracingChannel.traceSync (node:diagnostics_channel:328:14)
    at wrapModuleLoad (node:internal/modules/cjs/loader:237:24)
    at executeUserEntryPoint (node:internal/modules/run_main:171:5)
    at process.processTicksAndRejections (node:internal/process/task_queues:89:21) {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

Node.js v22.21.1
ERROR(1)
--
2026-09-15T00:05:01,536805001-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  corepack@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

node:internal/modules/cjs/loader:1386
  throw err;
  ^

Error: Cannot find module '/home/bukzor/.cache/node/corepack/v1/pnpm/12.4.1/bin/pnpm.cjs'
    at Function._resolveFilename (node:internal/modules/cjs/loader:1383:15)
    at defaultResolveImpl (node:internal/modules/cjs/loader:1025:19)
    at resolveForCJSWithHooks (node:internal/modules/cjs/loader:1030:22)
    at Function._load (node:internal/modules/cjs/loader:1192:37)
    at TracingChannel.traceSync (node:diagnostics_channel:328:14)
    at wrapModuleLoad (node:internal/modules/cjs/loader:237:24)
    at executeUserEntryPoint (node:internal/modules/run_main:171:5)
    at process.processTicksAndRejections (node:internal/process/task_queues:89:21) {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

Node.js v22.21.1
ERROR(1)
--
2026-09-16T00:05:01,658371549-05:00
Upgrading 7 global packages:
  @openai/codex@latest
  amazon-buddy@latest
  bun@latest
  corepack@latest
  js-beautify@latest
  neovim@latest
  vim-language-server@latest

node:internal/modules/cjs/loader:1386
  throw err;
  ^

Error: Cannot find module '/home/bukzor/.cache/node/corepack/v1/pnpm/12.4.1/bin/pnpm.cjs'
    at Function._resolveFilename (node:internal/modules/cjs/loader:1383:15)
    at defaultResolveImpl (node:internal/modules/cjs/loader:1025:19)
    at resolveForCJSWithHooks (node:internal/modules/cjs/loader:1030:22)
    at Function._load (node:internal/modules/cjs/loader:1192:37)
    at TracingChannel.traceSync (node:diagnostics_channel:328:14)
    at wrapModuleLoad (node:internal/modules/cjs/loader:237:24)
    at executeUserEntryPoint (node:internal/modules/run_main:171:5)
    at process.processTicksAndRejections (node:internal/process/task_queues:89:21) {
  code: 'MODULE_NOT_FOUND',
  requireStack: []
}

Node.js v22.21.1
ERROR(1)
```
