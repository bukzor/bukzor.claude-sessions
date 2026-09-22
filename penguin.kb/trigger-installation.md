---
cwd: /home/bukzor
session:
  uuid: # chronological; append your uuid when picking this entry up
    - a9fd5254-2b3d-4e9e-9c19-9ec328b2a766
  started: 2026-09-16T13:42:35-05:00
  ended: null
---
# Trigger Installation — Why Step 0 Didn't Fire, and Where Static Triggers Belong

A wrong refusal ("won't amend/reset without your say-so" on a
`git-caution: personal` repo) traced back to two things: a blanket git-safety
line in the user's own patched Bash tool stub, and an agent that never ran
`must-read://~` in three context windows despite the requirement sitting
verbatim in `~/.claude/CLAUDE.md`. The stub line is removed. The rest of the
session is a discussion -- no files changed -- of *why* the static trigger
didn't fire and how to restate it so that it does. This session started as
`/incident-forensics` on `pnpm-upgrade-g`; that half is filed under
`pnpm-11-tooling-and-cron-health.md`.

Evidence with line cites into the transcript: `trigger-installation.kb/`.
Two peers are live on the same subsystem: `must-read-sharding.md`
(`while/` trigger sets; formal ledger) and `judgment-protocol-redesign.md`
(one bank entry audited over 18 days). Cross-read in
`trigger-installation.kb/2026-09-19-001-peers-cross-read.md`; summary under
"Overlap with peers" below.

## Findings

- **The requirement was in context, verbatim, at the first tool call.** The
  `instructions` attachment carried `~/.claude/CLAUDE.md` with
  `0. statically: before: your first tool call / read: must-read://~`. The
  harness system prompt mentions neither `must-read` nor `llm-must-read-ls`;
  it does carry a competing first-tool-call rule ("state in one sentence what
  you're about to do"), which also went unmet.
- **Installation source 3 displaced source 0.** The skill body lands as a
  *user-role* record immediately after the prompt, opening with
  `triggers: - read: - Skill(llm-kb) …` -- same grammar as step 0, nearest in
  context, task-specific, bare (no stated occasion). The first thinking block
  is about *those* triggers and forms the plan from them; step 0 is never
  retrieved, weighed, or rejected. One "what must I read first?" retrieval
  happened and the nearest source answered it.
- **Never recovered.** Three compaction boundaries, CLAUDE.md re-injected each
  time, listing never run. The only `before/git/` reads in 131 Bash calls
  came in direct response to the user's "you didn't read the must-read/git?".
- **Fire rate at tool call #1, last 45 days, by CLAUDE.md wording** (sessions
  whose `instructions` attachment carried the wording; compaction
  continuations excluded):

  | wording                                                     | plain prompt        | skill-first (`/cmd`) |
  | ----------------------------------------------------------- | ------------------- | -------------------- |
  | old: `> IMPERATIVE: FIRST tool use MUST be ls -RF …`        | 22/22               | 7/7                  |
  | new (`4614693`, 09-04): `0. statically: before: … read: …`  | fable 19/19, opus 12/14, sonnet 5/7 | sonnet 0/2 |

  Both skill-first failures are sonnet; this session ran on sonnet until
  09-19. n=2 can't separate model from prompt shape.
- **What the 09-04 rewrite dropped, besides volume:** the enumeration verb.
  Old text: *"While planning, before taking ANY action, review **all three**
  trigger banks."* New text: *"Continually monitor…"* -- a standing state with
  no moment to fire at, followed by a numbered list of *sources* in which item
  0 is the only actual *trigger* (category mismatch: a reader parsing the list
  as taxonomy has no reason to execute item 0).
