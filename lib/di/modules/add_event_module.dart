import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:add_event/add_event.dart';

@module
abstract class AddEventModule {
  @singleton
  CalendarService calendarService(
    EventsStorage eventsStorage,
  ) =>
      CalendarService(eventsStorage: eventsStorage)..init();

  @singleton
  EventsStorage eventsStorage(SharedWrapper wrapper) => EventsStorage(shared: wrapper)..init();
}
