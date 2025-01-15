import 'package:equatable/equatable.dart';
import 'package:settings/domain/domain.dart';

class SettingsState extends Equatable {
  final List<EventModelWithStatisticForSettings> events;

  const SettingsState({required this.events});

  @override
  List<Object?> get props => [events];
}
