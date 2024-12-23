import 'dart:convert';

import 'package:calendar/data/data.dart';
import 'package:calendar/domain/domain.dart';
import 'package:core/core.dart';
import 'package:rxdart/rxdart.dart';

const _calendarActivitiesKey = 'calendarActivities';

/// Calendar storage that stores information about activities that user had marked on calendar
/// specified for some events.
class CalendarActivitiesStorage {
  final SharedWrapper shared;

  CalendarActivitiesStorage({required this.shared});

  void init() {
    final activities = shared.getString(_calendarActivitiesKey);

    if (activities != null) {
      final jsonList = (jsonDecode(activities) as List<dynamic>).cast<Map<String, dynamic>>();

      _calendarActivitiesSubject.add(
        Map.fromEntries(
          jsonList.map(
            (e) {
              final c =
                  CalendarActivityMapperToEntity(CalendarDayActivitiesDto.fromJson(e)).transform();
              return MapEntry(c.date, c);
            },
          ),
        ),
      );
    } else {
      _calendarActivitiesSubject.add({});
    }
  }

  final _calendarActivitiesSubject = BehaviorSubject<Map<DateTime, CalendarDayActivities>>();

  /// Get stream for available calendar activities
  Stream<Map<DateTime, CalendarDayActivities>> get calendarActivitiesStream =>
      _calendarActivitiesSubject;

  /// Get current available calendar activities
  Map<DateTime, CalendarDayActivities> get calendarActivities => _calendarActivitiesSubject.value;

  /// Findand increase or create activity for [eventId]+[taskId] in [date] day and increase its
  /// count for [increaseCount].
  Future<void> increaseDayActivity({
    required String eventId,
    required String taskId,
    required DateTime date,
    int increaseCount = 1,
  }) async {
    final activities = calendarActivities;
    date = getPureDate(date);
    final dayActivity = activities[date];

    // no activity for this date, create it
    if (dayActivity == null) {
      activities[date] = CalendarDayActivities(
        date: date,
        tasks: [
          DayActivity(
            eventId: eventId,
            taskId: taskId,
            completedCount: increaseCount,
          ),
        ],
      );
    } else {
      final tasks = List<DayActivity>.from(dayActivity.tasks);
      final dayTasksIndex = tasks.indexWhere((t) => t.eventId == eventId && t.taskId == taskId);

      // no activities for this event in that day
      if (dayTasksIndex == -1) {
        activities[date] = dayActivity.copyWith(
          tasks: tasks
            ..add(
              DayActivity(
                eventId: eventId,
                taskId: taskId,
                completedCount: increaseCount,
              ),
            ),
        );
      } else {
        final activity = tasks[dayTasksIndex];
        tasks[dayTasksIndex] = activity.copyWith(
          completedCount: activity.completedCount + increaseCount,
        );
        // just increase number of completions
        activities[date] = dayActivity.copyWith(tasks: tasks);
      }
    }

    await saveActivities(activities);
  }

  /// Find and decrease or remove activity for [eventId]+[taskId] in [date] day and decrease its
  ///  count for [decreaseCount].
  Future<void> decreaseDayActivity({
    required String eventId,
    required String taskId,
    required DateTime date,
    int decreaseCount = 1,
  }) async {
    final activities = calendarActivities;
    date = getPureDate(date);
    final dayActivity = activities[date];

    // no activity for this date, ignore
    if (dayActivity == null) {
      return;
    } else {
      final tasks = List<DayActivity>.from(dayActivity.tasks);
      final dayTasksIndex = tasks.indexWhere(
        (t) => t.eventId == eventId && t.taskId == taskId,
      );

      // no activities for this event in that day, ignore
      if (dayTasksIndex == -1) {
        return;
      } else {
        final activity = tasks[dayTasksIndex];

        if (activity.completedCount - decreaseCount >= 1) {
          tasks[dayTasksIndex] = activity.copyWith(
            completedCount: activity.completedCount - decreaseCount,
          );
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
      jsonEncode(
        activities.values.map((e) => CalendarActivityMapperToDto(e).transform().toJson()).toList(),
      ),
    );
    _calendarActivitiesSubject.add(activities);
  }

  /// Get date cleared from time
  DateTime getPureDate(DateTime date) => DateTime(date.year, date.month, date.day);
}
