---
cwd: /home/bukzor/claude/bukzor.samsung-debloat
session:
  uuid: 24ad6496-1df7-4921-a76d-7aecc7052c12
  started: 2026-05-26T17:40:00-05:00
  ended: 2026-05-27T19:56:00-05:00
cost-benefit-sweh:
  timebox:
    '@value': 4
    rationale: ADB reconnect + data-preservation wipe gate + wipe/de-Samsung
    confidence: tentative
  benefit-2w:
    '@value': 1
    rationale: family device restored to trustworthy state
    confidence: tentative
  cost-of-delay-2w:
    '@value': 1
    rationale: unknown whether the phone is still in pre-wipe limbo (in active use, degraded) — pending owner answer
    confidence: hypothetical
---
# Samsung Mom-Phone Forensics and Debloat

Mother's Galaxy S24+ (SM-S926U, hardware #2) arrived overrun with
zero-interaction adware popups. This session did read-only forensics before a
planned factory wipe + de-Samsung. Established: active malware already removed
by her uninstall spree; the Downloads dropper is Tencent 应用宝 (a secondary
payload); logcat reaches 2026-05-21 (crash buffer only — no install events).
Install-source analysis shows all 48 surviving apps are store-installed, so
patient zero was uninstalled and is purged from the package db — the passive
capture is exhausted for naming it, though other device sources are not.
TeamViewer is the user's own (intentional) support tool, documented in the repo.
A reusable analyzer (`scripts/forensic_report.py`) and a sources/analyses task-kb
framework now drive the remaining work. Full live state, findings, and gotchas
are in the project task kb.

**2026-05-27 (session 2): account-side My Activity cracked it open.** Two
captures (live scrape + Takeout export, parsed by new
`scripts/myactivity_takeout.py`) show the adware was an **~80-package PPI bundle,
Play-Store-installed**, that **detonated 2026-05-18** as a single-day
store-deeplink burst (onset 07:09:27; gone from device by 05-25). The
seed/controller is **off-Play** — the 04:53→07:09:27 trigger window is silent in
every retained source — leading candidate **`com.open.web.ai.browser`** ("AI
Browser": sideloaded, Samsung-Device-Care-flagged, ties to a Chrome Yahoo
search-hijack), but **undated/unconfirmed**. The Tencent APK is downstream, not
the enabler. New: `timeline.kb/` (full chain) and a **data-preservation wipe
gate** in `mission.md`. README is current — read it first.

Task kb (read this first): /home/bukzor/claude/bukzor.samsung-debloat/.claude/current-task.kb/

## Open work

- [ ] **Reconnect ADB** (wireless; wake+unlock, mDNS auto-connects —
  `environment.kb/adb-reconnect-and-durable-endpoint.md`).
- [ ] **Date/confirm the seed** (`com.open.web.ai.browser`): DownloadManager db
  (its APK fetch time + source URL), Samsung Internet history (the silent-window
  browser action), residual overlay/install-unknown appop holders. Needs reconnect.
- [ ] **Account-side**: Play **Protect** history (named+dated removals — may
  name/date the seed), Play **Library** (install source).
- [ ] **Card-fraud thread** — Google Pay transactions/Orders/Subscriptions are
  **in hand** in the Takeout, **unanalyzed**; mine for fraud/rogue subscriptions,
  plus Google **Security Checkup** (`open-questions.kb/card-fraud-link.md`).
- [ ] **Data-preservation gate → wipe + de-Samsung**: back up ALL wanted content
  (photos, messages, contacts, app data…), user confirms nothing needed, THEN
  wipe; reuse `scripts/master-debloat.adb.sh` as a guide (verify pkg names vs
  Android 16 / One UI 8); reinstall TeamViewer Host.
- [ ] Prevention: Auto Blocker on, "install unknown apps" OFF for all apps, Play
  Protect on.

> **Heads-up — concurrent session still live in this repo (as of 2026-05-27
> 22:45).** It committed `8b11d2a` ("test suite runnable via `uv run pytest`")
> ~45 min ago and has **~150 files staged-but-uncommitted** (the whole
> `android-apps.kb/` corpus, the probe scripts, schemas, findings, timeline
> edits). Local `main` is **ahead 1** of `origin/main` with that commit, so a
> push publishes its in-flight work. It is **mid-migration**: the working-tree
> `android-apps.kb/CLAUDE.md` describes a **flat** kb (verdict in frontmatter)
> but the **staged** copy still says **subdir-encoded** verdicts — internally
> inconsistent. **Do not commit/push wholesale; reconcile first.**

## 2026-05-27 (session 3): script-discoverability docs (uncommitted)

Made `scripts/` tooling discoverable from the kb an agent actually reads. All in
the **working tree, uncommitted**, layered on top of the concurrent blob above:

- `android-apps.kb/CLAUDE.md` — added a "Spot-checking an app — the probe
  toolkit" section naming all four probes (`app_reputation_probe.py`,
  `app_reviews_probe.py`, `wayback_probe.py`, `app_reputation_probe.frontmatter.jq`);
  `wayback_probe.py` had been referenced nowhere. (This file is `AM` — entangled
  with the concurrent session's flat-migration; can't be committed alone.)
- `environment.kb/prefer-committed-scripts-over-inline-code.md` — replaced the
  "Built so far" registry with a rule: *a script worth reusing earns one line in
  the `CLAUDE.md` nearest where the next agent will reach for it.* (Also `AM`,
  entangled — concurrent session renamed it from `use-a-real-script-not-inline-bash.md`.)
- `forensic-analyses.kb/install-timeline.kb/CLAUDE.md` — `package_dump.py`
  tooling line. (Clean mod of a committed file.)
- `environment.kb/two-myactivity-captures-complementary.md` — named the My
  Activity family (`myactivity_scrape.py` + the three `.jq`); corrected a stale
  "jq don't read the device field" note. (Clean mod of a committed file.)

- [ ] **Decide the per-dir `bin/` + `.envrc` (direnv) convention** for
  domain-limited scripts (user floated it; deferred by invoking session-end).
  Recommended *against* adopting inside the transient `current-task.kb`: scripts
  outlive the task, tests/`pyproject.toml` sit at repo root, direnv isn't in the
  toolchain, and cross-cutting scripts (`forensic_report.py`) have no single
  home. Reserve for a durable, domain-partitioned tree.
- [ ] **Devlog the registry→breadcrumb convention** once the entangled
  `prefer-committed-scripts-over-inline-code.md` / `android-apps.kb/CLAUDE.md`
  edits are committed: record the decision + rejected alternative (a central
  "Built so far" script registry, dropped because it drifts across N places).

## Tooling follow-ups (llm-kb)

- `llm.kb-validate` has **no `$ref` support**: a nested sub-kb resolves its
  schema as `<parent>/<sub>.jsonschema.yaml`, so each sub-collection needs its
  own schema file. Convention adopted this session: **symlink** the sub schema to
  the parent's when they match exactly (all of `forensic-sources.kb/*` and
  `forensic-analyses.kb/*` do); on a *partial* match, copy-paste instead and
  leave a `#TODO` pointing at this entry. Add `$ref` support to retire the
  symlinks/copies.
