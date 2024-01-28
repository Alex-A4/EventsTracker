import 'dart:ui';

/// Statistic for single day that contains all information about event-task relationships
class CalendarDayStatistics {
  CalendarDayStatistics({
    required this.date,
    required this.tasks,
  });

  final DateTime date;

  /// Key - event id, value - list of tasks for this event in that day
  final Map<String, List<CalendarDayTaskStatistics>> tasks;
}

/// Statistics for task in a single day and partly for all days
class CalendarDayTaskStatistics {
  CalendarDayTaskStatistics({
    required this.taskId,
    required this.taskName,
    required this.completedInDay,
    required this.plan,
    required this.eventColor,
    required this.eventId,
    required this.eventTitle,
  });

  final String eventId;
  final String eventTitle;
  final Color eventColor;

  final String taskId;
  final String taskName;

  /// count completed for task in some day
  final int completedInDay;

  /// sum between all activities specified for event, will be set after all calculations
  int completedGeneral = 0;

  final int plan;

  int get completedForDayPercent => (completedInDay / plan.toDouble() * 100).toInt();

  int get completedGeneralPercent => (completedGeneral / plan.toDouble() * 100).toInt();
}
