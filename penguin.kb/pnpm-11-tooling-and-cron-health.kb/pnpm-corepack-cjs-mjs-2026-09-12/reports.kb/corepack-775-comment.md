---
target: https://github.com/nodejs/corepack/issues/775
status: posted
posted-url: https://github.com/nodejs/corepack/issues/775#issuecomment-5720549030
---

Preamble (not part of the post): `nodejs/corepack#775` is the open
enhancement request asking corepack to read a package manager's actual
`bin` field/layout instead of relying on its own hardcoded
version-range table. Searched for a more specific "old corepack gives no
diagnostic for a version outside its table" issue and an
"outdated bundled corepack" issue -- no existing match
(`gh search issues --repo nodejs/corepack 'MODULE_NOT_FOUND version not
in config'` / `'unsupported version diagnostic'` /
`'bundled corepack outdated'`, all empty). Posting as a comment adds an
independent, differently-sourced data point (Node's own corepack
bundling, not corepack's release cadence) plus a smaller, separable ask
(a diagnostic) to a thread that's otherwise been open since 2026-07-15
with only a maintainer's ambivalence recorded.

--- Post body below ---

## Another data point for the hardcoded-table problem, from a different distribution channel

This bit me via a channel not yet mentioned on this thread: **Node's own
bundled corepack**, not corepack's own release cadence. My global
package-manager upgrade cron job hit an identical failure to the
original report, but through `node`'s bundled corepack (0.34.0, shipped
with Node 22.21.1, installed ~Dec 2025) rather than a manually-installed
corepack. Its embedded pnpm range table is `">=6.0.0" → "bin/pnpm.cjs"`
-- a single catch-all that predates the `.mjs` migration -- so it fails
identically for **any** pnpm ≥11.0.0, including current 12.4.1:

```
node:internal/modules/cjs/loader:1386
  throw err;
  ^

Error: Cannot find module '/home/.../corepack/v1/pnpm/12.4.1/bin/pnpm.cjs'
    at Function._resolveFilename (node:internal/modules/cjs/loader:1383:15)
...
Node.js v22.21.1
```

A separately-installed corepack 0.36.0 on the same machine resolves the
same request correctly (`">=11.0.0" → "bin/pnpm.mjs"`), confirming the
fix from #887 works -- the problem is purely that **Node bundles
corepack at a cadence far slower than corepack's own releases**, and
there's no floor-version check or user-facing signal when the bundled
copy predates support for the requested package-manager version. The
failure a user sees is a bare Node.js `MODULE_NOT_FOUND` stack trace with
no mention of corepack, its version, or that the target package manager
is simply outside what this corepack build knows about.

Two asks, independent of whether the broader "read `package.json`
dynamically" redesign ever happens:

1. When a requested version doesn't match any range in the embedded
   table, fail with a corepack-authored message naming the corepack
   version and suggesting an upgrade, instead of falling through to
   whatever the nearest-but-wrong range produces.
2. Consider whether corepack should compare its own bundled table's
   freshness against `Date.now()` (or ship a "last known good" pnpm/yarn
   version per corepack release) so an old, Node-bundled corepack can
   at least say "I predate support for pnpm 12" rather than guessing
   wrong silently.

Happy to provide any further logs/versions on request.
