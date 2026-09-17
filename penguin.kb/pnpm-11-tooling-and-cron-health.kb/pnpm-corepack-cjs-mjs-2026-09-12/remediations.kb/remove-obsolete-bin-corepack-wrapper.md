---
status: done
requires-sudo: false
---

# Delete `~/bin/corepack` outright (not rewrite it)

Original plan was to rewrite the wrapper to `exec` the pnpm-managed
corepack instead of volta's. Simpler and better: just remove it.
`~/bin` sits ahead of `prefix/pnpm/bin` in the plain, direnv-free PATH
(`../findings.kb/direnv-masks-the-bug-by-reordering-path.md`), so with
the wrapper gone, `corepack` falls through to `prefix/pnpm/bin/corepack`
(0.36.0, kept current by `pnpm-upgrade-g`'s own `corepack@latest`
global-package entry) on every shell, cron included -- no PATH-order
dependency left to break again.

The wrapper's original purpose (`cab90f2`: follow volta's node upgrades
to get corepack "for free") is obsolete now that a directly-managed,
more-current corepack already exists on PATH; keeping it only
reintroduced the version-lag this incident was caused by.

Applied 2026-09-17:

```sh
git rm bin/corepack   # staged; not yet committed -- ~/ has many
                      # other unrelated pending changes, left for the
                      # user to commit on their own schedule
```

Companion step required and also applied: the already-written bad cache
entry for 12.4.1 does not self-heal just by switching binaries --
verified empirically (`../evidence.kb/2026-09-17-003-post-remediation-verification-fixed-corepack-resolves-pnpm-12-4-1-cron-path-picks-it-directly.md`
shows the *fixed* 0.36.0 corepack still threw the same
`MODULE_NOT_FOUND` until the cache entry was cleared). See
`clear-stale-cache-entry.md`.
