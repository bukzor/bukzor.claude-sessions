---
captured: "2026-09-16"
method: ./2026-09-16-008-three-distinct-corepack-installs-on-this-machine-and-their-versions.sh
---

# Three distinct corepack installs on this machine and their versions

```sh
'bash' '-c' 'echo "prefix/pnpm/bin/corepack (pnpm global store):"; /home/bukzor/prefix/pnpm/bin/corepack --version; echo; echo "bin/corepack (routes to volta node, actually used by cron):"; /home/bukzor/bin/corepack --version; echo; echo "volta bundled node versions with local corepack:"; for v in 22.21.1 22.23.2 24.13.1; do f=/home/bukzor/.volta/tools/image/node/$v/lib/node_modules/corepack/package.json; echo "node $v -> corepack $(jq -r .version "$f")"; done'
```

```
prefix/pnpm/bin/corepack (pnpm global store):
0.36.0

bin/corepack (routes to volta node, actually used by cron):
0.34.0

volta bundled node versions with local corepack:
node 22.21.1 -> corepack 0.34.0
node 22.23.2 -> corepack 0.34.6
node 24.13.1 -> corepack 0.34.6
```
