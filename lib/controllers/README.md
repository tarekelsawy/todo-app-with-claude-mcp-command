# Controllers (the "C" in MVC)

This folder holds the **logic** of the app — the code that decides *what
happens* when the user does something (add a task, complete it, move it).

In this project the controller is a **Cubit** (from `flutter_bloc`). It keeps
the current list of tasks, updates it in response to actions, and tells the
View to rebuild by emitting a new state.

Controllers talk to Models and storage; they never build widgets themselves.
