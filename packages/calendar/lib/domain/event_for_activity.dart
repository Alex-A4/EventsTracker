import 'dart:ui';

/// !!!
/// This model is copy from add_event package, but it's used only to map events to activity
/// !!!
///
/// Planned event that will be displayed information about some event and requried actions to
/// complete it.
/// This event is just a description on general plans. To specify tasks inside this plan, see
/// [EventTaskForActivity].
class EventModelForActivity {
  final String id;
  final String eventTitle;
  // list of tasks that should be completed to complete event in general
  final List<EventTaskForActivity> tasks;

  /// Color is hex-decilam 32-bit int, for example 0xFFAABBCC
  final Color color;

  const EventModelForActivity({
    required this.id,
    required this.eventTitle,
    required this.tasks,
    required this.color,
  });
}

/// !!!
/// This model is copy from add_event package, but it's used only to map events to activity
/// !!!
///
/// One task from [EventModelForActivity] that allows specify different types of
/// tasks inside some plan.
/// While [EventModelForActivity] is a general plan, for example, `Boxing`.
/// [EventTaskForActivity] is a sub-task of `Boxing`, for example:
/// `Visit 50 trainings` or `Make 10000 push-ups`
class EventTaskForActivity {
  final String id;
  final String taskName;

  /// how many times user should complete this task for your plan
  final int plan;

  const EventTaskForActivity({
    required this.id,
    required this.taskName,
    required this.plan,
  });
}
