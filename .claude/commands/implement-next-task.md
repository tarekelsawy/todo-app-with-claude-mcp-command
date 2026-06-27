---
description: Implement the next remaining task from the Notion board (with status updates)
---

You are implementing the Flutter Todo app (MVC + Cubit) one task at a time, tracked in Notion.

## Notion references
- Database: `Implementation Tasks` (id `94871068da7840d78513364894b3be21`)
- Data source: `collection://69ac7532-de10-44da-8d04-e05ded64fc98`
- Board view groups tasks by **Status**: `To Do` → `In Progress` → `Done`

## Steps to follow

1. **Find the next task.** Query the data source for the `To Do` task with the lowest `Step` number:
   ```sql
   SELECT url, "Task", "Step", "Phase", "What this means" FROM "collection://69ac7532-de10-44da-8d04-e05ded64fc98" WHERE "Status" = 'To Do' ORDER BY "Step" ASC LIMIT 1
   ```
   If no `To Do` tasks remain, tell the user all tasks are complete and stop.

2. **Announce** the task (Step, Task name, and "What this means") so the user knows what you're building.

3. **Mark it In Progress** in Notion: `update_properties` on that task's page → `{"Status": "In Progress"}`.

4. **Implement the task** following the plan and Flutter best practices:
   - MVC layout: `lib/models`, `lib/controllers`, `lib/views` (+ `lib/views/widgets`).
   - Cubit (`flutter_bloc`) for state, `equatable` for state equality, `shared_preferences` for storage.
   - Keep code simple and well-commented for learning.
   - Briefly explain any important architectural decision.

5. **Verify** before marking done: run `flutter analyze` (and `flutter test` if tests exist). Do not mark Done if there are errors — fix them first.

6. **Mark it Done** in Notion: `update_properties` → `{"Status": "Done"}`.

7. **Summarize** what was built (files added/changed) and name the next task, then stop.

## Rules
- Only implement ONE task per invocation (the next one), unless the user passed arguments asking for a specific task or a different count: `$ARGUMENTS`.
- Always keep the Notion board status in sync with reality (In Progress while working, Done only after `flutter analyze` passes).
- Do NOT commit to git here — that is handled by the `/git-commit-task` command.
