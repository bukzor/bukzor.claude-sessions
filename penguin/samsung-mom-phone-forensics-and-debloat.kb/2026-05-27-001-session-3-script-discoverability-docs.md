Part of `../samsung-mom-phone-forensics-and-debloat.md`.

# 2026-05-27 (session 3): script-discoverability docs (uncommitted)

**Heads-up — concurrent session still live in this repo (as of 2026-05-27
22:45).** It committed `8b11d2a` ("test suite runnable via `uv run pytest`")
~45 min ago and has **~150 files staged-but-uncommitted** (the whole
`android-apps.kb/` corpus, the probe scripts, schemas, findings, timeline
edits). Local `main` is **ahead 1** of `origin/main` with that commit, so a
push publishes its in-flight work. It is **mid-migration**: the working-tree
`android-apps.kb/CLAUDE.md` describes a **flat** kb (verdict in frontmatter)
but the **staged** copy still says **subdir-encoded** verdicts — internally
inconsistent. **Do not commit/push wholesale; reconcile first.**

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

Two open items from this session are tracked in the parent file's `## Open
work` list rather than here: the per-dir `bin/`+`.envrc` convention decision,
and devlogging the registry→breadcrumb convention.
