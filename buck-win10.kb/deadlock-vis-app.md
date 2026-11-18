---
cwd: /home/bukzor/claude/deadlock
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 14fac9c8-bc5e-42f7-956c-f88e2a8e613c
  started: 2026-11-18T15:46:12+00:00
  ended: 2026-11-18T18:42:12+00:00
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

## Status (2026-11-18T18:42, closed)

Done through review round 5; the user: "good enough for today". The plan,
`deadlock/.claude/todo.kb/2026-11-18-000-vis-app.md`, records the commit ranges;
the handoff files are in git history. Run `apps/vis/bin/serve`, open
http://localhost:5173/.

Awaiting the user's ruling (nothing blocks on it):
- the design, `docs/dev/decisions.kb/vis-app.md` (`status: proposed`), including
  its two `[!DRAFT]` calls: zoom-to-kill also on hero/ability/level change;
- 29 `standing: agent` claims in `apps/vis/docs/dev/claims.kb/`
  (`llm-claims-kb-grounding` orders them for review);
- idea `2026-11-18-012-vis--a-cast-s-default-chart-window.md` (two cycles vs one
  cast; the agent recommends keeping two).

Follow-ups: `deadlock/.claude/ideas.kb/2026-11-18-*-vis--*.md`, one per
improvement.
