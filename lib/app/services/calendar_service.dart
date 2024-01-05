import 'package:events_tracker/data/models/calendar_day_activities.dart';
import 'package:events_tracker/data/models/event_model.dart';
import 'package:injectable/injectable.dart';

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

  void _mapCalendarAndEvents({
    required List<EventModel> events,
    required Map<DateTime, CalendarDayActivities> activities,
  }) {}
}
