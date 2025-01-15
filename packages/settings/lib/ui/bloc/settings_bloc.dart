import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:settings/settings.dart';

/// Bloc that allows viewing list of events
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(this.eventsAdapter) : super(const SettingsState(events: [])) {
    _registerHandlers();

    _eventsSub = eventsAdapter.mappedEventsStream.listen(
      (events) => add(UpdateSettingsEvent(events)),
    );
  }

  final SettingsEventsAdapter eventsAdapter;

  late StreamSubscription<dynamic> _eventsSub;

  void _registerHandlers() {
    on<UpdateSettingsEvent>(
      (event, emit) => emit(SettingsState(events: event.events)),
    );
    on<RemoveSettingsEvent>(
      (event, emit) => eventsAdapter.removeEvent(event.eventId),
    );
  }

  @override
  Future<void> close() {
    _eventsSub.cancel();

    return super.close();
  }
}
