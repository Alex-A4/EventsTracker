import 'package:events_tracker/generated/generated.dart';
import 'package:settings/settings.dart';

class EventAndTasksSettingsWidgetTextsImpl implements EventAndTasksSettingsWidgetTexts {
  const EventAndTasksSettingsWidgetTextsImpl();

  @override
  String eventCompletedCountAndPercent(String completedPercent) =>
      LocaleKeys.eventCompletedCountAndPercent.tr(args: [completedPercent]);

  @override
  String taskCompletedCountAndPercent(String completed, String plan, String completedPercent) =>
      LocaleKeys.taskCompletedCountAndPercent.tr(
        args: [completed, plan, completedPercent],
      );
}
