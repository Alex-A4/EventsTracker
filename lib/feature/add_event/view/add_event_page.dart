import 'package:events_tracker/app/services/services.dart';
import 'package:events_tracker/domain/domain.dart';
import 'package:events_tracker/di/di.dart';
import 'package:events_tracker/feature/add_event/add_event.dart';
import 'package:events_tracker/generated/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Entry point for flow to create new event with tasks or edit old one
class AddOrEditEventPage extends StatelessWidget {
  const AddOrEditEventPage({
    this.eventId,
    super.key,
  });

  /// If not null, then page will be used as edit
  final String? eventId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AddEventBloc>(
      create: (_) {
        final service = inject<CalendarService>();

        return AddEventBloc(service, eventId == null ? null : service.getEventById(eventId!));
      },
      child: BlocConsumer<AddEventBloc, AddEventState>(
        listener: (context, state) {
          if (state.created) {
            Navigator.of(context).pop();
          }
        },
        builder: (context, state) {
          return PopScope(
            canPop: state.isEmpty,
            onPopInvoked: (_) async {
              final wannaClose = await showVerifyClosingAddEventSheet(context);

              if ((wannaClose ?? false) && context.mounted) {
                Navigator.of(context).pop();
              }
            },
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: state.eventColor.evenAppBarColor,
                  title: Text(
                    eventId == null
                        ? LocaleKeys.newEventTitle.tr()
                        : LocaleKeys.updateEventTitle.tr(),
                  ),
                ),
                body: AddEventView(state: state, isUpdate: eventId != null),
              ),
            ),
          );
        },
      ),
    );
  }
}
