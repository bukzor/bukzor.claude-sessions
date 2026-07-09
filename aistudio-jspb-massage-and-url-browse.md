---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.chatfs/docs/dev/design-incubators/chatfs-mockup-chatgpt
session:
  uuid: bf75cf52-83e0-471c-9db2-dd17f4bb688f
  started: 2026-07-03T14:03:00-05:00
  ended: 2026-07-03T14:25:00-05:00
---
# AI Studio JSPB Massage + URL Browse

Landed AI Studio's `chatfs_aistudio_conversation_massage_json.py` (JSPB →
named JSON, schema ported from the sibling `docs/dev/aistudio-schema/`
incubator's `rosetta/convert.py`, not imported — that package stays
exploratory/disposable) and `chatfs_aistudio_conversation_url_browse.py`
(capture → pluck → massage → place_meta), live-tested end-to-end against a
real prompt. New naming convention: `conversation.raw.json` (raw JSPB, for
audit) vs. `conversation.json` (named) — unique to AI Studio, since
chatgpt/claude's pluck output is already the final shape.

Porting rosetta's schema surfaced and fixed two divergences (a dropped
`"prompt"` top-level wrapper, a weakened `Literal["map"]` type) — both now
resolved in the mockup's copy. This also resolved `aistudio-schema`'s own
open question, `discourse.kb/questions.kb/how-does-this-serve-chatfs.md`:
the "named downstream consumer" it was blocked on now exists.

Follow-ups are tracked in-repo, not here:
- `chatfs-mockup-chatgpt/.claude/todo.kb/2026-06-20-000-aistudio-provider-parity-ladder.md`
  — remaining rungs (index, render/path_render, path_browse/url_render,
  browse automation) and a new tech-debt note (splat.py still reads raw
  JSPB positionally, duplicating what massage_json.py now names).
- `aistudio-schema/.claude/todo.md` — resolved item, plus a note that its
  own `convert.py` may want the same two fixes if that package is revisited.

No further action needed from this note; delete once absorbed or stale.
