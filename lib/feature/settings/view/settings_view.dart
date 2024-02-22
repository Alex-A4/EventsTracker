import 'package:events_tracker/app/router/router.dart';
import 'package:events_tracker/data/data.dart';
import 'package:events_tracker/feature/settings/widgets/event_and_tasks_widget.dart';
import 'package:events_tracker/generated/generated.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({
    required this.events,
    super.key,
  });

  final List<EventModelWithStatistic> events;

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return _addEventsFullButton();
    }

    return ListView.separated(
      itemCount: events.length,
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemBuilder: (_, index) {
        final event = events[index];
        return EventAndTasksSettingsWidget(
          key: Key(event.id),
          event: event,
        );
      },
    );
  }

  Widget _addEventsFullButton() {
    return Center(
      child: Builder(builder: (context) {
        return ElevatedButton(
          onPressed: () => AddEventRoute().go(context),
          child: Text(LocaleKeys.addEvent.tr()),
        );
      }),
    );
  }
}
