import 'package:add_event/add_event.dart';
import 'package:events_tracker/generated/generated.dart';

class VerifyClosingSheetTextsImpl extends VerifyClosingSheetTexts {
  @override
  String get continueWord => LocaleKeys.continueWord.tr();

  @override
  String get stopWord => LocaleKeys.stopWord.tr();

  @override
  String get wannaStopAddingEvent => LocaleKeys.wannaStopAddingEvent.tr();
}
