---
status: done
requires-sudo: false
---

# Single-instance guard: flock on log/driftwatch.lock

Applied 2026-09-23 to `/home/bukzor/claude/mitmproxy/driftwatch.sh`
(uncommitted -- user's call when to land it, per this repo's
`git-caution: personal`). Closes the leak at its cheapest point: makes
a duplicate `driftwatch.sh` refuse to start at all, regardless of why
`Monitor` was re-armed, rather than depending on agent discipline about
when to re-arm.

```diff
 cd "$SCRIPT_DIR"

+# A re-arm that lands while a prior instance is still watching ... must not
+# become a second live watcher ...
+mkdir -p log
+exec 9>log/driftwatch.lock
+if ! flock -n 9; then
+  echo "driftwatch: another instance already holds log/driftwatch.lock, exiting"
+  exit 0
+fi
+
 # An events directory is created by the first event of its kind, ...
```

`flock` ties the lock to the holding process's open file descriptor,
not to a PID file's contents, so a killed-and-recycled PID (exactly
what an OOM kill produces) can never leave a stale lock behind -- no
cleanup logic needed. `log/driftwatch.lock` lives under the already
gitignored, already-`mkdir -p`'d `log/`.

Verified both paths by hand: a second instance started while a first
holds the lock prints the message and exits 0 immediately; run alone
(no lock held), the pass runs normally. `bash -n` and `shellcheck`
clean.

This does not address `findings.kb/shared-watched-paths-amplify-into-oom.md`
directly -- it prevents the amplifier's precondition (many concurrent
watchers) from recurring, which is sufficient, so no separate fix to
the shared-watch design is proposed.
