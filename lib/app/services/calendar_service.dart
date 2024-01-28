import 'dart:ui';

import 'package:events_tracker/data/models/models.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

import 'services.dart';

/// Service that allows combine [CalendarActivitiesStorage] and [EventsStorage] and
/// built logic on top of this data.
@singleton
class CalendarService {
  final CalendarActivitiesStorage calendarStorage;
  final EventsStorage eventsStorage;

  CalendarService({
    required this.calendarStorage,
    required this.eventsStorage,
  });

  final _mappedEventsSubject = BehaviorSubject<Map<DateTime, CalendarDayStatistics>>();

  @PostConstruct()
  void init() {
    // skip 1 to avoid duplicate
    calendarStorage.calendarActivitiesStream.skip(1).listen(
          (acts) => _mapCalendarAndEvents(
            events: eventsStorage.eventsList,
            activities: acts,
          ),
        );
    eventsStorage.eventsStream.skip(1).listen(
          (events) => _mapCalendarAndEvents(
            events: events,
            activities: calendarStorage.calendarActivities,
          ),
        );

    _mapCalendarAndEvents(
      events: eventsStorage.eventsList,
      activities: calendarStorage.calendarActivities,
    );
  }

  Stream<Map<DateTime, CalendarDayStatistics>> get mappedEventsActivityStream =>
      _mappedEventsSubject.stream;

  Map<DateTime, CalendarDayStatistics> get mappedEventsActivity => _mappedEventsSubject.value;

  /// Proxy for activities
  Stream<Map<DateTime, CalendarDayActivities>> get calendarActivitiesStream =>
      calendarStorage.calendarActivitiesStream;

  /// Proxy for events
  Stream<List<EventModel>> get eventsStream => eventsStorage.eventsStream;

  /// Proxy for colors
  Stream<Map<String, Color>> get eventsColorsStream => eventsStorage.eventsColorsStream;

  void _mapCalendarAndEvents({
    required List<EventModel> events,
    required Map<DateTime, CalendarDayActivities> activities,
  }) {
    final dayStatistics = <DateTime, CalendarDayStatistics>{};
    final mappedEvents = Map.fromEntries(events.map((e) => MapEntry(e.id, e)));

    // key - taskId, value - general completed count
    final tasksStatistics = <String, int>{};
    // Allows simplify searching objects after [tasksStatistics] is filled to avoid long
    // cycle iterations
    final tasksObjects = <String, List<CalendarDayTaskStatistics>>{};

    activities.forEach((date, activities) {
      final mappedTasks = <String, List<CalendarDayTaskStatistics>>{};

      // ignore: avoid_function_literals_in_foreach_calls
      activities.tasks.forEach(
        (activity) {
          final event = mappedEvents[activity.eventId]!;
          final task = event.tasks.firstWhere((t) => t.id == activity.taskId);

          if (tasksStatistics[task.id] == null) {
            tasksStatistics[task.id] = activity.completedCount;
          } else {
            tasksStatistics[task.id] = tasksStatistics[task.id]! + activity.completedCount;
          }
          final taskStat = CalendarDayTaskStatistics(
            eventColor: event.color,
            eventId: event.id,
            eventTitle: event.eventTitle,
            completedInDay: activity.completedCount,
            plan: task.plan,
            taskId: task.id,
            taskName: task.taskName,
          );

          if (tasksObjects[task.id] == null) {
            tasksObjects[task.id] = [taskStat];
          } else {
            tasksObjects[task.id]!.add(taskStat);
          }

          if (mappedTasks[event.id] == null) {
            mappedTasks[event.id] = [taskStat];
          } else {
            mappedTasks[event.id]!.add(taskStat);
          }
        },
      );

      dayStatistics[date] = CalendarDayStatistics(
        date: date,
        tasks: mappedTasks,
      );
    });

    // set general counted statistics
    tasksStatistics.forEach(
      // ignore: avoid_function_literals_in_foreach_calls
      (key, value) => tasksObjects[key]!.forEach((task) => task.completedGeneral = value),
    );

    _mappedEventsSubject.add(dayStatistics);
  }

  /// Proxy method to remove event by its id
  Future<void> removeEvent(String id) => eventsStorage.removeEvent(id);
}
