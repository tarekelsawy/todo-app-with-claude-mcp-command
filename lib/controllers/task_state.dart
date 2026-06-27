import 'package:equatable/equatable.dart';

import '../models/task.dart';

/// Whether we have finished reading the saved tasks from storage yet.
///
/// While [loading], the screen shows a spinner; once [ready], it shows the
/// lists (even if they are empty).
enum TasksStatus { loading, ready }

/// A snapshot of everything the screen needs to draw itself — "the State".
///
/// The Cubit emits a new [TaskState] every time something changes. Because it
/// is immutable and uses equatable, the UI only rebuilds when the snapshot
/// actually differs from the last one.
class TaskState extends Equatable {
  /// Whether the tasks have loaded yet.
  final TasksStatus status;

  /// Every task in the app, across all three lists.
  final List<Task> tasks;

  const TaskState({
    this.status = TasksStatus.loading,
    this.tasks = const [],
  });

  /// The tasks still to do.
  List<Task> get todo =>
      tasks.where((t) => t.status == TaskStatus.todo).toList();

  /// The tasks that have been completed.
  List<Task> get done =>
      tasks.where((t) => t.status == TaskStatus.done).toList();

  /// The tasks that have been archived.
  List<Task> get archived =>
      tasks.where((t) => t.status == TaskStatus.archived).toList();

  /// Returns a copy of this state with some fields changed.
  TaskState copyWith({TasksStatus? status, List<Task>? tasks}) {
    return TaskState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
    );
  }

  @override
  List<Object?> get props => [status, tasks];
}
