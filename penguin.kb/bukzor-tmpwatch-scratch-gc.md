---
cwd: /home/bukzor
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 93a9af1f-b2a0-4614-a24c-fd37e5d689f3
  started: 2026-08-28T09:52:22-05:00
  ended: null
---

# bukzor-tmpwatch — Scratch GC for $HOME

`/tmp` here is tmpfs: RAM-backed, no swap, emptied at boot, and invisible to
ChromeOS's file manager (cicerone only translates paths under the container's
homedir). So `TMPDIR` moved to `$HOME/tmp/boot=$BOOT/$date`, and
`bukzor-tmpwatch` exists to bound the growth that creates. It sweeps in two
phases: an idle top-level entry is renamed into `<root>/lost-and-found/<date>/`,
and a whole dated batch is deleted a further wait later. Nothing is deleted that
was not first parked somewhere visible.

Code: `~/repo/github.com/bukzor/bukzor-tools/packages/bukzor-tmpwatch`.
Open rulings: that repo's `.claude/todo.md`.

It is **live**: `bukzor-tmpwatch.timer` runs nightly with `--write`.

## Completed this session

- `bukzor/dotfiles` `730c8be` (branch `svelte-crostini`): `700-tmpdir.sh`
  reordered so `$HOME` wins over `/tmp`.
- The package, from scratch: two-phase sweep, systemd user units, 134 tests,
  64 named mutations (`packages/bukzor-tmpwatch/mutate.py`).
- Reporting is the default; `-w`/`--write` acts. `-n` is rejected outright
  rather than silently accepted.
- Every setting is a plain-text file under `$XDG_CONFIG_HOME/bukzor-tmpwatch/`,
  one per setting, `#` comments stripped. A **missing** file is an error naming
  `bukzor-tmpwatch-install`; an **emptied** file is the empty value, which is
  how a setting is switched off. `ls` on that directory is the reference.
- Installed editable (`uv tool install --editable .`), units symlinked rather
  than copied, so there is no stale copy of anything.
- Three real timer runs: one crashed (see traps), two clean. **1690 entries
  quarantined, 3.8G held**, nothing deleted yet.

## Live follow-ups

- [ ] Watch the first real purge. `shutil.rmtree` has never run outside tests.
      With `purge-after-days = 30`, the 2026-08-29 batches go on **2026-09-29**,
      2026-08-30 on 09-30. Preview it any time, safely, with
      `bukzor-tmpwatch --purge-after 0` — dry-run is the default.
- [ ] Two rulings the owner has not made, both in
      `~/repo/github.com/bukzor/bukzor-tools/.claude/todo.md`: whether an
      unreadable root should abort the sweep or be skipped with a warning, and
      whether to add a `--porcelain` flat-path output mode.
- [ ] `bukzor-confdir`: the one-file-per-setting convention is reusable, but
      only ~45 lines of it are generic. Recommendation given and not yet acted
      on: **write the convention down as a spec now** (absent = error, emptied =
      off, kebab filenames, templates hold live defaults pinned to the code by a
      drift test, values cannot contain `#`), and extract a package only at the
      second consumer, when the diff can say what is actually shared. It is
      `envdir` with defaults; `bukzor-config` overclaims the scope.
- [ ] Review what is in quarantine before it ages out. 3.8G, including files in
      `~/tmp` dating to 2023. The 30 days exist for exactly this.

## Traps worth not re-deriving

- **`mv` into `trash/` preserves mtime**, so the file is idle the moment it
  lands and is quarantined by the very next sweep with no wait at all. This is
  the normal disposal path, not a corner. It is why `purge-after-days` carries
  the whole 30-day floor and `quarantine-after-days` carries none of it.
- **A root inside a root is not a root.** `~/tmp/strace/claude/trash` was both a
  discovered root and content of `~/tmp`; sweeping the outer one renamed it, and
  the sweep then looked for it where it used to be. This crashed the first real
  run after it had already moved 80 files. `outermost()` collapses nested roots.
- **`shutil.move` onto an existing name overwrites it.** Two sweeps in one day
  meeting the same name destroyed what the first one saved — data loss inside
  the safety net. `free_name()` suffixes `~1`, `~2`.
- **`boot={boot}` is not redundant with mtime**, though it looks it. mtime
  answers "is this data stale"; the guard answers "might a process from this
  boot hold a path under here as a string". `lsof`/`fuser` cannot substitute:
  an open fd or a cwd survives a rename untouched, and a path held as a string
  — an exported `$TMPDIR` — has nothing on disk to find. It fired correctly on
  its first real run.
- **`$TMPDIR` is not available to the timer.** `systemctl --user
  show-environment` carries no `TMPDIR` and nothing imports one, and the
  variable is inheritable and deliberately overridable, so it is a bad source of
  truth for what to keep. `/proc/stat`'s `btime` cannot be inherited or forged.
- **`700-tmpdir.sh` lists `"$TMPDIR"` first**, so only a genuinely fresh login
  picks up the `$HOME` layout. Any shell spawned from a session that already has
  a value keeps the old `/tmp` path indefinitely.
- **CPython's bytecode cache keys on `(mtime, size)`.** A mutation that
  preserves file size and lands in the same second as the restore is silently
  not applied, and the harness reports a false result in either direction. It
  runs `python -B` and clears `__pycache__` between mutations for this reason.
- **`pre-commit run --all-files` does not see untracked files.** New files get
  reformatted by the hook at commit time, which fails the commit and leaves a
  stale staged snapshot; `git reset -q <paths>` then retry. Hit three times.
- **`/etc/profile.d/cros-motd.sh` is not dash-clean**, so `sh -lc` fails on this
  box. `bash -lc` works.
- Editable install plus symlinked units means the repo path is load-bearing for
  the tool, the timer unit, and its enablement — and the nightly job runs
  whatever is in the working tree, mid-refactor included.
