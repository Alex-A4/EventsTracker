import 'dart:convert';

import 'package:events_tracker/app/services/storage/storage.dart';
import 'package:events_tracker/data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

const _calendarActivitiesKey = 'calendarActivities';

/// Calendar storage that stores information about activities that user had marked on calendar
/// specified for some events.
@singleton
class CalendarActivitiesStorage {
  final SharedWrapper shared;

  CalendarActivitiesStorage({required this.shared});

  @PostConstruct()
  void init() {
    final activities = shared.getString(_calendarActivitiesKey);

    if (activities != null) {
      final jsonList = (jsonDecode(activities) as List<dynamic>)
          .cast<Map<String, dynamic>>();

      _calendarActivitiesSubject.add(
        Map.fromEntries(
          jsonList.map(
            (e) {
              final c = CalendarDayActivities.fromJson(e);
              return MapEntry(c.date, c);
            },
          ),
        ),
      );
    } else {
      _calendarActivitiesSubject.add({});
    }
  }

  final _calendarActivitiesSubject =
      BehaviorSubject<Map<DateTime, CalendarDayActivities>>();

  /// Get stream for available calendar activities
  Stream<Map<DateTime, CalendarDayActivities>> get calendarActivitiesStream =>
      _calendarActivitiesSubject;

  /// Get current available calendar activities
  Map<DateTime, CalendarDayActivities> get calendarActivities =>
      _calendarActivitiesSubject.value;

  /// Find or create activity for [eventId] in [date] day and increase its count.
  Future<void> increaseDayActivity(String eventId, DateTime date) async {
    final activities = calendarActivities;
    final dayActivity = activities[date];

    // no activity for this date, create it
    if (dayActivity == null) {
      activities[date] = CalendarDayActivities(
        date: date,
        tasks: [DayActivity(eventId: eventId, completedCount: 1)],
      );
    } else {
      final tasks = List<DayActivity>.from(dayActivity.tasks);
      final dayTasksIndex = tasks.indexWhere((t) => t.eventId == eventId);

      // no activities for this event in that day
      if (dayTasksIndex == -1) {
        activities[date] = dayActivity.copyWith(
          tasks: tasks..add(DayActivity(eventId: eventId, completedCount: 1)),
        );
      } else {
        final activity = tasks[dayTasksIndex];
        tasks[dayTasksIndex] =
            activity.copyWith(completedCount: activity.completedCount + 1);
        // just increase number of completions
        activities[date] = dayActivity.copyWith(tasks: tasks);
      }
    }

    await saveActivities(activities);
  }

  Future<void> decreaseDayActivity(String eventId, DateTime date) async {
    final activities = calendarActivities;
    final dayActivity = activities[date];

    // no activity for this date, ignore
    if (dayActivity == null) {
      return;
    } else {
      final tasks = List<DayActivity>.from(dayActivity.tasks);
      final dayTasksIndex = tasks.indexWhere((t) => t.eventId == eventId);

      // no activities for this event in that day, ignore
      if (dayTasksIndex == -1) {
        return;
      } else {
        final activity = tasks[dayTasksIndex];

        if (activity.completedCount > 1) {
          tasks[dayTasksIndex] =
              activity.copyWith(completedCount: activity.completedCount - 1);
        } else {
          tasks.removeAt(dayTasksIndex);
        }

        if (tasks.isEmpty) {
          // remove day if no actions there
          activities.remove(date);
        } else {
          // just decrease number of completions or remove if no move actions
          activities[date] = dayActivity.copyWith(tasks: tasks);
        }
      }
    }

    await saveActivities(activities);
  }

  /// Save activities to storage and update subject with new data
  Future<void> saveActivities(
    Map<DateTime, CalendarDayActivities> activities,
  ) async {
    await shared.setString(
      _calendarActivitiesKey,
      jsonEncode(activities.values.map((e) => e.toJson()).toList()),
    );
    _calendarActivitiesSubject.add(activities);
  }
}
