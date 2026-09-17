---
captured: "2026-09-16"
method: ./2026-09-16-009-pnpm-pnpm-13018-triage-confirms-corepack-hardcodes-bin-pnpm-mjs-pnpm-v12-pacquet-refuses-to-add-compat-shim.sh
---

# pnpm/pnpm#13018 triage: confirms corepack hardcodes bin/pnpm.mjs, pnpm v12 (pacquet) refuses to add compat shim

```sh
'gh' 'issue' 'view' '13018' '--repo' 'pnpm/pnpm' '--comments'
```

```
author:	github-actions
association:	contributor
edited:	false
status:	none
--
Oz triage is running now and will classify this issue and apply one pnpm `state:` label.

Follow along in Oz: https://app.warp.dev/run/019f648f-0f7c-76a9-b109-1bc044238b6f
--
author:	github-actions
association:	contributor
edited:	false
status:	none
--
## Triage result

**State:** `Ready to implement` → `state: accepted`

**Root cause:** Corepack hardcodes `bin/pnpm.mjs` as the pnpm entry point (set in corepack's `definitions.ts`). The pnpm v11 (TypeScript) npm package satisfied this because it shipped that exact file. pnpm v12 (pacquet, the Rust port) changed the package layout entirely — the `bin` field now points to a native binary placeholder called `pnpm` (no `bin/` subdirectory, no `.mjs` extension) that is replaced at install time by `install.js` (a `preinstall` script). Corepack does not run `preinstall` scripts when downloading package managers, so (a) the placeholder is never replaced, and (b) the hardcoded `bin/pnpm.mjs` path doesn't exist regardless.

**Affected product:** pacquet / pnpm v12 Rust port (`pnpm/npm/pnpm/`). The TypeScript CLI is unaffected — it already ships `bin/pnpm.mjs`. No pnpm↔pacquet parity work is implied beyond fixing the pnpm v12 npm package.

**Fix area:** Add a `bin/pnpm.mjs` JavaScript shim to the pnpm v12 npm wrapper (`pnpm/npm/pnpm/`) that, at runtime, resolves the native binary from the platform optional-dependency packages and spawns it. This mirrors how the preinstall script resolves the binary today, but deferred to run time rather than install time — making the package usable by corepack (which skips `preinstall`). The cross-post to nodejs/corepack (https://github.com/nodejs/corepack/issues/873) is also relevant; corepack should ideally read the `bin` field from `package.json` rather than hardcoding the path, but that upstream fix should not block progress here.

**Next step:** Implement the `bin/pnpm.mjs` runtime shim in `pnpm/npm/pnpm/`.

---
Written by an agent (Oz, auto).
--
author:	zkochan
association:	member
edited:	false
status:	none
--
There is nothing we can do on our end. If we add a backward compatible js shim it will make pnpm startup slower.
--
author:	hyunbinseo
association:	contributor
edited:	false
status:	none
--
@zkochan So there are no plans to support corepack in `pnpm@12`?
--
author:	zkochan
association:	member
edited:	false
status:	none
--
There is nothing we can do on our end without sacrificing performance. corepack has to add support for pnpm v12. Related PR: https://github.com/nodejs/corepack/pull/887
--
author:	hyunbinseo
association:	contributor
edited:	false
status:	none
--
Thanks for the context! It's a fresh PR - just 2 minutes ago.
--
author:	zkochan
association:	member
edited:	false
status:	none
--
I won't recommend anyone using corepack with pnpm. It adds an overhead of at least 70.6ms to every pnpm execution. pnpm has builtin version managers for itself. There is not reason to use corepack. I imagine that is the reason yarn is also switching to its own version manager written in rust.
--
author:	MikeMcC399
association:	contributor
edited:	false
status:	none
--
This issue is resolved in [pnpm 12.0.0-rc.6](https://github.com/pnpm/pnpm/releases#release-v12.0.0-rc.6) 
--
```
