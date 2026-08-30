---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills
session:
  uuid:
    - 71a95d3e-f935-42eb-87b4-57c8aa6783cb
  started: 2026-08-29T19:34:57-05:00
  ended: null
---

# Ownership Repair Law — Upstream Veto and the Discovery Gap

Follow-ups left in `bukzor-agent-skills` by the session that wired
`llm-claims-kb`'s ownership scan into
`private.meta-reasoning-corpus/repo-health.sh` and ruled its first two
contentions. Ruling the findings exposed that the *repair* side of the
law was underspecified and, worse, that its agent-facing wording
steered toward the wrong repair. The law changed; the changes are
agent-authored and want the owner's eye.

Commits: `b399b7e`, `ac9c131`, `e50b74d` (all pushed).

- [ ] Veto or accept `EXPANSION` —
      `llm-claims/claims.kb/design.claims.kb/ownership.kb/an-expansion-is-spoken-and-owned-upstream.md`,
      `standing: agent`. It says a minted phrase obliges editing every
      site to say it, and that the surviving entry goes to the
      stipulator the others import. Its directive projection in
      `llm-claims-kb/skill.kb/self-audit.kb/confinement.md` says the
      same to acting agents, so a veto reverts both.
- [ ] Judge the two wording changes that carry it into behavior: the
      `FOUR_POSITIONS` bullet dropped "the two meanings differ" (its
      paired docstring followed), and the scan now prints "one entry
      may lose the word, or the word may be too coarse for both" at
      each contention.
- [ ] Close the bare-`claims.kb/` discovery gap. `Skill(llm-claims-kb)`
      documents `claims.md` + `claims.kb/` as legal and the tool's
      `ledger_roots()` globs `*.claims.kb` only, so it cannot find one
      — 21 such directories exist fleet-wide, and the corpus repo
      carries `lib/verify-ownership.py` solely to supply the discovery
      the tool lacks. Not a one-line glob: a bare ledger holding a
      nested `<subject>.claims.kb/` would be found twice, and
      `ledger_of` would then disagree with discovery about which is the
      namespace — which decides whether a shared word is a legal
      foreign double or a failing contention.

Known defect in the record, needing no action but no surprise either:
commit `ac9c131` carries three hunks of another session's in-flight
`llm-claims-kb/SKILL.md` work (a `todo: true` table row, the policy
schema paragraph, the bare-`claims.kb` naming case) under a message
about confinement. `git add <path>` stages a whole file, and this
worktree had a concurrent session in it. Nothing was lost and history
was not rewritten; the attribution is simply wrong.