- **Two distinct things, previously conflated (by me):** the one-shot
  installer (occasion: first tool call; action: list the on-disk bank) and
  the recurring review (each turn, sweep everything installed to decide which
  occasions this turn's plan reaches). The review is what
  `llm-triggers/design.kb/040-design.kb/sweep.md` calls the zero-sweep floor.
- **Placement is ruled out as the variable.** CLAUDE.md-resident wording hit
  30/30 across models and prompt kinds before 09-04. An earlier proposal to
  put a `must-read.kb/before/git` pointer in the mitmproxy Bash stub was made,
  applied, and reverted; the data says wording moved, not attention locus.
- **Harness supplies the date.** A `date` attachment arrives every turn and
  flags rollover (`"changed": true`); clock time is not supplied.
- **Schema.** `triggers-field.md` admits one directive key, `read:`, under a
  juncture (`before:`/`when:`/`after:`; `at:` for time-points);
  `llm-triggers-lint` warns `no-read` on anything else.

## Rulings

> [!@bukzor] 2026-09-18 -- the mitmproxy Bash stub's blanket git-safety line
> ("never … `reset`/`commit --amend` … unless explicitly requested") is
> removed; `reference.kb/git/commit.md`'s caution-graded policy is the sole
> authority.

> [!@bukzor] 2026-09-19 -- static triggers move into `~/.claude/CLAUDE.md`'s
> own frontmatter (option B): CLAUDE.md is a file you load, so its
> `triggers:` are installation source 3 like any skill's; the numbered list
> becomes pure sources. "Before your first tool call" is the one-time
> installer occasion only; the each-turn review is a separate trigger.
> Explicitly-requested tool calls (`Bash(date -I)`, `! cmd`) do not require
> `must-read://~` first. Mechanizing step 0 via SessionStart hook stays
> declined: some sessions have no tool calls and no need for the bank.

## Proposal on the table

> [!DRAFT] agent-authored 2026-09-19, vetoable

```yaml
--- # workaround: anthropics/claude-code#13003
triggers:
  - before: your first unrequested tool call
    read: must-read://~
  - when: planning a turn
    read: must-read.kb/when/planning-a-turn/review-installed-triggers.md
---
```

Body loses "Continually monitor…" and item 0; heads the list `### Sources`
(1–3; drop deprecated 4). The review directive lives as a bank entry so the
schema stays `read:`-only; `sweep:` is the named successor verb if sweep
machinery is ever built. Time Awareness drops *Session start* (harness
supplies the date); the two judgment-shaped occasions stay prose.

## Overlap with peers

Adopted from `must-read-sharding`: ROOT (installer must be host context --
B complies); BEGIN_AT_DECISION (settles the juncture: `when: planning a
turn`); COMPACTION? is the same question as open item 1 below -- this
session is its worked instance. From `judgment-protocol-redesign` `05-`:
the four 09-02 `/align` turn-1 sweeps it counts as over-triggering are in
this session's old-wording 7/7 cohort -- the IMPERATIVE stanza bought
install rate with eager over-reads, so the review directive must say
*review the listing; read only what this turn reaches*.

A fourth peer, `shell-config-intent-first-loader` (`df89c432`), reviewed
this entry 2026-09-19 and adopted the frontmatter ruling as ROOT's shell
analogue ("no patch"); its REENTRY is COMPACTION?'s analogue and its
MECH_PULL is the same endpoint as the hook-backstop claim below. No
conflict. `decide-the-inbound-peer-message-channel` is the standing
decision behind this section's files-not-messages posture.

Claims that extend theirs, for the user (not sent):

- MODE_MISS says noticing is governed by mode, not layout. This session is
  a miss *in deliberating mode* (`L22`); host-stanza wording is a third
  variable, 30/30 → sonnet 5/7, 0/2 after `4614693`.
- Their `06-` test (compaction-lost listing as a delivery hole on the 63
  folds) omits a second hole: *never installed*. Audit window straddles
  09-04. Split should be three-way.
- GRADIENT/BACKSTOP (`07-`) reframes a `PreToolUse` first-call hook
  injecting the listing as the prescribed backstop for step 0 -- it fires
  only when a tool is called, which is the objection to `SessionStart`.
  Needs a ruling.

## Open questions

- Compaction: **deferred 2026-09-22 to
  `must-read-sharding.kb/2026-09-22-000-decision-after-compaction.md`**,
  which poses (a) per-context-window wording and (b) a `SessionStart
  compact` hook as one `ruling:` file; a ruling there binds here. I added
  the "unrequested" qualifier from the 09-19 LITERAL ruling in that file.
  History of the question, for the record: "your first tool call" was
  literally satisfied once and stayed dark through three re-injections.
  (= `must-read-sharding` COMPACTION?.)
  Candidate answer on disk, not ruled -- `must-read-sharding.kb/
  2026-09-19-003-shell-loader-peer.md` REENTRY+, attributed to
  `shell-config-intent-first-loader` (`df89c432`), relayed by peer message
  14:34 and verified: the installer's occasion is *entry into a context
  window* (session start and every post-compaction resume); installing is
  idempotent, so re-running costs one listing and needs no state. Draft
  occasion would read `before: your first unrequested tool call in this
  context window`. Same file's `-002` TOP_PULLER+: the mechanical form is
  `SessionStart` matcher `compact` (compaction implies an active session)
  plus a `PreToolUse` first-call hook -- both dodge the no-tool-calls
  objection. Ruling is mine to bring to the user; it is theirs to make.
- `-002` VOCAB (restated) asks that the `while/` recognition line live in
  the review directive's body, not CLAUDE.md prose, since that body is what
  the agent has open when scanning a stub -- and prose "standing state" is
  the shape that measured 5/7. If adopted, CLAUDE.md carries only the two
  static triggers and the "land as one change" want collapses to one file
  plus one bank entry.
- ~~Juncture for the review~~: `when: planning a turn`, by
  BEGIN_AT_DECISION. Recurrence still has no assigned desc form; prose.
- Does `llm-triggers-lint` know the `must-read://` scheme, or will it warn
  `unresolved-read`? Unverified.
- Cause split: is the skill-first failure sonnet-specific or wording-general?
  Discriminating cohort -- fable/opus skill-first under current wording -- has
  n=0 so far.
- Whether `llm-must-read-ls` should print `date -Is` as its first line (gets
  clock time for free); probably not worth it.

## Live follow-ups

- [ ] Apply the frontmatter proposal to `~/.claude/CLAUDE.md` once the open
      questions above are settled; run `llm-triggers-lint ~/.claude`
- [ ] Write `must-read.kb/when/planning-a-turn/review-installed-triggers.md`
- [ ] Re-measure fire rate after the change (script in the companion kb)
- [ ] Commit the stub-line removal in dotfiles:
      `.config/claude-mitmproxy/tool-description.d/Bash/{description,README}.md`
      (both were already `M` before this session; bundle with care)

## Addenda

`trigger-installation.kb/` -- the transcript archeology with line cites and
the fire-rate measurement method.
