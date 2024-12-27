import 'package:calendar/calendar.dart';
import 'package:flutter/widgets.dart';

/// Adapter that is used in calendar module to incapulate navigation logic
abstract class CalendarNavigationAdapter {
  /// Open bottom sheet to select some activity for day with [date].
  /// Returns nothing.
  Future<void> showCalendarSelectActivitySheet({
    required BuildContext context,
    required DateTime date,
  });

  Future<void> showCalendarEventsSheet({
    required BuildContext context,
    required CalendarDayStatistics data,
  });

  Future<void> goToAddEventFromSelectActivitySheet(BuildContext context);
}
