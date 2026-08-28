---
cwd: /home/bukzor/repo/github.com/bukzor/prototype.chatfs
session:
  uuid: # chronological; append your uuid when picking this entry up
    - d9e4efa6-8514-4bc7-bf81-5301f8b702be
  started: 2026-08-28T12:14:00-05:00
  ended: null
---
# chatfs: provider-agnostic CLI surface

Closed the arc that began with a wrong-driver crash: the cache root now
holds every provider (`$cache/<provider>/`, appended by `extract_cache`),
command names write the `provider` segment they always carried in their
module paths, and `chatfs-conversation-{url,path}-{browse,render}` plus
`chatfs-conversation-render` read the provider off the locator instead of
being told it. Six commits, all pushed; `docs/dev/devlog/2026-08-28-002-*`
has the reasoning, including why a `meta.json` shape sniff was rejected.

Everything committed and green (227 tests, basedpyright 0 errors). Nothing
here is blocking; the items below are the live follow-ups.

- [ ] Decide whether `[project.scripts]` should be generated from
      `entry_points_test.py`'s `modules_defining_main()` rather than only
      checked against it. Tracked in the repo's `.claude/todo.md`; ruled
      2026-08-28 to ship the check alone first.
- [ ] `provider-plugin-model.md`'s mount question narrowed but did not close.
      One mount over one cache now serves every provider; what remains is
      whether the daemon ever composes several caches into one tree. Settles
      with graduation child 003.
- [ ] `~/chats` is the cache now, but `$CHATFS_CACHE` in the user's shell
      still points at `prototype.chatfs/chatfs-root`. Their call whether to
      repoint it; the docs assume `export CHATFS_CACHE=~/chats`.
- [ ] `trash/` in the repo holds ~80MB: the `chats-root-spill` recovery plus
      four smoke-test dirs from this session. Safe to delete once the user is
      satisfied the spill held nothing wanted.
