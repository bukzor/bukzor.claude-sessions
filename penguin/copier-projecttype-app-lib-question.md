---
cwd: /home/bukzor/repo/github.com/bukzor/template.python-project
session:
  uuid:
    - 8614a837-cce4-42ad-87d5-06555a4b08ba
  started: 2026-06-24T15:35:42-05:00
  ended: null
---
# Copier project_type: app | lib Question

Add a copier `project_type: {app, lib}` question to the template so it can
scaffold installable/importable library projects, not just app-form projects.
`app` stays the default (root `main.py`, no build-system); `lib` adds a
hatchling `[build-system]`, a `src/{{ project_slug }}/` package, and an optional
`[project.scripts]` entrypoint. Driven by `basedpyright-as-pyright`, the first
real library consumer of this template.

Taskfile: /home/bukzor/repo/github.com/bukzor/template.python-project/.claude/todo.kb/2026-06-24-000-copier-projecttype-app--lib-question.md
