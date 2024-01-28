import 'package:events_tracker/data/data.dart';
import 'package:events_tracker/feature/calendar/calendar.dart';
import 'package:events_tracker/feature/settings/settings.dart';
import 'package:events_tracker/generated/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({
    required this.events,
    super.key,
  });

  final List<EventModel> events;

  @override
  Widget build(BuildContext context) {
    if (events.isEmpty) {
      return _addEventsFullButton();
    }

    return ListView.builder(
      itemCount: events.length,
      itemBuilder: (_, index) {
        final event = events[index];

        return ListTile(
          leading: EventColorWidget.medium(color: event.color),
          title: Text(event.eventTitle),
          trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () async {
              final result = await showConfirmRemoveEventSheet(context, event);

              if (result && context.mounted) {
                context.read<SettingsBloc>().add(SettingsEvent.removeEvent(event.id));
              }
            },
          ),
        );
      },
    );
  }

  Widget _addEventsFullButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        child: Text(LocaleKeys.addEvent.tr()),
      ),
    );
  }
}
