# Views (the "V" in MVC)

This folder holds the **screens** of the app — the widgets the user actually
sees and interacts with.

Views read from the Controller (the Cubit) to know what to show, and call
methods on the Controller when the user taps or types. They contain no
business logic of their own.

Reusable pieces of UI (a single task row, the input box, etc.) live in the
`widgets/` subfolder to keep screens tidy.
