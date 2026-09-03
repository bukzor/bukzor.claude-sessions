---
cwd: /home/bukzor/repo/github.com/bukzor/bukzor-agent-skills
session:
  uuid: # chronological; append your uuid when picking this entry up
    - 6d3bc4ca-86d0-45fa-b33f-4d29c2527f86
  started: 2026-09-01T16:46:08-05:00
  ended: null
---
# Build the Mention-Gate Reform

Builds the four items under "Build the mention-gate reform once its open
policies rule" in `llm-claims-kb/.claude/todo.md`, against the policy
claims laid down 2026-09-01 in llm-claims'
`design.claims.kb/notation.kb/`. Two landed this sitting: the
two-character floor mirrored into the mention regex, and the census
blindspot that kept defining-claim prose out of every scan (findings
1 -> 5).

- [x] Rule BACKTICK_SCOPE — the one open gating the rest. Ruled
      2026-09-03: a backtick exempts nothing, in both scans. The owner
      returned it as a fact rather than a choice ("this was decided by
      measurement already"), and they are right: NON_CLAIM_TOKENS had
      already priced a list entry, which makes the comparison a
      computation. Asking it was MALFORMED's first malformation, and
      the second time this arc that the method caught the defect and
      the author shipped the question anyway
- [x] Then invert the gate and seed the `non-claim-tokens:` lists.
      Built and pushed 2026-09-03 (b7bc03b): the field is on the
      schema and in `ledger.py`, a claim reads its own theory's list
      and its containers', the fleet lookup is demoted to the
      "defined in X" hint. Seeded at 41 tokens over 23 lists, 34
      confined to one ledger
- [x] Answer the owner's impeachment of the ownership measurement.
      "Seven vs eight trespasses" counted rows from `trespasses()`,
      which groups per (word, owner), not findings. Re-measured as
      findings: 7 -> 8, one newly flagged, none dropped — and the one
      is a false positive, `principles.kb/` read as *principle*. The
      owner's bet ("plenty that's real and ignored") is falsified:
      the scans read disjoint vocabularies, citations being upper-case
      labels that prose backticks freely and stipulations lower-case
      English that it backticks only inside paths. Their universal
      still entails the change on its own

- [x] Import the five citations the inversion surfaced. Owner's word,
      2026-09-03: "go ahead and add the necessary why's — i'll review
      for minimality separately." EXTEND takes MIGRATION, ENGINE takes
      NOTATION, GRAIN takes DATA_REPRESENTATION, CONSTITUTION and
      SCALAR (80eb03c). The mention scan now reports zero fleet-wide

- [x] File the owner's sharpening of WHY_IS_FUSED, 2026-09-03: when
      the two lenses of a `why:` disagree, that is a problem wanting a
      solution, and the directions are not symmetric. Support with no
      mention "sounds impossible"; mention without support happens and
      has four repairs, in their order. WHY_IS_FUSED carries the
      quote in `authority:` and the two directions in its body;
      IDLE_UNDECIDABLE went `bare` -> `open`, its premise (support
      riding the arrow with no lexical trace) recorded as contested;
      IDLE_TEST lost "or by nothing at all"

The principle applied back to this batch: the idle growth is a scan
bug, not queue noise. The scan reads two channels — stipulated words,
interior `why:` — and the owner's test reads a third, prose naming the
prior's claim labels, which `mentions.py` now computes exactly. Fusing
it makes "idle" mean the impossible case, hence always a repair. Read
under that test, both new GRAIN idles are healthy.

Left open, in `llm-claims-kb/.claude/todo.md`:

- Minimality of those five imports — the owner reserved that review.
- Fuse the mention channel into the support lens. Proposal; awaiting
  the owner's go-ahead, and IDLE_UNDECIDABLE stays `open` until it
  lands.
- A reading queue for the owner's second case — mention without
  support — which nothing sees today: the vocabulary lens fires on the
  mention, so the import reads healthy by construction.

One edit sits in another session's staged file:
`docs/dev/claims.kb/design.claims.kb/adjudication.md` gained
`non-claim-tokens: [HOMES]`, deliberately left uncommitted with the
rest of their adjudication work.
