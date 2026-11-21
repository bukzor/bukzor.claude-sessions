---
managed-by: Skill(llm-subtask)
status: open
---

# Migrate append-style session entries to dated addenda

Several multi-session entries grew by appending one dated section per
pickup to `$slug.md`. Skill(llm-sessions) → "Entry shape" is the rule:
`$slug.md` holds live status, edited in place; each pickup's write-up is
one file in `$slug.kb/`. Migrate the entries that grew the other way, and
retarget the per-entry addenda `CLAUDE.md` files whose pointer named the
section removed from the root `CLAUDE.md` in c22c645.

Success: every entry below has no per-pickup sections left inline; every
`- [ ]` line that existed before still exists, in `$slug.md`;
`llm.kb-validate .` is clean; no addenda `CLAUDE.md` cites
"Lifecycle → Growing Entries".

Coordination: Skill(subagent-handoffs); units in
`2026-11-21-000-migrate-append-style-entries.kb/`.

## Wave 1 (all parallel)

- [x] [001](2026-11-21-000-migrate-append-style-entries.kb/2026-11-21-001-kb-dynamics.md) `kb-dynamics-ledger-debt-harness`
- [x] [002](2026-11-21-000-migrate-append-style-entries.kb/2026-11-21-002-jsonschema-ref-rollout.md) `jsonschema-ref-rollout-beyond-todo-ideas`
- [x] [003](2026-11-21-000-migrate-append-style-entries.kb/2026-11-21-003-chatfs-and-pnpm.md) `chatfs-cli-mockup-open-todo-sweep`, `pnpm-11-tooling-and-cron-health`
- [x] [004](2026-11-21-000-migrate-append-style-entries.kb/2026-11-21-004-deadlock-vis-and-tmux.md) `buck-win10.kb/deadlock-vis-app`, `tmux-window-naming-and-alert-identity`
- [x] [005](2026-11-21-000-migrate-append-style-entries.kb/2026-11-21-005-three-small-entries.md) `decide-the-inbound-peer-message-channel`, `sttt-support-button`, `yaml-date-jsonschema`
- [x] [006](2026-11-21-000-migrate-append-style-entries.kb/2026-11-21-006-retarget-addenda-pointers.md) retarget 14 addenda `CLAUDE.md` pointers

## Wave 2

- [x] [007](2026-11-21-000-migrate-append-style-entries.kb/2026-11-21-007-leftovers.md) a stray `Part of` line (chatfs); sttt's PLACEHOLDER item ticked (366a993)
- [x] [008](2026-11-21-000-migrate-append-style-entries.kb/2026-11-21-008-chatfs-next-items.md) four open items in a chatfs addendum: all already done

Considered and left alone: `confidence-walk-2026-08-21` (its sittings are
a plan, not a log), `agent-harness-design` and `judgment-protocol-redesign`
(one dated paragraph each).
