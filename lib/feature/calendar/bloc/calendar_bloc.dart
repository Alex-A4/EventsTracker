import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:events_tracker/app/services/services.dart';
import 'package:events_tracker/data/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'calendar_bloc_event.dart';
part 'calendar_bloc_state.dart';
part 'calendar_bloc.freezed.dart';

/// Bloc that produces list of activities to UI and reacts for changing it
class CalendarBloc extends Bloc<CalendarBlocEvent, CalendarBlocState> {
  CalendarBloc({
    required this.activitiesStorage,
    required this.eventsStorage,
  }) : super(const CalendarBlocState(activities: {}, eventColors: {})) {
    _registerHandlers();

    _activitiesSub = activitiesStorage.calendarActivitiesStream.listen(
      (acts) => add(CalendarBlocEvent.updateActivities(acts)),
    );
    _eventsSub = eventsStorage.eventsStream.listen(
      (events) => add(
        CalendarBlocEvent.updateColors(
          Map.fromEntries(events.map((e) => MapEntry(e.id, e.color))),
        ),
      ),
    );
  }

  late StreamSubscription<dynamic> _activitiesSub;
  late StreamSubscription<dynamic> _eventsSub;

  final CalendarActivitiesStorage activitiesStorage;
  final EventsStorage eventsStorage;

  void _registerHandlers() {
    on<_UpdateColors>(
      (event, emit) => emit(state.copyWith(eventColors: event.eventColors)),
    );
    on<_UpdateActivities>(
      (event, emit) => emit(state.copyWith(activities: event.activities)),
    );
  }

  @override
  Future<void> close() {
    _activitiesSub.cancel();
    _eventsSub.cancel();

    return super.close();
  }
}
