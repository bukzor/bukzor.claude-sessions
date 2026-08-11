---
cwd: /home/bukzor/.local/share/git-localhost-store
session:
  uuid: [] # chronological; append your uuid when picking this entry up
  started: null
  ended: null
---
# Package Git-Localhost-Store

`git-localhost-store` needs an encoder and gets one by name: line 33 of
`bin/git-localhost-store` runs `claude-path` through PATH, on every hook
firing, in ~50 relocated repos. `claude-code-slug` being published means a
*correct* encoder is installed; it does not mean the installed one is the
one selected. `~/bin` precedes `~/.local/bin`, so anyone dropping a file
there wins, silently, and new store keys get named by it.

Packaging this tool is what makes the dependency declarable and the
selection deterministic — the encoder arrives in the same venv `bin/` as
the hook, so a resolved-path lookup finds *the co-installed one* rather
than whatever PATH offers.

Order matters, and the middle step is not independently shippable:

- [ ] Package `git-localhost-store` (it is bash + hooks + a template
      repo; decide what the distribution actually is before writing
      `pyproject.toml`).
- [ ] Declare `dependencies = ["claude-code-slug"]`.
- [ ] Switch line 33 to a sibling-of-`$0` lookup
      (`"$(dirname "$(realpath "${BASH_SOURCE[0]}")")/claude-path"`).
      **Not before packaging**: today the sibling is a tracked symlink
      pointing into one user's home, so taking this step first promotes a
      test-harness-only dangling symlink into a production dependency,
      and makes any fresh clone fail on arrival.
- [ ] Delete the tracked `bin/claude-path` symlink once the installer
      produces the sibling.

No `sibling if it exists, else PATH` fallback — that reintroduces the
ambiguity being removed, and silently: the failure mode becomes "the
wrong encoder ran and nothing said so".

Written up as `refactors.kb/declare-the-encoder-in-git-localhost-store.md`
in `~/claude/bukzor-packaging/`, status `proposed`, blocked on the first
item here. Standing check: `bukzor-packaging.claims.kb/coherence.py
--shadow`, which prints the call site and what resolves it.
