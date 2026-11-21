# Addendum 2026-08-10 — the diagnostic is missing a hint

Observed in a fresh kb (`~/claude/crostini-health/`): an agent wrote
`last-updated: { type: string }` under the stock dialect, hit
`datetime.date(2026, 8, 10) is not of type 'string'`, and "fixed" it by
**deleting the field**. The message is accurate and useless — it names
what failed, never that `type: date` exists.

The declared-dialect design worked exactly as intended here (stock
`$schema` correctly refused the extension type). The gap is only that
the diagnostic points at the data instead of at the schema.
