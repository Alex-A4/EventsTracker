import 'package:events_tracker/feature/feature.dart';
import 'package:settings/settings.dart';
import 'package:ui_kit/widgets/add_event_button.dart';

class SettingsViewTextsImpl implements SettingsViewTexts {
  const SettingsViewTextsImpl();

  @override
  AddEventButtonTexts get addEventTexts => const AddEventButtonTextsSettingsImpl();

  @override
  EventAndTasksSettingsWidgetTexts get eventAndTaskTexts =>
      const EventAndTasksSettingsWidgetTextsImpl();
}
