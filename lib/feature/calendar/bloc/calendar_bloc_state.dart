part of 'calendar_bloc.dart';

@freezed
class CalendarBlocState with _$CalendarBlocState {
  const factory CalendarBlocState({
    required Map<DateTime, CalendarDayActivities> activities,
    required Map<String, Color> eventColors,
  }) = _State;
}
