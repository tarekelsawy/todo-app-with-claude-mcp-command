# Models (the "M" in MVC)

This folder holds the **data** of the app — plain Dart classes that describe
*what* a thing is, with no UI and no business logic.

For the Todo app, this is where the `Task` class will live: its text and
which state it is in (Todo, Done, or Archived).

Models should be simple, testable, and know nothing about the screen.
