import 'package:core/core.dart';
import 'package:injectable/injectable.dart';
import 'package:add_event/add_event.dart';

@module
abstract class AddEventModule {
  @singleton
  AddEventService calendarService(EventsStorage eventsStorage) =>
      AddEventService(eventsStorage: eventsStorage);

  @singleton
  EventsStorage eventsStorage(SharedWrapper wrapper) => EventsStorage(shared: wrapper)..init();
}
