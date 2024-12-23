import 'package:equatable/equatable.dart';

/// Activities during one day for different events.
/// During one day user can complete different events and with different count
/// of completions.
/// For example, for one day user may complete 100 push-ups when plan is 10000.
class CalendarDayActivities extends Equatable {
  final DateTime date;
  final List<DayActivity> tasks;
  const CalendarDayActivities({
    required this.date,
    required this.tasks,
  });

  CalendarDayActivities copyWith({
    DateTime? date,
    List<DayActivity>? tasks,
  }) =>
      CalendarDayActivities(
        date: date ?? this.date,
        tasks: tasks ?? this.tasks,
      );

  @override
  List<Object?> get props => [date, tasks];
}

extension CalendarDayExt on CalendarDayActivities {
  Map<String, DayActivity> getEventActivity(String eventId) => Map.fromEntries(
        tasks.where((t) => t.eventId == eventId).map((e) => MapEntry(e.taskId, e)),
      );
}

/// How many times some task from event was completed during some day
class DayActivity extends Equatable {
  final String eventId;
  final String taskId;

  /// count cannot be less then 1. If it's then activity should be deleted
  final int completedCount;

  const DayActivity({
    required this.eventId,
    required this.taskId,
    required this.completedCount,
  });

  DayActivity copyWith({
    String? eventId,
    String? taskId,
    int? completedCount,
  }) =>
      DayActivity(
        eventId: eventId ?? this.eventId,
        taskId: taskId ?? this.taskId,
        completedCount: completedCount ?? this.completedCount,
      );

  @override
  List<Object?> get props => [eventId, taskId, completedCount];
}
