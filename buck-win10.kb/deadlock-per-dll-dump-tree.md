---
cwd: /home/bukzor/claude/deadlock
session:
  uuid:
    - 86b7ac8f-b5be-4efc-87c2-27f2143435f8
    - 97605ccb-7e13-403d-97ab-c42fbfe97141
  started: 2026-11-08T18:26:31+00:00
  ended: 2026-11-10T19:52:00+00:00
---
# Deadlock: Per-DLL Data Store (first purpose: convars, concommands)

Build a lossless, purpose-neutral store of data about every game DLL:
`data/dlls.list` → `data/dlls/<facet>/<dll>.json` (one process per facet ×
DLL; facets `file`, `load`, `convars`, `concommands`) → `data/dlls/<facet>.tsv`
(lossless aggregates, all four committed). **Built and passing its success
criteria on 6860** (commit `83b8643`): checks in `data/dlls.check/`, registry
readback matches for server and client, reading views `data/convars.md`,
`data/concommands.md`, `data/dlls/load.tree.txt`.

Plan: /home/bukzor/claude/deadlock/.claude/todo.kb/2026-11-05-000-per-dll-dump-tree.md
Design: /home/bukzor/claude/deadlock/docs/dev/cvar-dump.kb/ (start at `output-views.md`)

History: session 2ac92f5f (2026-11-05) mapped the problem and proved the
`ICvar` hook; 1311e5c2 (2026-11-08) componentized the plan (`fd021a3`);
86b7ac8f (2026-11-08) walked the user through the dataflow, then re-shaped it
at the user's direction from a convar-tuned dump into the lossless facet store
(atomic production, facet-first tree, membership-only root), with measured
overheads (`docs/dev/probes/load_time.py`, `pe_size.py`, build 6860).
adef7db2 (2026-11-08) closed the `index` question (`6c0550f`): queue index
is never stored; it is row/list position (TSV sorted by module, then queue
order), checked by a test.

Session 155b400d (2026-11-09/10) reviewed the whole store, found it sound,
fixed the doc/consistency drift, and renamed the per-DLL key `module` →
`dll` across TSVs, JSON documents, code and docs (`21fe9ce`). Review
findings not yet acted on, each a candidate todo.kb entry:

- [ ] `load.tsv` depends on the host's Python: `modules` is `after − before`,
      so runtime DLLs python.exe already holds are omitted; a Python upgrade
      changes a committed view. Fix: static import closure from the `pe`
      facet, with `load` carrying only the outcome
      (024's import-closure deps read `modules` too, so they inherit this gap)
- [ ] A missed queue is silent (empty document); only engine2/client/server
      coverage and `git diff` catch it. Pin the set of queue-carrying DLLs
      as a check
- [ ] Every Windows atom depends on every `src/dllscan/*.py`; split per facet
      (`load` needs only `win32` + `__main__`)
- [ ] `data/dlls/file/default.json.do` still repeats `bin/winpy-facet.bash`'s
      `lookup` lines with its own module list (023's Open Questions)

Session 73d94314 (2026-11-09/10) coordinated the rest through sub-agents,
one handoff file each in the plan's `.kb/` (022-028, 2026-11-10-000..005):
the `cvar-dump.kb` rename, the shared winpy helper, import-closure deps,
docs as fact plus two `decisions.kb` entries, the registry readback check
(`data/dlls.check/registry`), the success criteria from clean, and the
`cvarlist` oracle: `bin/cvarlist-capture` (fully automated, no clicks; on a
hidden Win32 desktop so it never takes focus; reaps its own launch on any
exit) and `data/dlls.check/cvarlist` (on demand; captures rerun only when
their inputs change: `file.tsv`, `gameinfo.gi`, and the Steam
`userdata/<id>/1422450/` settings that hold 57 of the client's 58 user
values). Every plan step is ticked; last commit `cc15cdd`. The reusable
coordination pattern moved to
`~/repo/github.com/bukzor/bukzor-agent-skills/subagent-handoffs/`
(session 97605ccb).

Session 97605ccb (2026-11-10) reviewed the store's design, process and
organization at a high level (scanner internals out of scope). Its findings,
each re-verified against `cc15cdd`, extend the list above:

- [ ] `load.tsv` also commits ~43 Windows system DLLs (`vulkan-1.dll`,
      `d3d11.dll`, `dxcore.dll`, `msvcp140.dll`, ...): a Windows update or GPU
      driver changes committed rows with no game change, and none is a redo
      dependency. The store's own rule fits: keep them in the local
      documents, and commit a view listing only `dlls.list` members
- [ ] Hand-written `redo-ifchange` module lists drift:
      `data/dlls.check/{concommands,convars}.do` omit `dllscan/reglist.py` and
      its imports (`convar_h`, `image`, `memory`, `shape`), though
      `dlls_check` imports `dllscan.reglist`. Generate them from imports, e.g.
      a `python -m deadlock.deps MODULE` printing the transitive repo-local
      sources
- [ ] "~0.2 s per atom" is stale in `cvar-dump.kb/output-views.md:25` and
      `decisions.kb/lossless-per-dll-store-with-atomic-facets.md:32`: handoff
      008 measured 0.9-1.0 s end to end, and the decision's own 22 s for 91
      atoms at `-j8` implies ~1.9 s each
- [ ] `data/dlls.check/strides.do` inlines `bin/winpy-facet.bash`'s
      `dllscan()` steps; source the helper, as `registry.do` does
- [ ] Organization: `dll_X` (atom) vs `dlls_X` (aggregate) differ by one
      letter, and `dll_load` is really exclusions plus the ok-guard; a
      `deadlock/dlls/` subpackage named by role would read better. The
      generic `Table`/`parse`/`render` live in `sparse.py`, so every dlls
      `.do` depends on it; move them to a `tsv` module. The convars header is
      written in 3 places, and each aggregator hand-writes its document's
      key set; derive both from `dllscan/document.py`'s TypedDicts
- [ ] The plan is `status: open` with every step ticked. Its handoff `.kb/`
      predates the revised skill (agents there never touch the index). Close
      the plan; once the user is satisfied on review, `git rm -r` the `.kb/`
      (the skill's CLEANUP)
