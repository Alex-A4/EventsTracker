import 'package:add_event/add_event.dart';
import 'package:calendar/calendar.dart';
import 'package:events_tracker/feature/feature.dart';
import 'package:injectable/injectable.dart';
import 'package:settings/settings.dart';

@module
abstract class SettingsModule {
  @factoryMethod
  SettingsEventsAdapter settingsEventsAdapter(
    CalendarActivitiesService service,
    AddEventService addEvent,
  ) =>
      SettingsEventsAdapterImpl(
        calendarService: service,
        addEventService: addEvent,
      );
}
