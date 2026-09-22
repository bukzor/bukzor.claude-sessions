---
cwd: /home/bukzor/.claude/must-read.kb
session:
  uuid: # chronological; append your uuid when picking this entry up
    - ba648ef5-714c-48cb-9a61-bc40f9e2e421
  started: 2026-09-18T10:27:26-05:00
  ended: null
---
# Must-Read Sharding — `while/` Trigger Sets

Discussion-only session (no files changed) that took "my must-read.kb feels
monolithic; shard it" through a skeptical debate to a settled grammar, then
`/formalize`d it into a claim ledger. The ledger is the durable output:
`must-read-sharding.kb/2026-09-19-000-formal-ledger.md`. This file is the
short account plus what's still open.

## Conclusions

- **A bank is a tree of trigger sets indexed by occasions.** A set is
  installed (listed) when its occasion begins; every member's occasion
  entails its set's. The bank itself is the set at ⊤ ("while anything"),
  installed statically by CLAUDE.md because recognition can't be gated.
- **Fourth juncture `while/`.** `while/X/` holds a set with the same
  shape as the bank (`before/ after/ when/ while/`), recursive without
  limit: `while/making-code-changes/before/writing-python-code.md`. Point
  junctures hold files under plain namespace directories (`before/git/`);
  `while/` holds sets. That path-decidable distinction — namespace dir vs
  set dir — is what `while/` is for; the interval-vs-point gloss is true
  but not load-bearing.
- **Order is occasion-first.** "before going outside, while it's raining"
  reads wrong and English rescues it with "if"; "while it's raining,
  before going outside" reads fine. The awkwardness diagnosed the order,
  not the word.
- **One listing command, any depth:** `find SET -path '*/while/*/*' -prune
  -o -print` — sub-sets print as stubs. `llm-must-read-ls` survives as the
  single named instance of that prune. Stubs are shown: expanding one early
  costs exactly today's eager listing; omitting it breaks recognition.
- **GATE-RULE** (accepted `!`): an occasion may head a set when (1) every
  member entails it, (2) its begin is noticed at least as reliably as each
  member's — broad and concrete, an action or tool, never a mood, (3) it
  begins no later than the earliest member fires. (1) and (3) are laws;
  (2) is the one judgment left, and llm-triggers is the theory of retiring
  it occasion by occasion with mechanical pullers (hooks) — as backstops
  where a set has `before/` members, since a hook on the action fires
  after planning.
- **Economics — on cost and precision, not recall.** The sibling audit
  (`judgment-protocol-redesign.md`, 12/15 assert vs 2/65 fold on the same
  listing line) shows the observed miss is agent state or an absent
  listing (compaction), neither a function of where a trigger sits;
  this session's "recall miss in a flat list" is retracted, and the
  recency/JIT argument conceded in debate is unsupported. A set earns
  its place on shorter top listing, clustering, and one precision fix
  (turn-1 sweeps can't reach a set's members), when its occasion holds in
  a minority of sessions and heads ≥3 triggers. On today's bank that is one
  set — `while/making-code-changes/` (python, rust→`writing-rust-code`,
  bash-scripts + template, tests, plus `before/making-code-changes.md`
  moving in as `before/ANY-code-change.md`). `git/`,
  `using-claude-code-tool/`, `lazy-loading/` stay namespace nesting;
  `stripe` goes to its project bank. Top listing 34 → 29 + 1 stub.
- **LLMKB-SUBDIRS** (plain dirs are transparent S3-style key prefixes)
  agreed; prefix semantics are per collection class; the must-read spec
  line "the trigger slug, not the directory shape, carries the
  categorization" is struck.

## Debate record, for the next agent

Skeptic's original claim `P(gate) × P(entry)` was retracted (it assumed
per-trigger recall constant across contexts); the user's recency/JIT
argument stood in the debate and fell to the sibling audit afterward —
both sides were arguing a variable the evidence doesn't implicate.
Skeptic's "no new gates ever" was impeached (a proxy for
recall dominance that would prohibit its own instances). Advocate's
strongest plank: a set moves classification from runtime to authoring
time. Candidates killed in `/formalize`: fibration (no restriction maps),
Galois connection (no adjoints used), namespace-as-meet (`git` isn't an
occasion on its own; meet lives at nested sets only).

## Open

- [ ] File the ledger to disk: new
      `bukzor-agent-skills/llm-must-read-kb/claims.kb/design.claims.kb/`
      shaped like `llm-kb/claims.kb/`; NAMESPACE goes to
      `llm-kb/claims.kb/design.claims.kb/`. `Skill(llm-claims-kb)`.
- [ ] Migrate `~/.claude/must-read.kb` (after COMPACTION below): create
      `while/making-code-changes/`, move the five, rename rust, move stripe
      to its project bank; update `llm-must-read-ls` to the prune; put the
      recognition line ("a `while/X/` line is a set: when X begins, run
      `llm-must-read-ls` on it") in the per-turn review directive
      `trigger-installation.md` proposes, not in CLAUDE.md prose (`.kb/-002`
      WORDING); strike the slug line from `llm-must-read-kb/SKILL.md` and
      document `while/`.
- [ ] NOTICED? — which occasions are noticed reliably enough to head a
      set; measurable via `Skill(claude-code-archeology)`, occasions vs
      installs.
      One occasion measured 2026-09-18 (`judgment-protocol-redesign.md`,
      session 93639e4d): the assert/concede file has two NOTICED values
      in one listing line — assert high (12/15 self-narrated), concede
      2/65 — and COMPACTION? is a confound on the 2/65 (its `.kb/06-`).
- [ ] COMPACTION? — after context compaction nothing re-installs the top
      set. Sets add no structural burden: re-installing ⊤ restores the
      stubs and the per-turn review re-notices them (`.kb/-002`
      COMPACT_REINSTALL). The migration is gated on the top-set
      re-install, which `trigger-installation.md` owns (`SessionStart`
      `compact` matcher or per-context-window wording; ruling pending).
- [ ] SET_DESC? — a set is a directory, so it has no frontmatter to carry
      the decidable condition a mechanical puller (llm-triggers) needs.
      Candidates: `while/X/.trigger.yaml`, or admit `while/X.md` as a
      descriptor (not a trigger body), which would amend RESERVED.
- [ ] GIT_SET? — does `git/` earn a set once it has an `after/` member?
- [ ] RESOLVER? — whether `must-read://` takes a set path; cosmetic.

## Addenda

`must-read-sharding.kb/` — dated write-ups; `ls` for the list. -000 is
the full `/formalize` ledger with the llm-triggers patch applied; -001
patches it against `judgment-protocol-redesign.md` (recency retracted,
MODE_MISS); -002 against `trigger-installation.md` (WORDING as a third
miss variable, COMPACTION shrunk to the top set, VOCAB relocated to the
review directive); -003 files the shell-loader peer's offers
(`shell-config-intent-first-loader.kb/2026-09-19-001-sibling-review.md`:
REENTRY as the per-context-window installer, MECH_ENDPOINT as GRADIENT's
worked endpoint). Four live sessions on one subsystem, cross-patching
through the filesystem; each parent entry points at the others.

## Delete When

The migration and the ledger filing are done and NOTICED/COMPACTION have
moved to `llm-must-read-kb`'s own todo or claims.
