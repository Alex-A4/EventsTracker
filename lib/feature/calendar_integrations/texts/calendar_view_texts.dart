import 'package:calendar/calendar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';

class CalendarViewTextsImpl implements CalendarViewTexts {
  const CalendarViewTextsImpl();

  @override
  String languageCode(BuildContext context) => context.locale.languageCode;
}
