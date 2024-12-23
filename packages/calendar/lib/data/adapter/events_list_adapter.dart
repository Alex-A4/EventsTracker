import 'package:calendar/domain/domain.dart';

/// Adapter that is used to convert list of events from `add_event` package to list
/// of [EventModelForActivity] from this package.
///
/// This events are used only to map events to activity.
abstract class EventsListAdapter {
  Stream<List<EventModelForActivity>> get eventsStream;

  List<EventModelForActivity> get eventsList;
}
