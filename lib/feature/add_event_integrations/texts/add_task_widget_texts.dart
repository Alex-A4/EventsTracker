import 'package:add_event/add_event.dart';
import 'package:events_tracker/generated/generated.dart';

class AddEventTaskWidgetTextsImpl implements AddEventTaskWidgetTexts {
  const AddEventTaskWidgetTextsImpl();

  @override
  String get planDescription => LocaleKeys.planDescription.tr();

  @override
  String get planHint => LocaleKeys.planHint.tr();

  @override
  String get planTitle => LocaleKeys.planTitle.tr();

  @override
  String get taskNameHint => LocaleKeys.taskNameHint.tr();

  @override
  String get taskNameTitle => LocaleKeys.taskNameTitle.tr();
}
