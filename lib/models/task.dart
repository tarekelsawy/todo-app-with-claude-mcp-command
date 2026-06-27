import 'package:equatable/equatable.dart';

/// The three lists a task can belong to.
///
/// A task always lives in exactly one of these: the active **todo** list,
/// the **done** list once it is ticked off, or the **archived** list when
/// it is tucked away.
enum TaskStatus { todo, done, archived }

/// A single todo item — the core piece of data in the app (the "Model").
///
/// A [Task] is plain data with no UI and no logic: it just describes *what* a
/// task is. It has an [id] so we can tell two tasks apart even if their [text]
/// is identical, the [text] the user typed, and the [status] saying which list
/// it currently belongs to.
class Task extends Equatable {
  /// A unique identifier for this task.
  final String id;

  /// The words the user typed, e.g. "Buy milk".
  final String text;

  /// Which list this task is in right now.
  final TaskStatus status;

  const Task({
    required this.id,
    required this.text,
    this.status = TaskStatus.todo,
  });

  /// Returns a copy of this task with some fields changed.
  ///
  /// Because a [Task] is immutable (all fields are `final`), we never edit one
  /// in place — we make a changed copy instead. The [id] never changes.
  Task copyWith({String? text, TaskStatus? status}) {
    return Task(
      id: id,
      text: text ?? this.text,
      status: status ?? this.status,
    );
  }

  /// Convert this task into a plain map so it can be saved to storage as JSON.
  Map<String, dynamic> toJson() => {
        'id': id,
        'text': text,
        'status': status.name,
      };

  /// Rebuild a task from the map produced by [toJson].
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      text: json['text'] as String,
      status: TaskStatus.values.byName(json['status'] as String),
    );
  }

  /// Equatable uses these fields to decide if two tasks are "equal", which lets
  /// the Cubit/UI skip rebuilds when nothing actually changed.
  @override
  List<Object?> get props => [id, text, status];
}
