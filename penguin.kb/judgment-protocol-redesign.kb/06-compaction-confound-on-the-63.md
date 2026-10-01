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

## Measured 2026-09-22 -- delivery is not the cause

Of the 60 no-read concessions: **PRESENT 52**, COMPACTED-AWAY 7,
NEVER-INSTALLED 1. In 87% the bank listing -- with this entry's
filename naming the exact occasion -- was in the same context era.
Firing failure, not installation failure. Several PRESENT cases read
*neighbouring* entries in the same session (`before/git/commit.md`,
`before/running-ANY-...`) and still not this one.

The 09-04 hypothesis (installer rewrite lowered install rate) has n=1
in this population (`a9fd5254:662`, sonnet, skill-first). The 7
COMPACTED-AWAY are all on/after 09-04, all opus-5 plain sessions --
long sessions hitting compaction, not a CLAUDE.md regression. The
model/skill-first cross-tabs have no base rate (53/60 opus, 50/60
plain). PRESENT is an upper bound on what the model saw
(microcompaction is invisible in JSONL).

Resolved: closed. The three-way split was worth running and it
removed a confound from the 2/65 -- the number is NOTICED, not
delivery.

## Measured 2026-09-22

Recount under the same definition: 61 concession turns, 4 with a read,
**57 without** (the prior 65/63 was matcher detail). Split of the 57:

| never installed | 3 (5%)  | 0 opus / 2 sonnet / 1 haiku; 2 skill-first |
| compacted away  | 7 (12%) | all opus, all post-09-04 |
| present, did not fire | **47 (82%)** | 45 opus, 2 fable |

All 22 pre-09-04 concessions are "present". The pre/post split is not
demonstrated (only opus has pre-09-04 mass; n=3 on never-installed).
One false positive removed: `gitStatus` in the session attachment
currently lists the entry as modified, which is not a bank listing.

**Resolved: the fold miss is a NOTICED deficit, not a delivery hole.**
47 of 61 (77%) had the trigger name in context and did not fire.
Caveat: "in context" does not model distance; a listing hundreds of
records back is nominally present and practically gone.