---
captured: "2026-09-17"
method: ./2026-09-17-003-post-remediation-verification-fixed-corepack-resolves-pnpm-12-4-1-cron-path-picks-it-directly.sh
---

# Post-remediation verification: fixed corepack resolves pnpm 12.4.1, cron PATH picks it directly

```sh
'bash' '-c' 'echo "== corepack pnpm@12.4.1 --version ==" && /home/bukzor/prefix/pnpm/bin/corepack pnpm@12.4.1 --version; echo "== cron-simulated corepack resolution =="; /bin/sh -c ". /home/bukzor/.profile; command -v corepack"'
```

```
== corepack pnpm@12.4.1 --version ==
12.4.1
== cron-simulated corepack resolution ==
/home/bukzor/prefix/pnpm/bin/corepack
```
