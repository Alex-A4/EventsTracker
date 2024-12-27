import 'package:calendar/calendar.dart';
import 'package:events_tracker/feature/feature.dart';
import 'package:events_tracker/generated/generated.dart';
import 'package:ui_kit/widgets/add_event_button.dart';

class CalendarActivitySelectSheetTextsImpl implements CalendarActivitySelectSheetTexts {
  @override
  String get chooseWord => LocaleKeys.chooseWord.tr();

  @override
  String get selectActivityAmount => LocaleKeys.selectActivityAmount.tr();

  @override
  String get selectActivityEvent => LocaleKeys.selectActivityEvent.tr();

  @override
  String get selectActivityTask => LocaleKeys.selectActivityTask.tr();

  @override
  AddEventButtonTexts get addEventButtonTexts => const AddEventButtonTextsCalendarImpl();
}
