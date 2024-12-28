import 'package:add_event/add_event.dart';
import 'package:calendar/calendar.dart';
import 'package:core/core.dart';
import 'package:events_tracker/feature/calendar_integrations/adapters/events_list_adapter_impl.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CalendarModule {
  @singleton
  CalendarActivitiesStorage calendarStorage(SharedWrapper shared) =>
      CalendarActivitiesStorage(shared: shared)..init();

  @singleton
  CalendarActivitiesService calendarActivitiesService(
    CalendarActivitiesStorage storage,
    EventsListAdapter adapter,
  ) =>
      CalendarActivitiesService(calendarStorage: storage, eventsAdapter: adapter)..init();

  @factoryMethod
  EventsListAdapter eventsListAdapter(AddEventService eventsService) =>
      EventsListAdapterImpl(eventsService: eventsService);
}
