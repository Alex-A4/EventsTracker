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
    required this.calendarService,
  }) : super(const CalendarBlocState(activities: {}, eventColors: {})) {
    _registerHandlers();

    _activitiesSub = calendarService.calendarActivitiesStream.listen(
      (acts) => add(CalendarBlocEvent.updateActivities(acts)),
    );
    _eventsSub = calendarService.eventsColorsStream.listen(
      (colors) => add(CalendarBlocEvent.updateColors(colors)),
    );
  }

  late StreamSubscription<dynamic> _activitiesSub;
  late StreamSubscription<dynamic> _eventsSub;

  final CalendarService calendarService;

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
