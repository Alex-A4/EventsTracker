import 'package:add_event/add_event.dart';
import 'package:calendar/calendar.dart';
import 'package:core/core.dart';
import 'package:events_tracker/feature/calendar/integrations/events_list_adapter_impl.dart';
import 'package:injectable/injectable.dart';

@module
abstract class CalendarModule {
  @singleton
  CalendarActivitiesStorage calendarStorage(SharedWrapper shared) =>
      CalendarActivitiesStorage(shared: shared);

  @singleton
  CalendarActivitiesService calendarActivitiesService(
    CalendarActivitiesStorage storage,
    EventsListAdapter adapter,
  ) =>
      CalendarActivitiesService(calendarStorage: storage, eventsAdapter: adapter);

  @factoryMethod
  EventsListAdapter eventsListAdapter(EventsStorage eventsStorage) =>
      EventsListAdapterImpl(eventsStorage: eventsStorage);
}
