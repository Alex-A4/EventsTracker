part of 'settings_bloc.dart';

@freezed
class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.updateEvents(List<EventModel> events) = _UpdateEvents;

  const factory SettingsEvent.removeEvent(String eventId) = _RemoveEvent;
}
