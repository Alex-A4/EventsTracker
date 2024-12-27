import 'package:events_tracker/generated/generated.dart';
import 'package:ui_kit/ui_kit.dart';

class ColorPickerWidgetTextsImpl implements ColorPickerWidgetTexts {
  const ColorPickerWidgetTextsImpl();

  @override
  String get changeWord => LocaleKeys.changeWord.tr();

  @override
  String get eventColorTitle => LocaleKeys.eventColorTitle.tr();
}
