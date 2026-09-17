---
status: done
requires-sudo: false
---

# Remove `prefix/pnpm/bin/` from `~/.envrc`'s `path_add` call

`~/.envrc` is brand new and uncommitted (no history to explain the
choice) and named two things in one `path_add PATH` call: `.venv/bin`
(a project-local venv -- legitimately direnv's job, since it should
apply only within this tree) and `prefix/pnpm/bin/` (a global tool
location that `~/.config/sh/env.d/900-path.sh` already puts on PATH
unconditionally, for every shell, direnv or not). The second entry had
no reason to be tree-scoped; its presence was what caused
`../findings.kb/direnv-masks-the-bug-by-reordering-path.md` --
direnv's `path_add` re-prepends unconditionally, producing a duplicate
and inverting `900-path.sh`'s deliberate `~/bin`-before-`prefix/pnpm/bin`
order whenever direnv's hook had fired.

Rejected alternative: routing `.envrc` through `900-path.sh` itself
(re-sourcing the whole global list on every direnv hook). Rejected
because `900-path.sh`'s entries are supposed to be unconditional
already -- mediating them through direnv would make them conditional
for no benefit, and wouldn't establish the actual invariant needed.

Invariant going forward: a global tool directory lives in
`900-path.sh` only; a tree-scoped directory lives in `.envrc` only.
Nothing should appear in both.

Applied 2026-09-17:

```diff
 path_add PATH \
   .venv/bin \
-  prefix/pnpm/bin/ \
 ;
```

then `direnv allow .` (required after any `.envrc` edit). Verified
(`../evidence.kb/2026-09-17-004-post-envrc-fix-verification-...md`):
`prefix/pnpm/bin` now appears exactly once, after `~/bin`; `.venv/bin`
scoping is untouched.
