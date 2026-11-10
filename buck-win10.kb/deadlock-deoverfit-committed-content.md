---
cwd: /home/bukzor/claude/deadlock
session:
  uuid:
    - 456d8a83-2938-4cd0-af73-2650567230ba
  started: 2026-08-24T19:30:00+00:00
  ended: 2026-08-24T20:05:00+00:00
---
# Deadlock: De-Overfit Committed Content to This Machine

Audited all 89 tracked files in `~/claude/deadlock` for content inappropriate to
publish or overfit to this box (identity strings, host paths, host facts,
session-artifact prose), then fixed what it found. The committed data
(`data/gamedata.tsv/*`, `deadlock-version.json`) is clean — Valve data only, no
Steam ID, no local paths. `bukzor-redotools` and the
`bukzor/basedpyright-as-pyright` dep are legitimate attribution, left alone.

## Outcome (done, verified)

- Dropped "`sudo` is passwordless" from `environment.kb/host-alpine-musl-gcompat.md`
  and the third-person "the user flagged" phrasing from `game-install-paths.md`.
- **Replaced the real overfit:** `paths.py` hardcoded this box's WSL install as
  `DEFAULT_GAME_DIR`, with the test asserting it. Now one knob, `DEADLOCK_HOME`
  (install root; `game_dir()` derives `home/"game"`), defaulting to the stock
  native-Linux Steam library. `DEADLOCK_GAME_DIR` is gone, no alias.
- **Durable local override:** gitignored `localhost.env` at the repo root,
  loaded by `dotenv_if_exists` as the *last* line of `.envrc` (so it wins over
  everything, and direnv `watch_file`s it — edits reload without `direnv allow`).
  Mine holds the `/mnt/c/Program Files (x86)/…/Deadlock` path.
- Rationale recorded in
  `docs/dev/decisions.kb/machine-local-paths-live-in-localhost-env.md`; README +
  `environment.kb` updated to match, with an explicit "don't move that path back
  into the code" pointer.
- Verified: `pytest` 187 passed (integration tests resolved the real VPK,
  `vpk_dir_file().exists() == True`), `pyright` 0 errors, `llm.kb-validate` 13
  files 0 errors.

## Key facts for future claude

- `localhost.env` is **not** in git — a fresh clone of this repo on this box
  needs it recreated, or every path resolves under
  `~/.local/share/Steam/steamapps/common/Deadlock` (nonexistent here). The
  README has the one-liner.
- I ran `direnv allow` on the repo after editing `.envrc`.
- The user's real Steam ID3 appears only in the private
  `sessions.kb/recover-deadlock-builds-and-snapshotter.md`; the public repo uses
  a `<id>` placeholder in `environment.kb/game-install-paths.md`. Keep it that
  way.
- `environment.kb/` is chartered to hold host-specific *facts* — that is not a
  license to hardcode host paths in code. The new CLAUDE.md guidance says so.

## Open follow-ups

- [ ] Decide whether the committed `DEFAULT_HOME` should instead point at the
      Proton/`compatdata` shape. Deadlock has no native Linux build, so every
      real install is Proton or Windows-through-WSL; today's default is a sane
      *shape* rather than a path that will often be right. User was offered this
      and hasn't answered.
- [ ] `data/deadlock-version.json` is stamped `ClientVersion 6684`,
      `VersionDate "Aug 22 2026"` — two days stale as of this session. A `redo`
      + `git diff` would show whatever the latest patch changed (that being the
      whole point of the committed TSVs).
