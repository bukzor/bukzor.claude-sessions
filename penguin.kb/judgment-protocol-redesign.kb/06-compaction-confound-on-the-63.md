# Were the 63 no-read folds recall misses, or delivery holes?

Posed 2026-09-19, unruled; empirical.

`must-read-sharding.kb/2026-09-19-000-formal-ledger.md` COMPACTION?:
after context compaction nothing re-installs the bank listing. By
RECOG, a trigger whose listing line is not in context cannot fire at
all. The audit counted 63 concession turns with no read nearby but did
not check whether the listing was installed at each one.

`trigger-installation.md` (a9fd5254) adds a second hole: *never
installed*. The audit window straddles its 09-04 CLAUDE.md rewrite
(`4614693`), after which the installer's first-call fire rate fell
(sonnet 5/7 plain, 0/2 skill-first). So the split is three-way --
never installed / installed then compacted away / installed and
present -- and only the last bucket is a NOTICED miss. They call for
different fixes. Pre-commit survives either way
-- the disconfirmer clause is in the prior turn, not in a listing --
but the number attributed to NOTICED is unknown.

Test: for each of the 63, was the bank ever listed in that context,
and if so was there a `compact_boundary` between the listing and the
concession? Same corpus, same sub-agent
shape as the assert-leg miss-rate test (01-); run them together.
