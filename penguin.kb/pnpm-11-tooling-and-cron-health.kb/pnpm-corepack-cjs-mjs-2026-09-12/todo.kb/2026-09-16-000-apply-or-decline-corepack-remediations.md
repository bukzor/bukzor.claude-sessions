---
managed-by: "Skill(llm-subtask)"
status: done
cost-benefit-sweh:
  timebox: 0.25
  benefit-2w: 0.3
---

# Decide whether to apply the corepack remediations

Root cause is confirmed (`../root-cause.md`). Two remediations were
drafted in `../remediations.kb/` and, on user go-ahead, applied and
verified 2026-09-17:

- `remove-obsolete-bin-corepack-wrapper.md` (`git rm bin/corepack`,
  staged not committed)
- `clear-stale-cache-entry.md`

Closeout: end-to-end verification in
`../evidence.kb/2026-09-17-003-post-remediation-verification-fixed-corepack-resolves-pnpm-12-4-1-cron-path-picks-it-directly.md`
confirms the cron-simulated shell now resolves `corepack` to the fixed
binary and it correctly downloads pnpm 12.4.1.
