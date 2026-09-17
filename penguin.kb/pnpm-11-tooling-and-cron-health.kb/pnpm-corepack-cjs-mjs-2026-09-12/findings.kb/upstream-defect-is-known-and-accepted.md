---
status: confirmed
evidence:
  - ../evidence.kb/2026-09-16-009-pnpm-pnpm-13018-triage-confirms-corepack-hardcodes-bin-pnpm-mjs-pnpm-v12-pacquet-refuses-to-add-compat-shim.md
  - ../evidence.kb/2026-09-16-010-nodejs-corepack-775-and-873-corepack-hardcoded-pnpm-bin-path-history-v11-then-v12-breakage.md
---

# Upstream already agrees: corepack hardcodes the bin path instead of reading it

`nodejs/corepack#775` (open, filed against pnpm v11): "Corepack hardcodes
pnpm binary path instead of reading package.json bin field." A
maintainer (`aduh95`) confirms the tradeoff is deliberate --
security/supply-chain caution against trusting a fetched `package.json`'s
`bin` field dynamically -- and leaves it open as an enhancement request.

`nodejs/corepack#873` (closed) and `pnpm/pnpm#13018` (closed) cover the
identical break for pnpm v12 alphas: pnpm's Rust rewrite ("pacquet")
changed the package layout entirely, corepack's hardcoded
`bin/pnpm.mjs` path didn't match, and pnpm's maintainer (`zkochan`)
declined to add a compatibility shim on performance grounds ("There is
nothing we can do on our end... corepack has to add support for pnpm
v12"). Fixed via `nodejs/corepack#887`, landing in corepack 0.35.0/0.36.0.

Net effect: the fix exists, but only in *recent* corepack releases.
Nothing un-breaks an *older* corepack still in service elsewhere (see
`../root-cause.md`) -- and corepack gives no diagnostic ("this pnpm
version isn't in my table") before crashing with a bare
`MODULE_NOT_FOUND`, which is the residual gap not covered by any of
these three threads. See `../reports.kb/` for the drafted follow-up.
