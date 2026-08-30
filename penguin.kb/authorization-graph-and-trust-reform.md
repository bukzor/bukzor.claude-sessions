---
cwd: /home/bukzor/repo/github.com/bukzor/private.bukzor-llc
session:
  uuid:
    - 850a2b5d-3ebe-4ca2-b1a1-5cd0ca5af7f0
  started: 2026-08-29T14:00:00-05:00
  ended: 2026-08-29T19:29:29-05:00
focus:
  - web-scaling.claims.kb/authorization.md
  - web-scaling.claims.kb/givens.kb/trust-boundary.md
  - meta-reasoning-data.claims.kb/service.kb/access.md
  - docs/dev/devlog/2026-08-29-000-RBAC-as-a-declared-graph--TRUST-reformed.md
---

# Authorization Graph and the TRUST Reform

Unplanned sitting. Opened on GitHub private-repo pricing, turned into
the authorization design: the user's prior-art corp RBAC system (typed
`acl`/`role`/`team` Google Groups, only `acl` referenced from outside)
recovered as theory RBAC under `web-scaling.claims.kb/`, plus the
reform of TRUST that fell out of it.

Started in `~/claude/empty/home`, moved to `private.bukzor-llc` by
`/cd` partway through. Devlog carries the decisions and their declined
alternatives.

## Outcome

Landed across five commits (39cc8d7, 58557a0, d2820c8, 477bd90,
10116b8), all pushed:

- **RBAC theory** — the graph is declared in git, every vendor holds a
  projection; typed tiers, one boundary tier, projectors carrying no
  decisions of their own. Sub-theories: `projection` (what each vendor's
  grants may name, flattening, IDP_PICK), `custody` (governing a
  credential where the action cannot be governed — today CICD's
  Cloudflare token), `recovery` (plural roots, local-only break-glass,
  validator lockout guards, drills).
- **Backblaze** assessed and rejected, with reversal trigger.
- **TRUST reformed** to "one source of truth; one source of RBAC
  super-admin", hosting explicitly not the test. File renamed
  `no-outsourced-trust.md` → `trust-boundary.md`; four references swept.
  Downstream rulings restated on the new grounds, unchanged in verdict.
- **BOOT's ontology repaired** — owned the bare preposition `against`;
  uniquified to `built against`. Fleet trespasses 12 → 2 (both
  pre-existing, in other theories).
- **Zanzibar/ReBAC material** twice demoted, ending as one deferred
  `open` claim beside `service.kb/auth.md`.

## Follow-ups

Both open asks are already in the project's `todo.md`; listed here so
they surface in the inventory:

- [ ] rule IDP_PICK — which identity provider holds human sign-in. Four
      live contenders in
      `web-scaling.claims.kb/authorization.kb/projection.kb/identity-provider.kb/`.
      Turns on whether Cloudflare Access will front anything
      human-facing; if not, AWS-native wins on parts count.
- [ ] rule REVOKE_PATH — how an urgent organizational revocation reaches
      a vendor without bypassing CODE_ONLY's audit trail. Narrowed this
      session: object shares are acts, not pipeline work, so only
      organizational revocation is in scope.

Not tracked as tasks, but worth knowing next time:

The user's standing HIGH item — "revenue-first vs infrastructure — how
deliberate is the detour?" — went unaddressed, and this session is an
instance of it. `REPO_FIRST` (about an hour: `git init` + private remote
for `~/claude/meta-reasoning/`) remains the only item in the picture
that removes an irreversible risk; everything built this session
survives being deferred, and the corpus having one disk does not.

Two pre-existing audit findings were left alone deliberately, both
adjudication-queue rather than errors: `universe` owned by
`bootstrap.kb` but said by `givens.kb`, and `transactor` owned by
`service.kb` but said by `log-primary.kb`. Also `auth.md` names NEXT
without importing WEBSCALE.
