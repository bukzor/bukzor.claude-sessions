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

## Release -- blocked on one browser step

Tag `git-localhost-store-v0.1.0` is pushed. Its run
(<https://github.com/bukzor/bukzor-tools/actions/runs/31447107849>) built
and bounced at upload: `400 Non-user identities cannot create new
projects` -- PyPI's phrasing for "no publisher for this project name".

- [ ] Register the pending PyPI trusted publisher (browser, human):
      pypi.org → Account settings → Publishing. Project `git-localhost-store`,
      Owner `bukzor`, Repository `bukzor-tools`, Workflow `release-pypi.yml`,
      Environment `pypi`. The `pypi` environment already exists on the repo.
      Name verified free against the squashed-name rule on 2026-08-10.
- [ ] Then `gh run rerun 31447107849` -- the tag is already right, no
      re-tagging needed.
- [ ] Verify the consumer path:
      `curl -s https://pypi.org/pypi/git-localhost-store/json | jq .info.version`.

The `workflow_dispatch` rehearsal is no help here and its comment now says
so: the mint-token request carries only the OIDC token, no package name, so
`claude-code-slug`'s registration mints a token for any dispatch. For a
first release the upload bounce is the only test.

## Cutover -- done 2026-08-10

`uv tool install . --force` from the workspace, then
`git-localhost-store-install`. The dotfiles copy is deleted and
`.local/share/.gitignore` no longer opts it in; the installer regenerates
`bin/git-localhost-store` (symlink into the tool venv) and
`template-repo/hooks/`. Verified by a fresh repo relocating and committing
through the real hooks into the real store, after a full `rm -rf` of the
share directory. Redo with `uv tool install git-localhost-store` once the
release lands, or leave it -- the workspace install is equivalent.

## Known gaps

Tracked in the package's own `.claude/todo.md`, which also carries the
workdir-rename orphan bug: no shellcheck hook, and no test for the
`post-index-change` deferral branch -- the one place `relocate.sh` must
*not* adopt an existing store.
