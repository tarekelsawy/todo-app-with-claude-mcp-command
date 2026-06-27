---
description: Implement ALL remaining Notion tasks in order, updating Notion + committing + pushing after each
---

You are implementing the Flutter Todo app (MVC + Cubit) end-to-end, tracked in Notion.
Work through **every** remaining `To Do` task in `Step` order, one at a time, until none remain.

## Notion references
- Database: `Implementation Tasks` (id `94871068da7840d78513364894b3be21`)
- Data source: `collection://69ac7532-de10-44da-8d04-e05ded64fc98`
- Board view groups tasks by **Status**: `To Do` → `In Progress` → `Done`
- Note: SQL/view query modes need a Business plan and may fail. If they do, use
  `notion-search` against the data source to list task pages, then `notion-fetch`
  each page to read its `Step` / `Status` / `What this means` properties.

## The loop

Repeat the following for the `To Do` task with the **lowest `Step`** number, then
move to the next one, until there are no `To Do` tasks left:

1. **Find the next task** — the `To Do` task with the lowest `Step`. If none remain, stop the loop and go to "When all tasks are done".

2. **Announce** it (Step, Task name, and "What this means").

3. **Mark it In Progress** in Notion: `update_properties` → `{"Status": "In Progress"}`.

4. **Implement the task** following the plan and Flutter best practices:
   - MVC layout: `lib/models`, `lib/controllers`, `lib/views` (+ `lib/views/widgets`).
   - Cubit (`flutter_bloc`) for state, `equatable` for state equality, `shared_preferences` for storage.
   - Keep code simple and well-commented for learning.
   - Briefly explain any important architectural decision.

5. **Verify** — run `flutter analyze` (and `flutter test` if tests exist). It MUST pass.
   If it fails, fix it before continuing. Do NOT mark Done or commit broken code.

6. **Mark it Done** in Notion: `update_properties` → `{"Status": "Done"}`.

7. **Commit and push automatically** (same as `/git-commit-task`):
   - Stage only the relevant changes (`lib/`, `pubspec.yaml`, `pubspec.lock`, and any
     config the task touched). Do not stage unrelated files (e.g. `.claude/`).
   - Commit with a conventional message: `<type>: <task name> (Notion step N)` plus
     one or two lines on what changed. Use `feat:` for features/screens, `chore:` for
     setup/packages, `refactor:` for restructuring.
   - `git push` (set upstream with `git push -u origin <branch>` if needed). If push
     fails, report the error but keep the commit and keep going.

8. **Continue** to the next `To Do` task. Briefly note progress (e.g. "Step N done, moving to Step N+1").

## When all tasks are done
- Run a final `flutter analyze` to confirm the whole app is clean.
- Summarize everything that was built (per phase) and the commits made.
- Confirm the Notion board shows all tasks as `Done`.

## Rules
- Implement tasks **in `Step` order**, one fully-finished task at a time (analyze → Notion Done → commit → push) before starting the next.
- Keep the Notion board in sync with reality at every step (In Progress while working, Done only after `flutter analyze` passes).
- One commit per task. Never commit when `flutter analyze` is failing.
- Always push after each successful commit.
- If a task is genuinely blocked (e.g. needs a decision you can't make), stop and ask the user rather than guessing — report which step you stopped at.
- If `$ARGUMENTS` specifies a limit (e.g. a number of tasks or a stopping Step), respect it; otherwise implement all remaining tasks.
