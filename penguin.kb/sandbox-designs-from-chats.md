---
cwd: /home/bukzor/repo/github.com/bukzor.sandbox
session:
  uuid: # chronological; append your uuid when picking this entry up
    []
  started: null # planned 2026-10-23 from session 10fbc139 (sandbox-bootstrap)
  ended: null
---
# Sandbox designs from recent chats

The user has a backlog of toy designs played out conceptually in claude.ai
chats over the last couple of months. This session collects them so they can
be stack-ranked and picked among, and so the ones chosen can be actioned as
sandbox repos under `bukzor/bukzor.sandbox` (the submodule parent being
bootstrapped in session `sandbox-bootstrap`, 10fbc139).

Not in scope: building any of them. Deliverable is an inventory, one entry per
design, in a form the user can rank -- a candidate home is a `ideas.kb/` in
the sandbox parent (Skill(llm-subtask)), but let the user rule on placement.

- [ ] `chatfs-refresh <days>` with a window wide enough to cover the backlog
      (start at 90; it refreshes every provider, so expect aistudio and
      chatgpt noise alongside claude)
- [ ] Sweep the refreshed `~/chats` for sandbox-shaped conversations: a
      design or prototype discussed but never given a repo. Record per hit:
      conversation locator, one-line pitch, how far the design got, what the
      first concrete step would be.
- [ ] Present the inventory for stack-ranking (Skill(review-open-questions)
      shape: the user rules, the agent files)
- [ ] For each pick, hand off to the sandbox parent's create-a-sandbox
      procedure once that exists (sandbox-bootstrap is defining it)
