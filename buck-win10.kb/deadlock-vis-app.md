---
cwd: /home/bukzor/claude/deadlock
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 14fac9c8-bc5e-42f7-956c-f88e2a8e613c
  started: 2026-11-18T15:46:12+00:00
  ended: null
---
# Deadlock Vis App

Build `apps/vis/`: a general-purpose browser visualizer over the repo's
`data/`. The client is TS + React in a pnpm workspace; the server is Python in
its own uv workspace on the latest Python (3.14), checked with basedpyright
`all`. They talk JSONL that `jq` can read from stdin. **First goal:** pick a
hero and an ability, then chart damage against time. Each hit is a bar whose
height is the damage, whose left edge is the trigger time and whose right edge
is the land time, so the bar's width is the wind-up. Alongside the chart, show
DPS measurements that can be checked in-game. Resume with `/subagent-handoffs`.

## User's request (verbatim intent)

- `apps/vis` with `client/` and `server/`. The server has full access to
  `data/`. Split into further components if that helps maintainability.
- The client may use Vue or Nuxt instead if that is better. I chose React.
- Standards: `~/.claude/reference.kb/` (python style, TDD Describe/it,
  observe each assertion fail).

## Decisions taken (agent's; none vetoed yet)

- **Server = separate uv workspace** at `apps/vis/server/`
  (`[tool.uv.workspace] members = []`, `.python-version` 3.14). It is not a
  member of the root workspace, because the root is pinned to 3.12. It
  depends on the root `deadlock` package as an editable path dep
  (`../../../`) and reuses `deadlock.gamedata.load`, `deadlock.paths.data_dir`,
  `deadlock.jsonl.dumps`, `deadlock.abilities`, and
  `deadlock.ability_profiles.profiles`, which serves as the oracle for gun DPS.
  Runtime deps: starlette, uvicorn. Dev deps: pytest, basedpyright, httpx.
  Running `uv run` warns that the root direnv sets `VIRTUAL_ENV`. The warning
  is harmless.
- **Data sources:** raw `data/gamedata.json/scripts/{heroes,abilities}.json`
  (local, built by redo) supply the abilities' properties. Hero display names
  come from the committed `data/gamedata.tsv/heroes.tsv` (`hero`, `name`).
- **Protocol:** `GET /api/{query}?k=v` returns `application/jsonl`. The CLI
  `vis-server query NAME k=v ...` emits the same lines, so `| jq` works.
  `GET /api` lists the queries. Timeline lines are tagged with `kind`:
  `hit` / `measure` / `note`. A `BadRequest(ValueError)` becomes a 400 with an
  error line, and anything else fails hard. The whole response is built
  before it is sent, so an error can still set the status.
- **Core model (pure):** `Hit(trigger, land, damage, label, cycle)` and
  `Cycle(hits, period|None, reload)`. `repeat(cycle, horizon)` unrolls a
  cycle. Builders:
  - **Gun:** one clip plus its reload. Shot n fires at
    `(n//burst)*period + (n%burst)*intra'`, with
    `period = cycle + burst*intra'`. Per
    `docs/dev/mechanics.kb/gun-*.md`, `intra'` is 0 when burst is 1.
    `travel = distance / bullet speed`, read from `m_BulletSpeedCurve` (it is
    present on only 5 of the 46 live guns, and every one is constant).
  - **Melee:** light or heavy. Damage comes from hero
    `m_mapStartingStats.E{Light,Heavy}MeleeDamage`, and the period is
    `m_mapAttacks.EAttackType_*.m_flCooldownOnHit`. Wind-up is **not in the
    data**, so it is a user parameter that defaults to 0, plus a note.
  - **Cast:** signature or ultimate abilities that have `Damage` and/or `DPS`.
    The impact lands at `AbilityCastDelay`. DPS ticks every `TickRate` across
    `AbilityDuration`, and the cycle repeats every `AbilityCooldown`. Spirit
    scaling is `base + m_subclassScaleFunction.m_flStatScale * spirit`, for
    ETechPower only. Charges are not modeled; emit a note instead. This model
    is an unverified heuristic, and the output says so.
- **Measures:** `uptime_dps = Σdamage / (period − reload)`, which equals the
  UI's DPS; `steady_dps = Σdamage / period`, which equals sdps. Over the
  horizon: total, average DPS, first land, and `time_to_kill(hp)` (the user's
  `docs/games/melee.txt` has dummy-health columns). Each measure carries a
  `check` string saying where to verify it in-game.
- **Query params:** hero, ability, horizon=10, distance=0, spirit=0, hp,
  windup=0, attack=light|heavy.
- **Client plan:** Vite + React + TS strict, Observable Plot (`rect`
  x1=trigger, x2=land, y=damage, plus `ruleX` at land so zero-width hits still
  show), and vitest. Vite proxies `/api` to the server (default port 8787). The
  server can also serve `client/dist`. Planned files: `api.ts` (a streaming
  JSONL fetch), `protocol.ts` (types that mirror the Python records), and a
  picker, params form, chart, measures table and notes list. Load the
  `dataviz` skill before writing chart code.
- Docs to add: `apps/vis/README.md` (how to run, the protocol) and a
  `docs/dev/decisions.kb/` entry for the choices above (frontmatter
  `status`/`date`).

## State on disk (uncommitted, untracked)

- `apps/vis/server/`: `pyproject.toml`, `uv.lock`, `.python-version`,
  `src/vis_server/{__init__.py (empty), types.py, timeline.py,
  timeline_test.py}`. All 10 tests passed.
- **⚠ `timeline.py` holds a leftover mutation.** It was applied when the
  mutation-testing run was interrupted. At line 72, `if cycle.period is None:`
  is followed by `n += 1` where it should be `return`, so a cycle with no
  period loops forever. The pristine copy is
  `trash/vis-mut/timeline.py.orig`. Restore it before anything else.
- `docs/games/` is the **user's** untracked file of in-game measurements. Do
  not stage it.

## Open work

- [ ] Restore `timeline.py` from `trash/vis-mut/timeline.py.orig`. Then see
  each `timeline_test.py` assertion fail under a mutation. The planned set of
  mutations: drop the single-shot intra branch, use `(burst-1)*intra`, drop
  pellets, drop reload, drop travel, swap the horizon checks, drop `cycle=n`.
- [ ] `measures.py` + test (uptime/steady DPS, total, horizon DPS, first land,
  time to kill)
- [ ] `kits.py` (load the trees, classify each ability as gun / melee / cast /
  null, build its Cycle and notes) + an integration test against the real
  data: the gun timeline's uptime/steady DPS must equal
  `ability_profiles` dps/sdps for every live hero, and every ability's
  timeline must build
- [ ] `queries.py` registry (heroes, abilities, timeline), `http.py`
  (Starlette), `__main__.py` (`serve` / `query`). Keep basedpyright `all`
  clean.
- [ ] `apps/vis/client/`: pnpm workspace (root `pnpm-workspace.yaml`), Vite
  React TS, Observable Plot, vitest. Both `tsc --noEmit` and the tests must
  pass.
- [ ] README + decisions.kb entry. Commit with `git commit-staged`; read
  `~/.claude/must-read.kb/before/git/commit.md` first.
- [ ] Later: ability upgrades (`ability_upgrades.tsv`), charges, hero level
  scaling, and a check of the melee wind-up in-game.
