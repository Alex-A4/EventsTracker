import 'package:settings/domain/domain.dart';

/// Adapter that is used to convert list of events with statistics from `calendar` package to list
/// of [EventModelWithStatisticForSettings] from this package.
///
/// This events are used only to map events to activity.
abstract class SettingsEventsAdapter {
  Stream<List<EventModelWithStatisticForSettings>> get mappedEventsStream;

  List<EventModelWithStatisticForSettings> get mappedEventsList;

  /// Remove event from list
  Future<void> removeEvent(String eventId);
}
