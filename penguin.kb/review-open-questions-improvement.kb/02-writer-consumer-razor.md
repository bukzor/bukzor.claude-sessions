# The razor is filed, rewritten to say what to do

Ruled 2026-09-01: the intent is right, the draft was "wordy and
negative." The standing correction, in your words: *crystallize what
should be done, then ensure the directions match that* — and **be
suspicious of writing "not" assertions for agent contexts.**

The draft listed what an author shouldn't leave in. The filed version
gives both readers something instead, so the routing falls out without
a prohibition. It replaced the existing "Identify *which* Claude"
bullet in `llm-kb/skill.kb/self-audit.kb/bloat.md` rather than adding
beside it — the bullet was already the razor in embryo:

> Identify *which* Claude, and give each what it needs. The actor
> needs the stance to take, the criteria that say it's done, and the
> tools to get there. The maintainer needs the argument, the
> provenance, and the failure that prompted the rule; that column
> ships to `docs/dev/`. Editorial feedback arrives addressed to the
> writer, so it belongs in the maintainer's column — relocate it and
> let the actor's file carry the directive alone.

Net two lines longer than what it replaced, and it absorbed the
sentence it dropped ("misaddressed content is bloat at the wrong file
even when it's earning its keep at the right one") into the routing.

**Left open:** the general rule — prefer positive directives in
agent-facing text — is broader than this pass and belongs in
`must-read.kb/before/writing-agent-facing-instruction.md`. Not written
there; a ruling landing mid-pass is input to the pass, not a dispatch
order. Tracked as open work on the parent entry.
