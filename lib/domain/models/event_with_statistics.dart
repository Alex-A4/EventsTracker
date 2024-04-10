import 'dart:ui';

import 'package:events_tracker/domain/domain.dart';

/// Planned event that will be displayed information about some event and requried actions to
/// complete it.
/// This event is just a description on general plans. To specify tasks inside this plan, see
/// [EventTaskWithStatistic].
///
/// This model is different from [EventModel] becuse this contains statistics about completions.
class EventModelWithStatistic {
  const EventModelWithStatistic({
    required this.id,
    required this.eventTitle,
    required this.tasks,
    required this.color,
  });

  final String id;
  final String eventTitle;

  /// List of tasks that should be completed to complete event in general
  final List<EventTaskWithStatistic> tasks;

  /// Color is hex-decilam 32-bit int, for example 0xFFAABBCC
  final Color color;

  int get completedGeneralPercent =>
      tasks.fold(0, (v, e) => v + e.completedGeneralPercent) ~/ tasks.length.toDouble();
}

/// One task from [EventModelWithStatistic] that allows specify different types of
/// tasks inside some plan.
/// While [EventModelWithStatistic] is a general plan, for example, `Boxing`.
/// [EventModelWithStatistic] is a sub-task of `Boxing`, for example:
/// `Visit 50 trainings` or `Make 10000 push-ups`
///
/// This model is different from [EventTask] becuse this contains statistics about completions.
class EventTaskWithStatistic {
  const EventTaskWithStatistic({
    required this.id,
    required this.taskName,
    required this.plan,
    required this.completedGeneral,
    required this.completionsByDays,
  });

  final String id;
  final String taskName;

  /// How many times user should complete this task for your plan
  final int plan;

  /// Sum between all activities specified for event, will be set after all calculations.
  /// 0 if no activity
  final int completedGeneral;

  /// All days where this task was completed.
  /// Empty if no activity
  final Map<DateTime, CalendarDayTaskStatistics> completionsByDays;

  int get completedGeneralPercent => (completedGeneral / plan.toDouble() * 100).toInt();
}
