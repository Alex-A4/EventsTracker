import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:events_tracker/app/services/services.dart';
import 'package:events_tracker/domain/domain.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_event.dart';
part 'settings_state.dart';
part 'settings_bloc.freezed.dart';

/// Bloc that allows viewing list of events
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc(this.calendarService) : super(const SettingsState(events: [])) {
    _registerHandlers();

    _eventsSub = calendarService.mappedEventsStream.listen(
      (events) => add(SettingsEvent.updateEvents(events)),
    );
  }

  final CalendarService calendarService;

  late StreamSubscription<dynamic> _eventsSub;

  void _registerHandlers() {
    on<_UpdateEvents>(
      (event, emit) => emit(state.copyWith(events: event.events)),
    );
    on<_RemoveEvent>(
      (event, emit) => calendarService.removeEvent(event.eventId),
    );
  }

  @override
  Future<void> close() {
    _eventsSub.cancel();

    return super.close();
  }
}
