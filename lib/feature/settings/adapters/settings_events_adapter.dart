import 'package:add_event/add_event.dart';
import 'package:calendar/calendar.dart';
import 'package:settings/settings.dart';

class SettingsEventsAdapterImpl implements SettingsEventsAdapter {
  final CalendarActivitiesService calendarService;
  final AddEventService addEventService;

  SettingsEventsAdapterImpl({
    required this.calendarService,
    required this.addEventService,
  });

  @override
  List<EventModelWithStatisticForSettings> get mappedEventsList =>
      _mapListData(calendarService.mappedEvents);

  @override
  Stream<List<EventModelWithStatisticForSettings>> get mappedEventsStream =>
      calendarService.mappedEventsStream.map(_mapListData);

  @override
  Future<void> removeEvent(String eventId) => addEventService.removeEvent(eventId);

  List<EventModelWithStatisticForSettings> _mapListData(List<EventModelWithStatistic> data) => data
      .map(
        (v) => EventModelWithStatisticForSettings(
          id: v.id,
          eventTitle: v.eventTitle,
          color: v.color,
          tasks: v.tasks
              .map(
                (e) => EventTaskWithStatisticForSettings(
                  id: e.id,
                  plan: e.plan,
                  taskName: e.taskName,
                  completedGeneral: e.completedGeneral,
                  completionsByDays: e.completionsByDays.map(
                    (k, v) => MapEntry(
                      k,
                      CalendarDayTaskStatisticsForSettings(
                        eventColor: v.eventColor,
                        eventId: v.eventId,
                        eventTitle: v.eventTitle,
                        plan: v.plan,
                        taskId: v.taskId,
                        taskName: v.taskName,
                        completedInDay: v.completedInDay,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
        ),
      )
      .toList();
}
