# deadlock-crash-2026-11-18 -- Investigation kb

On 2026-11-18 (local time, UTC-6) on buck-win10 (Windows 11 26300, AMD Radeon
RX 5600 XT, driver 32.0.21043.5001), a Deadlock session that started at 17:27
ended with a GPU timeout that Windows could not recover (LiveKernelEvent 117,
19:21). DWM died, the game hung, the restart was blocked by AMD's atieclxx.exe,
and the machine was hard-reset (19:22). After the reboot the RX 5600 XT was
**disabled** (problem code 22, ConfigFlags=1), so Windows ran on the Microsoft
Basic Render Driver. Three relaunches of Deadlock each crashed within about 10 s
with the same null read in d3d10warp.dll. At 19:33 the user re-enabled the device, which failed with code 31. At about
19:35 the user removed the device and rescanned, which fixed it (Status OK).
Who or what set the disable flag is unknown.

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
