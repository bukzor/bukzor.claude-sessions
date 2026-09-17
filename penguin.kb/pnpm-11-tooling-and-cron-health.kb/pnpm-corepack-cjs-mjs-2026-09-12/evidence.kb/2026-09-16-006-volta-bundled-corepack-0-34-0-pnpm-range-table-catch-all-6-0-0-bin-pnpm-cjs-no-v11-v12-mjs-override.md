---
captured: "2026-09-16"
method: ./2026-09-16-006-volta-bundled-corepack-0-34-0-pnpm-range-table-catch-all-6-0-0-bin-pnpm-cjs-no-v11-v12-mjs-override.sh
---

# Volta-bundled corepack 0.34.0 pnpm range table: catch-all >=6.0.0 -> bin/pnpm.cjs (no v11/v12 mjs override)

```sh
'bash' '-c' $'python3 - /home/bukzor/.volta/tools/image/node/22.21.1/lib/node_modules/corepack/dist/lib/corepack.cjs <<\'PYEOF\'\nimport sys, re\ndata = open(sys.argv[1], encoding=\'utf-8\', errors=\'replace\').read()\nidx = data.find(\'registry.npmjs.org/pnpm\')\nprint(data[max(0,idx-200):idx+900])\nPYEOF'
```

Exited 2.

```
evidence.kb/2026-09-16-006-volta-bundled-corepack-0-34-0-pnpm-range-table-catch-all-6-0-0-bin-pnpm-cjs-no-v11-v12-mjs-override.sh: 4: Syntax error: "(" unexpected
```
