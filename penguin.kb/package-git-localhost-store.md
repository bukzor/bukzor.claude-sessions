---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-tools
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 1f386728-d6ea-46ca-addc-04505b6895b2
  started: 2026-08-10T14:00:00-05:00
  ended: null
focus:
  - packages/git-localhost-store/CLAUDE.md
---
# Package Git-Localhost-Store

`git-localhost-store` is a `bukzor-tools` workspace member as of
2026-08-10 (`packages/git-localhost-store`, committed and pushed). The
encoder is declared *and* selected: `pyproject.toml` carries
`dependencies = ["claude-code-slug"]` and `cli.py` says
`from claude_code_slug import path_slug`, so no PATH lookup can name a
store with the wrong encoder.

Design notes live in the package's own `CLAUDE.md`; the packaging
rationale is `~/claude/bukzor-packaging/packages.kb/git-localhost-store.md`
(status `shipped`).

## The constraint everything else serves

`${XDG_DATA_HOME:-$HOME/.local/share}/git-localhost-store/bin/git-localhost-store`
is baked into ~3000 hook files already on disk, copied at repo-init time
and never re-read. `git-localhost-store-install` materializes that path as
a symlink into the venv. **Install before deleting anything**: a gap
between removing the dotfiles copy and running the installer breaks
`git commit` in every relocated repo on this machine (~50 live).

## Release

- [ ] Register the pending PyPI trusted publisher (browser, human):
      pypi.org → Account settings → Publishing. Project `git-localhost-store`,
      Owner `bukzor`, Repository `bukzor-tools`, Workflow `release-pypi.yml`,
      Environment `pypi`. The `pypi` environment already exists on the repo.
      Name verified free against the squashed-name rule on 2026-08-10.
- [ ] `workflow_dispatch` rehearsal with `package=git-localhost-store` --
      builds and mints a token without uploading, which is the one failure a
      local build cannot predict.
- [ ] Tag `git-localhost-store-v0.1.0`, push, watch the run.
- [ ] Verify the consumer path:
      `curl -s https://pypi.org/pypi/git-localhost-store/json | jq .info.version`.

## Cutover

- [ ] `uv tool install git-localhost-store` (or `uv tool upgrade bukzor-tools`).
- [ ] `git-localhost-store-install`; check the public symlink resolves and a
      real commit in a relocated repo still works.
- [ ] Only then: delete `.local/share/git-localhost-store/` from the dotfiles
      repo.

## Known gaps

- [ ] No shellcheck hook in `bukzor-tools/.pre-commit-config.yaml`;
      `relocate.sh` and `hook.sh` are checked by hand.
- [ ] No test for the `post-index-change` deferral branch -- the one place
      `relocate.sh` must *not* adopt an existing store.
