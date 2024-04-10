import 'dart:ui';

import 'package:collection/collection.dart';
import 'package:events_tracker/domain/models/models.dart';
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

  /// See [mappedEventsActivityStream] for docs
  final _mappedEventsActivitySubject = BehaviorSubject<Map<DateTime, CalendarDayStatistics>>();

  /// See [mappedEventsStream]
  final _mappedEventsSubject = BehaviorSubject<List<EventModelWithStatistic>>();

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

  /// Mapped activities where statistic for every day contains all necessary information.
  ///
  /// It's better to use this method in UI instead of
  /// [CalendarActivitiesStorage.calendarActivitiesStream], because the last one do not
  /// verify deleting events.
  /// TODO(alex-a4): replace SP storage to SQL with relations
  Stream<Map<DateTime, CalendarDayStatistics>> get mappedEventsActivityStream =>
      _mappedEventsActivitySubject.stream;

  /// Getter for [mappedEventsActivityStream]
  Map<DateTime, CalendarDayStatistics> get mappedEventsActivity =>
      _mappedEventsActivitySubject.value;

  /// Mapped events where every task contains all progress during all days with information.
  ///
  /// It's better to use this method in UI instead of [EventsStorage.eventsStream].
  Stream<List<EventModelWithStatistic>> get mappedEventsStream => _mappedEventsSubject.stream;

  /// Getter for [mappedEventsStream]
  List<EventModelWithStatistic> get mappedEvents => _mappedEventsSubject.value;

  /// Proxy for getting current available events
  Stream<List<EventModel>> get eventsStream => eventsStorage.eventsStream;

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
    // Uses to map events.
    // key1 - task id, key2 - date of activity, value - activity of task
    final tasksMappedByDay = <String, Map<DateTime, CalendarDayTaskStatistics>>{};

    activities.forEach((date, activities) {
      final mappedTasks = <String, List<CalendarDayTaskStatistics>>{};
      final allTasks = <CalendarDayTaskStatistics>[];

      for (final activity in activities.tasks) {
        final event = mappedEvents[activity.eventId];
        if (event == null) continue;

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
          tasksMappedByDay[task.id] = {date: taskStat};
        } else {
          tasksObjects[task.id]!.add(taskStat);
          tasksMappedByDay[task.id]![date] = taskStat;
        }

        if (mappedTasks[event.id] == null) {
          mappedTasks[event.id] = [taskStat];
        } else {
          mappedTasks[event.id]!.add(taskStat);
        }

        allTasks.add(taskStat);
      }

      dayStatistics[date] = CalendarDayStatistics(
        date: date,
        tasksByEvent: mappedTasks,
        allTasks: allTasks,
      );
    });

    // set general counted statistics
    tasksStatistics.forEach(
      // ignore: avoid_function_literals_in_foreach_calls
      (key, value) => tasksObjects[key]!.forEach((task) => task.completedGeneral = value),
    );

    _mappedEventsActivitySubject.add(dayStatistics);

    _mappedEventsSubject.add(events.map((e) {
      return EventModelWithStatistic(
        id: e.id,
        eventTitle: e.eventTitle,
        tasks: e.tasks.map((t) {
          return EventTaskWithStatistic(
            id: t.id,
            taskName: t.taskName,
            plan: t.plan,
            completedGeneral: tasksStatistics[t.id] ?? 0,
            completionsByDays: tasksMappedByDay[t.id] ?? {},
          );
        }).toList(),
        color: e.color,
      );
    }).toList());
  }

  /// Proxy method to remove event by its id
  Future<void> removeEvent(String id) => eventsStorage.removeEvent(id);

  /// Get event by id or null if there is no such one
  EventModel? getEventById(String eventId) =>
      eventsStorage.eventsList.firstWhereOrNull((e) => e.id == eventId);

  /// Proxy method to increase activity for specified event, task and date
  Future<void> increaseDayActivity({
    required String eventId,
    required String taskId,
    required DateTime date,
    int increaseCount = 1,
  }) =>
      calendarStorage.increaseDayActivity(
        eventId: eventId,
        taskId: taskId,
        date: date,
        increaseCount: increaseCount,
      );

  /// Create new event
  Future<void> createEvent({
    required String eventName,
    required Color color,
    required List<EventTask> tasks,
  }) async {
    await eventsStorage.addEvent(
      EventModel.create(eventTitle: eventName, tasks: tasks, color: color),
    );
  }

  /// Update old event in storage with new data
  Future<void> updateEvent({
    required String eventId,
    required String eventName,
    required Color color,
    required List<EventTask> tasks,
  }) async {
    await eventsStorage.updateEvent(
      EventModel(
        id: eventId,
        eventTitle: eventName,
        tasks: tasks,
        color: color,
      ),
    );
  }
}
