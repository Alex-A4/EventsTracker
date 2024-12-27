import 'package:calendar/calendar.dart';
import 'package:events_tracker/generated/generated.dart';

class CalendarEventsSheetTextsImpl implements CalendarEventsSheetTexts {
  const CalendarEventsSheetTextsImpl();

  @override
  String taskCompletedForDayWithCountAndPercent(String completedDays, String completedPercent) =>
      LocaleKeys.taskCompletedForDayWithCountAndPercent.tr(args: [completedDays, completedPercent]);
}
