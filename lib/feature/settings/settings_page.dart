import 'package:events_tracker/app/router/router.dart';
import 'package:events_tracker/di/di.dart';
import 'package:events_tracker/feature/feature.dart';
import 'package:events_tracker/generated/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:settings/settings.dart';

/// Page that allows view list of events and navigate to adding or updating it
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (_) => SettingsBloc(inject()),
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(LocaleKeys.eventsSettingsTitle.tr()),
            ),
            body: SettingsView(
              events: state.events,
              navigationAdapter: const SettingsNavigationAdapterImpl(),
              texts: const SettingsViewTextsImpl(),
            ),
            floatingActionButton: state.events.isEmpty
                ? null
                : FloatingActionButton(
                    onPressed: () => AddEventRoute().go(context),
                    child: const Icon(Icons.add),
                  ),
          );
        },
      ),
    );
  }
}
