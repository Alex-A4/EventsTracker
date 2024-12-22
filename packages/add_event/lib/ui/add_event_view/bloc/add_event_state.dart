import 'dart:ui';

import 'package:add_event/domain/domain.dart';
import 'package:equatable/equatable.dart';

class AddEventState extends Equatable {
  const AddEventState({
    required this.eventName,
    required this.eventColor,
    required this.tasks,
    required this.created,
    required this.isLoading,
  });

  final String eventName;
  final Color eventColor;
  final List<EventTask> tasks;
  final bool created;
  final bool isLoading;

  AddEventState copyWith({
    String? eventName,
    Color? eventColor,
    List<EventTask>? tasks,
    bool? created,
    bool? isLoading,
  }) {
    return AddEventState(
      eventName: eventName ?? this.eventName,
      eventColor: eventColor ?? this.eventColor,
      tasks: tasks ?? this.tasks,
      created: created ?? this.created,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [eventName, eventColor, tasks, created, isLoading];
}

extension AddEventStateX on AddEventState {
  bool get isEmpty =>
      eventName.isEmpty || tasks.isEmpty || tasks.any((t) => t.taskName.isEmpty || t.plan == 0);

  bool get canBeCreated => !isEmpty;
}
