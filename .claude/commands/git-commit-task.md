---
description: Commit the just-completed task to git with a clear message
---

Commit the work for the most recently completed task in the Flutter Todo app.

## Steps to follow

1. **Check state.** Run `git status` and `git diff --stat` to see what changed. If this is not yet a git repo (`git rev-parse` fails), run `git init` first.

2. **Stage** the relevant changes with `git add` (include `lib/`, `pubspec.yaml`, `pubspec.lock`, and any config the task touched). Do not stage unrelated files.

3. **Verify** the project is healthy before committing: `flutter analyze` must pass. If it fails, stop and report — do not commit broken code.

4. **Commit** with a clear, conventional message describing the completed task. Format:
   ```
   <type>: <task name> (Notion step N)

   <one or two short lines on what was added/changed>
   ```
   - Use `feat:` for new features/screens, `chore:` for setup/packages, `refactor:` for restructuring.
   - Example: `feat: add a new task (Notion step 7)`

5. **Push** the commit to the remote: `git push`. If the current branch has no upstream, set it with `git push -u origin <branch>`. If the push fails (no remote, auth, or network), report the error but keep the commit — do not undo it.

6. **Confirm** by showing the resulting `git log -1 --stat` to the user, and note that the commit was pushed.

## Rules
- One commit per completed task, run right after `/implement-next-task`.
- If the user passed a custom message in `$ARGUMENTS`, use that as the commit subject instead.
- Only commit when `flutter analyze` is clean.
- Always push after a successful commit.
