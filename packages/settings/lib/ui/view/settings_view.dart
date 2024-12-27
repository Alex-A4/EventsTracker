import 'package:flutter/material.dart';
import 'package:settings/settings.dart';
import 'package:ui_kit/ui_kit.dart';

abstract class SettingsViewTexts {
  EventAndTasksSettingsWidgetTexts get eventAndTaskTexts;

  AddEventButtonTexts get addEventTexts;
}

class SettingsView extends StatelessWidget {
  const SettingsView({
    required this.events,
    required this.navigationAdapter,
    required this.texts,
    super.key,
  });

  final List<EventModelWithStatisticForSettings> events;
  final SettingsViewTexts texts;
  final SettingsNavigationAdapter navigationAdapter;

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return AddEventButton(
        texts: texts.addEventTexts,
        callbackAction: (context) => navigationAdapter.goToAddEventFromSettings(context),
      );
    }

    return ListView.separated(
      itemCount: events.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (_, index) {
        final event = events[index];
        return EventAndTasksSettingsWidget(
          key: Key(event.id),
          event: event,
          texts: texts.eventAndTaskTexts,
          navigationAdapter: navigationAdapter,
        );
      },
    );
  }
}
