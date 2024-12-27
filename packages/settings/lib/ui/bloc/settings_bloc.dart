import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:settings/settings.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

/// Bloc that allows viewing list of events
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(this.eventsAdapter) : super(const SettingsState(events: [])) {
    _registerHandlers();

    _eventsSub = eventsAdapter.mappedEventsStream.listen(
      (events) => add(SettingsEvent.updateEvents(events)),
    );
  }

  final SettingsEventsAdapter eventsAdapter;

  late StreamSubscription<dynamic> _eventsSub;

  void _registerHandlers() {
    on<_UpdateEvents>(
      (event, emit) => emit(state.copyWith(events: event.events)),
    );
    on<_RemoveEvent>(
      (event, emit) => eventsAdapter.removeEvent(event.eventId),
    );
  }

  @override
  Future<void> close() {
    _eventsSub.cancel();

    return super.close();
  }
}
