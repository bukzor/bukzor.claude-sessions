# corepack installations on this machine

Three distinct `corepack` executables coexist, each reached differently
and independently versioned:

| path | reached via | how it stays current | version at investigation time |
| --- | --- | --- | --- |
| `~/prefix/pnpm/bin/corepack` | pnpm's global store, on `PATH` | `pnpm-upgrade-g` lists `corepack` as one of its 7 declared global packages | 0.36.0 |
| `~/bin/corepack` | user script, on `PATH` ahead of the above under a `.profile`-sourced non-interactive shell | follows `volta which node`'s bundled corepack -- i.e. whenever `volta install node@...`/`volta pin` moves the active Node | 0.34.0 (bundled with node 22.21.1, installed Dec 2025) |
| `~/.volta/bin/corepack` | volta's own shim | volta's normal shim mechanism | not directly exercised (bypassed by `~/bin/corepack`'s design) |

`PATH` order between `~/bin` and `~/prefix/pnpm/bin` is not fixed across
shell contexts on this machine -- interactive sessions observed during
this investigation put `~/prefix/pnpm/bin` first; anacron's
`. ~/.profile`-sourced job shell puts `~/bin` first. Any tool with both
a pnpm-managed and a `~/bin`-wrapped entry point is subject to this same
divergence, not just `corepack`.

Other volta node versions already fetched locally (`volta list node`):
22.23.2 and 24.13.1 bundle corepack 0.34.6 -- still short of the 0.35.0
line that carries the pnpm-v12 fix. No locally-installed node version
currently bundles a fixed corepack; only the pnpm-managed store's
independently-upgraded 0.36.0 does.
