import 'package:settings/domain/domain.dart';

sealed class SettingsEvent {
  const SettingsEvent();
}

class UpdateSettingsEvent extends SettingsEvent {
  final List<EventModelWithStatisticForSettings> events;

  const UpdateSettingsEvent(this.events);
}

class RemoveSettingsEvent extends SettingsEvent {
  final String eventId;

  const RemoveSettingsEvent(this.eventId);
}
