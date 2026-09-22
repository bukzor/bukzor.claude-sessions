# 2026-09-19: third peer — installer wording is a variable; COMPACTION shrinks

Source: `../trigger-installation.md` (session `a9fd5254`, live), which
cross-read -000/-001 and `judgment-protocol-redesign.kb/06-,07-`. Its
data: the CLAUDE.md installer stanza fired 30/30 under the old imperative
wording and sonnet 5/7, skill-first 0/2 under the 09-04 rewrite -- a miss
in deliberating mode, so MODE_MISS is not the whole account. Its ruling
(user, 2026-09-19): static triggers move into CLAUDE.md frontmatter; the
first-tool-call installer and a per-turn review are two triggers.

Patch to -000/-001 (restating supersedes; unmentioned claims stand):

```
* FIRING+
  * WORDING+ <- MODE_MISS: a begin-notice is taken when its directive
    names a moment and an imperative ("before your first tool call, run
    X"), and dropped when it names a standing state ("continually
    monitor") -- 30/30 vs 5/7 on the one installer measured. Third
    variable beside mode and delivery; orthogonal to layout. Stale when:
    a moment-plus-verb directive misses at the old rate.
  * VOCAB (restated) <- RECOG WHILE_KEY WORDING: the recognition line for
    stubs -- "a `while/X/` line is a set: when X begins, run
    `llm-must-read-ls` on it" -- lives in the per-turn review directive
    (`when/planning-a-turn/review-installed-triggers.md` in the sibling's
    draft), because that body is what the agent has open at the moment it
    scans a stub; it carries a moment and a verb per WORDING. CLAUDE.md
    carries only the two static triggers. Declined: a Definitions line in
    CLAUDE.md prose (a standing state, the shape that measured 5/7).
  * COMPACT_REINSTALL <- ROOT STUB_BOUND: re-installing the top set after
    compaction restores every stub, and the per-turn review re-notices any
    set whose occasion still holds; sets therefore add no structural
    re-install burden beyond the top set's. What remains is NOTICED in a
    post-compaction, mid-flow state (MODE_MISS territory), per set.
    * // retracts -001's "sets widen the hole from one re-list to n".
  * TOP_PULLER+ <- GRADIENT COMPACT_REINSTALL: the top set's puller can be
    mechanical -- `SessionStart` with the `compact` matcher re-lists after
    every compaction, and a `PreToolUse` first-call hook installs on the
    first unrequested tool call. Neither meets the objection to a plain
    `SessionStart` (sessions with no tool calls have no need of the bank):
    compaction implies an active session, and PreToolUse fires only on a
    call. Ruling is the user's; the sibling has it on the table.

* QUESTIONS+
  * COMPACTION? (restated): after compaction, what re-installs the top
    set? Sets are out of the question by COMPACT_REINSTALL. The migration
    is gated on the top set's re-install (TOP_PULLER or a wording fix that
    fires per context window), not on anything set-specific.
    * // MIGRATE_ORDER+ (restated): gate is the top-set re-install, which
      the sibling owns as its open item 1.
  * NOTICED? (restated): occasions vs installs, split by mode at begin
    *and* by directive wording (moment+verb vs standing state) -- two
    variables, both measured once, on the same corpus.
```

Carried from the sibling, for the record:

- `06-`'s test should split three ways: compaction-lost, never-installed
  (audit window straddles the 09-04 wording change), mode miss.
- Its ruling that explicitly-requested tool calls (`! cmd`, `Bash(date)`)
  need no prior install is consistent with ROOT: the installer's occasion
  is "first *unrequested* tool call".
- The four 09-02 `/align` turn-1 sweeps in `judgment-protocol-redesign
  .kb/05-` sit in the old-wording 7/7 cohort: the imperative stanza bought
  install rate with eager over-reads. ECONOMICS' precision term (sets are
  unreachable by a sweep) is the structural half of the fix; the review
  directive's "read only what this turn reaches" is the other.
