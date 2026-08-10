---
cwd: /home/bukzor
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 9db82d95-5657-42af-a999-79de22ee0ca2
  started: 2026-07-27T16:20:39-05:00
  ended: null
---
# Claude-Path Encoding Change Orphans Git-Localhost-Store Stores

`~/bin/claude-path` has an **uncommitted** rewrite in the working tree
(HEAD is `32d1cc8`, 2025-12-18) that delegates encoding to
`~/bin/claude-slug` (itself untracked, created 2026-07-05). This
silently changed the store-path encoding that `git-localhost-store`
depends on, and the change is live — the working tree *is* the
deployment.

- Old (HEAD, and what `git-localhost-store`'s `CLAUDE.md` /
  `docs/dev/testing.kb/path-encoding.md` still document): `-` → `--`,
  `/` → `-`, everything else verbatim (dots survive).
- New (`claude-slug`): every non-alnum → exactly one `-`. Dots become
  `-`; literal `-` no longer doubles.

Worked example, same workdir
(`~/.claude/plugins/marketplaces/claude-plugins-official`):
old `-home-bukzor-.claude-plugins-marketplaces-claude--plugins--official`
(store dir dated 2026-05-11) vs new
`-home-bukzor--claude-plugins-marketplaces-claude-plugins-official`
(2026-07-19). Both exist side by side in
`~/.local/state/git-localhost-store/repos/`.

Blast radius today is small — a sweep of all 1008 store dirs found
exactly **one** double-encoded repo, the worked example above.
The reason is that the relocator short-circuits on `.git` already being
a symlink, so the encoding is only consulted when a store is *created
or recovered*. That is also where the real hazard is: recovering a
workdir whose store predates 2026-07-05 now computes a different store
path, finds nothing, and silently creates an empty store — the old
objects are stranded rather than restored. That is the system's whole
purpose failing quietly.

- [ ] Decide the encoding: revert `claude-path` to HEAD's scheme, or
      adopt `claude-slug`'s and migrate/merge the pre-2026-07-05 store
      dirs (954 of 1008 contain a dot, i.e. are old-scheme).
- [ ] Commit or revert `~/bin/claude-path` either way — leaving the
      deployed encoder uncommitted is what let this drift unnoticed.
      `~/bin/claude-slug` is untracked and needs the same decision.
- [ ] Reconcile the docs that still state the old rule:
      `~/.local/share/git-localhost-store/CLAUDE.md` ("Path Encoding")
      and `docs/dev/testing.kb/path-encoding.md` (its cases assert
      `my--special--repo`, which the live encoder no longer produces).
- [ ] Related, already noted in that project's `.claude/ideas.md`:
      "Inline the path encoding; drop the `claude-path` dependency" —
      its trigger fired 2026-07-27 and this finding is evidence for it.

Not part of this: `~/bin/claude-path` also carries a one-line fix from
this session (resolve `$0` via `realpath` so `claude-slug` is found when
invoked through `git-localhost-store/bin/claude-path`, which was broken
since 2025-11-20). That fix is orthogonal to the encoding question and
is deliberately left uncommitted with the rest of the file.
