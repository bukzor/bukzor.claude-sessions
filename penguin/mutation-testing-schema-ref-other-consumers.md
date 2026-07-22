---
cwd: /home/bukzor/.claude/skills/mutation-testing
session:
  uuid:
    - 14ef4cb9-ce4a-42e7-9c1c-5c542621b9e0
  started: 2026-07-22T12:25:53-05:00
  ended: 2026-07-22T12:25:53-05:00
---
# Mutation-Testing Schema: Convert Remaining Consumers to $ref

Extracted `Skill(mutation-testing)`'s inline Appendix A schema into
`jsonschema/mutation-testing.jsonschema.yaml` (skill root) and repointed
`packages/har-browse/docs/dev/mutation-testing.jsonschema.yaml` (in
`prototype.chatfs`) at it via a one-line `skill://` `$ref` stub, per
`Skill(llm-kb)`'s schema-reuse convention. Both validated clean with
`llm.kb-validate`. Commits: dotfiles `9b07a0d`, prototype.chatfs `27c1306`.

A repo-wide grep for the schema's `description:` string turned up two more
projects still carrying the old inline copy, out of scope for that
session:

- [ ] `~/repo/github.com/bukzor/git-partial.prototyping/docs/dev/mutation-testing.jsonschema.yaml`
- [ ] `~/repo/github.com/bukzor/bukzor.garden/apps/super-tictactoe/docs/dev/mutation-testing.jsonschema.yaml`

Each: replace the inline copy with the same stub used in har-browse
(`$ref: "skill://mutation-testing/jsonschema/mutation-testing.jsonschema.yaml"`),
run `llm.kb-validate` on that project's `docs/dev/`, commit. ~5 min each;
no reason to batch them together beyond convenience.
