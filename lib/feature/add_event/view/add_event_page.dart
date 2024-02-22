import 'package:events_tracker/di/di.dart';
import 'package:events_tracker/feature/add_event/add_event.dart';
import 'package:events_tracker/generated/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Entry point for flow to create new event with tasks
class AddEventPage extends StatelessWidget {
  const AddEventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddEventBloc>(
      create: (_) => AddEventBloc(inject()),
      child: BlocBuilder<AddEventBloc, AddEventState>(
        builder: (context, state) {
          return PopScope(
            canPop: state.isEmpty,
            onPopInvoked: (_) async {
              final wannaClose = await showVerifyClosingAddEventSheet(context);

              if ((wannaClose ?? false) && context.mounted) {
                Navigator.of(context).pop();
              }
            },
            child: Scaffold(
              appBar: AppBar(
                title: Text(LocaleKeys.newEventTitle.tr()),
              ),
            ),
          );
        },
      ),
    );
  }
}
