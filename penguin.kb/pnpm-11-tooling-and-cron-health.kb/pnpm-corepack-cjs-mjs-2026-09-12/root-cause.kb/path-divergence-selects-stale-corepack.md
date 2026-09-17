---
status: confirmed
---

# PATH divergence (interactive vs. cron) selects a stale, pnpm-12-unaware corepack

**Mechanism:** `~/bin/corepack` deliberately routes to whatever corepack
ships with volta's currently-pinned node (22.21.1 → corepack 0.34.0),
"to follow node upgrades" (`cab90f2`). Node's own corepack-bundling
cadence lags corepack's release cadence badly: 0.34.0 (Dec 2025) predates
the fix for pnpm v11/v12's `.mjs` bin layout, while the *separately
installed* pnpm-managed corepack (0.36.0, kept current because
`pnpm-upgrade-g` lists `corepack` as one of its own upgrade targets) has
that fix.

Which of these two binaries plain `corepack` resolves to depends on
`PATH` order, which differs by shell context: interactively (this
session, and apparently the 2026-09-10 session that "fixed" a prior
occurrence) `prefix/pnpm/bin` precedes `~/bin`; under anacron's
`. ~/.profile`-sourced non-interactive shell, `~/bin` precedes
`prefix/pnpm/bin`. The cron job therefore always hits the stale 0.34.0,
which maps every pnpm ≥6.0.0 to `bin/pnpm.cjs` -- wrong for 11.x/12.x,
which ship only `.mjs`.

**Supports:** all five findings in `../findings.kb/`.

**Would falsify:** if a fresh capture of the *actual* cron process's
resolved `corepack` path/version (not the simulated equivalent) showed
0.36.0, or if 0.36.0's range table also produced `.cjs` for 12.4.1
specifically (it doesn't -- captured directly).

**Residual uncertainty:** the PATH simulation
(`evidence.kb/2026-09-16-005-*`) reconstructs cron's environment via
`env -i` + sourcing `.profile`; it is not a capture of the literal cron
process's environment (which had already run and exited by the time this
investigation started). The reconstruction matches anacrontab's own
invocation line exactly, so confidence is high but not a direct
observation of that process.
