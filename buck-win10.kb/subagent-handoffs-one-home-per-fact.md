---
cwd: /home/bukzor/claude/deadlock
session:
  uuid:
    - 97605ccb-7e13-403d-97ab-c42fbfe97141
  started: 2026-11-10T18:35:24+00:00
  ended: 2026-11-10T20:10:00+00:00
---
# Subagent-Handoffs: One Home per Fact

Reviewed the deadlock per-DLL store at a high level (its findings went to
`deadlock-per-dll-dump-tree.md`), then redesigned the sub-agent coordination
skill around the user's four goals (correctness, focus, review,
interruptibility) and moved it into the fleet:
`~/repo/github.com/bukzor/bukzor-agent-skills/subagent-handoffs/` (commit
`3c4a733`), installed as `~/.claude/skills/subagent-handoffs`, removed from
deadlock (`4195d40`). The skill now says: one home per fact, open vs done
tense, agents commit their own units path-scoped, amendments reach dependents
via `required-reading:`. Its rationale is a design ledger in the skill's
`claims.kb/`, with contested questions as decision points.

Also: `bukzor-agent-skills` takes `basedpyright-as-pyright` from PyPI
(`bf294f8`).

## Key facts for future claude

- Run the llm-claims-kb tools from inside the `bukzor-agent-skills` workspace
  (`uv run --package llm-claims-kb ...`). From outside the fleet,
  `llm-claims-kb-mentions` reported 0 findings where the fleet run found 15,
  and `llm-claims-kb-ownership` reported "0 stipulations".
- `git commit-files ... -- -F -` does not forward stdin (empty message
  abort); write the message to a file in `trash/` and pass `-F <file>`.
- `bukzor-agent-skills/llm-kb/uv.lock` was already modified (mtime
  2026-09-20) before this session; it was left uncommitted.
- This host was never onboarded to this repo: its `~/.claude/sessions.kb/`
  is still the plain dotfiles directory (`wsl-buck-win10` predates the
  submodule). This session onboarded `buck-win10.kb/` here with the three
  live, shareable entries; their copies in the old directory stay until
  the dotfiles side switches over.
- In the live `~` (uncommitted, both matching `svelte-crostini`):
  `~/.claude/sessions.jsonschema.yaml` is now the one-line stub to the
  canonical `llm-sessions` schema, and `~/.claude/skills/llm-sessions` is
  linked. `~/.claude/skills/subagent-handoffs` is linked too (new).

## Overlap with the dotfiles reunification

`penguin.kb/reunify-dotfiles-lineages.md`; plan unit
`2026-07-08-000-Reunify-dotfiles.kb/2026-11-10-000-Fold-wsl-buck-win10-into-main.md`.
A session was live in `~` here while this one ran, so nothing was
committed on `wsl-buck-win10` (one writer at a time). The unit's
`sessions.kb/` item says only `recover-deadlock-builds-and-snapshotter.md`
is missing from this repo; three more were live on this host (now here),
and that one is held back (next item).

## Open follow-ups

- [ ] First real plan under the revised skill: confirm agents committing
      concurrently in one worktree behave (path-scoped commits, `index.lock`
      retries), and that briefs naming homes really shrink reports
- [ ] `llm.kb-validate-links` flags the template's `../{{plan}}.md`
      placeholder as a broken link; templates need an exemption or a
      convention for placeholder paths
- [ ] `llm-kb`'s run-self-audits procedure names
      `llm-triggers/bin/llm-triggers-lint`, which does not exist at
      `~/.claude/skills/llm-triggers/bin/`
- [ ] `llm-claims-kb-mentions`/`-ownership` silently check nothing outside
      the fleet root; they should say so, or take a ledger path
- [ ] `~/repo/github.com/bukzor/basedpyright-as-pyright` was cloned only to
      unblock the workspace; it is no longer needed
- [ ] `recover-deadlock-builds-and-snapshotter.md` (still only in this host's
      old `~/.claude/sessions.kb/`) names the user's Steam ID3 in a path, and
      this repo is public: redact it to `<id>` or keep the entry private
      (user's call), then bring it into `buck-win10.kb/`
- [ ] Switch this host's `~/.claude/sessions.kb` to the submodule, as on
      `svelte-crostini`, in sequence with the fold unit's `sessions.kb/` item
