import 'package:events_tracker/di/di.dart';
import 'package:events_tracker/feature/settings/settings.dart';
import 'package:events_tracker/generated/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Page that allows view list of events and navigate to adding or updating it
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (_) => SettingsBloc(inject()),
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.eventsSettingsTitle.tr()),
        ),
        body: BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            return SettingsView(events: state.events);
          },
        ),
      ),
    );
  }
}
