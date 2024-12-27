import 'package:add_event/add_event.dart';
import 'package:events_tracker/feature/add_event_integrations/add_event_integrations.dart';
import 'package:events_tracker/generated/generated.dart';
import 'package:ui_kit/widgets/color_picker.dart';

class AddEventViewTextsImpl implements AddEventViewTexts {
  const AddEventViewTextsImpl();

  @override
  ColorPickerWidgetTexts get colorPickerTexts => const ColorPickerWidgetTextsImpl();

  @override
  AddEventTaskWidgetTexts get addTaskTexts => const AddEventTaskWidgetTextsImpl();

  @override
  String get addNewTask => LocaleKeys.addNewTask.tr();

  @override
  String get createWord => LocaleKeys.createWord.tr();

  @override
  String get eventNameHint => LocaleKeys.eventNameHint.tr();

  @override
  String get eventNameTitle => LocaleKeys.eventNameTitle.tr();

  @override
  String get updateWord => LocaleKeys.updateWord.tr();
}
