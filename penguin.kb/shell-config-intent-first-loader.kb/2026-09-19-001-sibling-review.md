# 2026-09-19: sibling review -- must-read-sharding, trigger-installation, judgment-protocol-redesign

User suspected overlap; read all four entries and sub-kbs (~52 KB).
Verdict: `must-read-sharding` is structurally the same problem and
patched this session's ledger; the other two touch it at one claim
each. Patches are in `~/docs/dev/sh-config-loading.claims.md` under
"Patch 2026-09-19".

## must-read-sharding -- same problem, different substrate

| there (trigger bank) | here (intent.d) |
|---|---|
| set = dir; `while/X/` nests a set | intent = dir; nesting = prerequisite |
| ENTAIL: member's occasion entails set's | GUARD_MONO: dependency's guard ⊇ dependent's; nesting child requires parent |
| juncture = reserved dir name | context = reserved file name |
| LIST_CMD: one `find -prune` at any depth | RANK loader: one rule at any depth |
| stubs shown | subdirs visible in `ls` |
| ROOT: top set installed by host context | root intent hand-sourced by entry point |
| NOTICED? -- judgment puller per occasion | MECH_PULL -- every guard runtime-decided |
| COMPACTION? -- re-install after reset | REENTRY -- re-run loader at every entry; idempotent legs |

Imported:
- **WHILE_KEY → DIR_IS_INTENT.** They needed the set-vs-namespace kind
  to be path-decidable and reserved `while/` for it. My "intent has
  legs, group has only dirs" was content-decidable. Fix is subtractive:
  every directory is an intent; a legless one is a pure prerequisite
  node. No reserved name needed.
- **NAMESPACE! is per collection class.** "A plain directory is a key
  prefix and nothing more" is ruled for `.kb`; `intent.d` deviates and
  now says so in its ledger.
- **AXIS restated.** My "closed vocabulary on filenames" was
  contradicted by their junctures-as-directories. Precise rule: closed
  vocabulary = reserved names; reserved name is a directory iff it
  contains the open set.

Offered back (not applied to their files -- their session may be live):
- REENTRY as the analogue of COMPACTION?.
- MECH_PULL: a loader where NOTICED is free on every node -- the
  endpoint their GRADIENT describes, running today in ~15 lines.

## trigger-installation -- one shared theorem

The 2026-09-19 ruling (static triggers into CLAUDE.md's own
frontmatter; "CLAUDE.md is a file you load") is ROOT again: the host
installs the top set because nothing inside can. Cross-referenced; no
patch either way.

## judgment-protocol-redesign -- about the agent, not the loader

Its audit: assert leg fires, fold leg doesn't (2/65). This session is
two fold data points on the good side: both concessions ("count
better", "pocket-vetoed") named what arrived and re-derived. Its
proposed pre-commit-at-assertion is what `/formalize`'s `stale when`
already enforces per claim -- the ledger form is the proposal's
existing instance. Its `.kb/03` (mode / criteria / tools, not
procedure) should shape `intent.d/CLAUDE.md` when written.
