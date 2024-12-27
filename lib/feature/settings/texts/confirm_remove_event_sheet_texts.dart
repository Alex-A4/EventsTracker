import 'package:events_tracker/generated/generated.dart';
import 'package:settings/settings.dart';

class ConfirmRemoveEventSheetTextsImpl implements ConfirmRemoveEventSheetTexts {
  const ConfirmRemoveEventSheetTextsImpl();

  @override
  String get cancelWord => LocaleKeys.cancelWord.tr();

  @override
  String get deleteWord => LocaleKeys.deleteWord.tr();
}
