# INCIDENT -- Investigation kb

On `penguin`, a six-day-old maintenance session (`cc47a367`) started
re-arming its `Monitor(driftwatch.sh)` watch on every notification
instead of only genuine 30-minute expiries at 2026-09-23T15:30:55Z;
because `driftwatch.sh` always prints on a fresh process's first pass,
each re-arm manufactured its own immediate notification, closing a
self-sustaining ~5s loop that ran 124 times over 12 minutes and left
one duplicate `driftwatch.sh` process running per iteration (`Monitor`
neither kills nor dedupes a prior watch on re-arm). Those duplicates
share watched paths with `driftwatch.sh`'s own promotion-pass commits,
so the accumulation is the likely driver of a mutual-wake subprocess
cascade that plausibly caused the kernel OOM kill at 10:44:45 local
(PID 14326, `claude`, probably `cc47a367`'s own process). tmux's server
restarted 3 minutes later, timing-correlated with the same crisis but
not confirmed as a logged casualty. Root cause confirmed (`root-cause.md`). Fixed and recovered, both
verified 2026-09-23T12:13 local: a flock guard in `driftwatch.sh`
(uncommitted, `remediations.kb/flock-guard-in-driftwatch-sh.md`), the
129 duplicates and their orphaned `inotifywait` children killed, and
the one legitimate instance restarted so it actually holds the new
lock (`remediations.kb/kill-duplicate-processes.md`). Open: whether
tmux was a second casualty of the same crisis isn't log-provable from
what's on this machine (`findings.kb/tmux-death-correlated-not-proven.md`).

Collections, one per information type:

- `timeline.kb/` -- dated events of the incident; `timeline.md` synthesizes
- `evidence.kb/` -- raw captures; append-only, never rewritten
- `findings.kb/` -- conclusions distilled from evidence, status-tracked
- `root-cause.kb/` -- candidate explanations; `root-cause.md` is the decision point
- `environment.kb/` -- static machine context (topology, resources, monitoring)
- `remediations.kb/` -- prevention/recovery measures and adoption status
- `reports.kb/` -- outbound upstream contributions and posting status
- `todo.kb/` -- next actions, Skill(llm-subtask) conventions

Maintenance:

- New evidence lands as a new dated file in `evidence.kb/`; then update the
  `status`/`evidence` of affected findings and root-cause candidates --
  never edit a capture to match a conclusion.
- When the root cause closes, rewrite `root-cause.md` to state the answer;
  keep `root-cause.kb/` as the record of why alternatives lost.
- Update `last-updated` in `README.md`/`timeline.md` when their content changes.
