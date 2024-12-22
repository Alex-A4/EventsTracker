import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

/// Planned event that will be displayed information about some event and requried actions to
/// complete it.
/// This event is just a description on general plans. To specify tasks inside this plan, see
/// [EventTask].
class EventModel extends Equatable {
  final String id;
  final String eventTitle;
  // list of tasks that should be completed to complete event in general
  final List<EventTask> tasks;

  /// Color is hex-decilam 32-bit int, for example 0xFFAABBCC
  final Color color;

  const EventModel({
    required this.id,
    required this.eventTitle,
    required this.tasks,
    required this.color,
  });

  factory EventModel.create({
    required String eventTitle,
    required List<EventTask> tasks,
    required Color color,
  }) =>
      EventModel(
        id: const Uuid().v4(),
        eventTitle: eventTitle,
        tasks: tasks,
        color: color,
      );

  EventModel copyWith({
    String? eventTitle,
    List<EventTask>? tasks,
    Color? color,
  }) {
    return EventModel(
      id: id,
      eventTitle: eventTitle ?? this.eventTitle,
      tasks: tasks ?? this.tasks,
      color: color ?? this.color,
    );
  }

  @override
  List<Object?> get props => [id, eventTitle, tasks, color];
}

/// One task from [EventModel] that allows specify different types of
/// tasks inside some plan.
/// While [EventModel] is a general plan, for example, `Boxing`.
/// [EventTask] is a sub-task of `Boxing`, for example:
/// `Visit 50 trainings` or `Make 10000 push-ups`
class EventTask extends Equatable {
  final String id;
  final String taskName;

  /// how many times user should complete this task for your plan
  final int plan;

  const EventTask({
    required this.id,
    required this.taskName,
    required this.plan,
  });

  factory EventTask.create({
    required String taskName,
    required int plan,
  }) =>
      EventTask(
        id: const Uuid().v4(),
        taskName: taskName,
        plan: plan,
      );

  EventTask copyWith({
    String? taskName,
    int? plan,
  }) {
    return EventTask(
      id: id,
      taskName: taskName ?? this.taskName,
      plan: plan ?? this.plan,
    );
  }

  @override
  List<Object?> get props => [id, taskName, plan];
}
