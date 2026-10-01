# Decision: what happens to the trigger listing after compaction?

Posed 2026-09-22. Shared with `../trigger-installation.md` (its open
item 1); ruling here binds there too, or say so if not.

ruling:        # edit in place: accept / reject / amend, with words

## The question, plainly

Today CLAUDE.md says "before your first tool call, list the bank." After
compaction the listing is gone from context and the agent has already
made a first tool call, so nothing tells it to list again. From then on
no trigger can fire -- the agent can't read a file it has never seen
named. Two parts:

**(a) Does the instruction mean once per session, or once per context
window?** Position: per context window. The instruction's purpose is
that the listing be in context; a listing that compaction removed is
not. Listing is idempotent, so re-running it costs one tool call and
needs no bookkeeping (a peer's shell loader does exactly this on every
entry). Silence: this stands as the agent's default, and the CLAUDE.md
wording gets "first tool call in this context window."

> `trigger-installation` (a9fd5254) defers its open item 1 to this file,
> 2026-09-22. One amendment to the wording under (a): the user ruled
> 2026-09-19 that explicitly-requested calls (`! cmd`, `Bash(date -I)`)
> need no prior listing, so the occasion is "first *unrequested* tool call
> in this context window". Scope note: this file closes the compaction
> hole only; the turn-1 install miss (wording, frontmatter option B) stays
> in `../trigger-installation.md`.

**(b) Who re-runs it -- wording alone, or a hook?** You ruled 2026-09-19
(trigger-installation) against a `SessionStart` hook because some
sessions make no tool calls. Claude Code's `SessionStart` has a
`compact` matcher (documented: `startup`, `resume`, `clear`, `compact`,
`fork`) that fires only after compaction -- an active session by
definition, so the no-tool-calls objection doesn't reach it. Position:
a `SessionStart` hook matched on `compact` that injects the listing.
Declined alternative: `PreToolUse` on the first call -- no native
first-call filter; needs a marker file keyed on `session_id`, hand-rolled.
Silence: no default -- a hook is your config, and the prior ruling
stands until you say its scope excludes `compact`.

## Second projection

Before: a 40-turn session compacts at turn 25; turns 26-40 run with no
listing, and a git commit at turn 33 happens without `before/git/commit`.
After (a)+(b): the hook re-injects the listing at turn 26; the commit at
33 fires the trigger. After (a) alone: same, if the agent notices the
new wording in re-injected CLAUDE.md -- the wording-shape data says
moment+verb phrasings fire, standing-state phrasings don't.

## What it unblocks

Nothing in this session's migration (sets neither worsen nor depend on
it -- re-listing the top brings every set's stub back). It closes the
one pre-existing delivery hole the three sibling sessions all found.
