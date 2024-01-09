part of 'calendar_bloc.dart';

@freezed
class CalendarBlocEvent with _$CalendarBlocEvent {
  // key - id of event
  const factory CalendarBlocEvent.updateColors(
    Map<String, Color> eventColors,
  ) = _UpdateColors;

  const factory CalendarBlocEvent.updateActivities(
    Map<DateTime, CalendarDayActivities> activities,
  ) = _UpdateActivities;
}
