import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:events_tracker/domain/domain.dart';

part 'calendar_day_activities.freezed.dart';
part 'calendar_day_activities.g.dart';

/// Activities during one day for different events.
/// During one day user can complete different events and with different count
/// of completions.
/// For example, for one day user may complete 100 push-ups when plan is 10000.
@freezed
class CalendarDayActivities with _$CalendarDayActivities {
  const factory CalendarDayActivities({
    @dateTimeJsonConverter required DateTime date,
    required List<DayActivity> tasks,
  }) = _CalendarDayActivities;

  factory CalendarDayActivities.fromJson(Map<String, dynamic> json) =>
      _$CalendarDayActivitiesFromJson(json);
}

extension CalendarDayExt on CalendarDayActivities {
  Map<String, DayActivity> getEventActivity(String eventId) => Map.fromEntries(
        tasks.where((t) => t.eventId == eventId).map((e) => MapEntry(e.taskId, e)),
      );
}

/// How many times some task from event was completed during some day
@freezed
class DayActivity with _$DayActivity {
  const factory DayActivity({
    required String eventId,
    required String taskId,
    // count cannot be less then 1. If it's then activity should be deleted
    required int completedCount,
  }) = _DayActivity;

  factory DayActivity.fromJson(Map<String, dynamic> json) => _$DayActivityFromJson(json);
}
