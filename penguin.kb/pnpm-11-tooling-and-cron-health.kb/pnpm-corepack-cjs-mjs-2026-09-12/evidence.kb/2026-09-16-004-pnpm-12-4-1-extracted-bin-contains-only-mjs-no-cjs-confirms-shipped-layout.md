---
captured: "2026-09-16"
method: ./2026-09-16-004-pnpm-12-4-1-extracted-bin-contains-only-mjs-no-cjs-confirms-shipped-layout.sh
---

# pnpm 12.4.1 extracted bin/ contains only .mjs (no .cjs) -- confirms shipped layout

```sh
'bash' '-c' 'ls -la /home/bukzor/.cache/node/corepack/v1/pnpm/12.4.1/bin/ /home/bukzor/.cache/node/corepack/v1/pnpm/12.4.1/pnpm 2>&1'
```

```
-rwxr-xr-x 1 bukzor bukzor 1643 Oct 26  1985 /home/bukzor/.cache/node/corepack/v1/pnpm/12.4.1/pnpm

/home/bukzor/.cache/node/corepack/v1/pnpm/12.4.1/bin/:
total 12
drwxrwxr-x 1 bukzor bukzor   32 Sep 12 00:05 .
drwxrwxr-x 1 bukzor bukzor  222 Sep 12 00:05 ..
-rw-r--r-- 1 bukzor bukzor 5897 Oct 26  1985 pnpm.mjs
-rw-r--r-- 1 bukzor bukzor  400 Oct 26  1985 pnpx.mjs
```
