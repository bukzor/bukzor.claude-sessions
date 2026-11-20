# Findings (review and trigger-bank session 1b724c86, 2026-11-15..20)

- Commits 509ca6b (describeSet refactor), 5a4a6da (six tripwires), 6d379ac
  (the trigger bank and its ledger adjustments), pushed.
- A bank is listed from the directory of the `CLAUDE.md` holding its stanza,
  never the session cwd; `llm-must-read-ls` reading only its argument is
  right. Parent banks cascade through ancestor `CLAUDE.md` loading, so the
  script needn't walk up (that would double-list `~`).
- `git commit-files ... -- -F -` drops stdin ("empty commit message"); use
  `-F <file>`.
