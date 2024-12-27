import 'package:events_tracker/generated/generated.dart';
import 'package:ui_kit/ui_kit.dart';

class AddEventButtonTextsSettingsImpl implements AddEventButtonTexts {
  const AddEventButtonTextsSettingsImpl();

  @override
  String get addEventButtonTitle => LocaleKeys.addEvent.tr();

  @override
  String get noEventsTitle => LocaleKeys.noEvents.tr();
}
