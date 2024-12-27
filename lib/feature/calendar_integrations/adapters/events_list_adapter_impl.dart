import 'package:add_event/add_event.dart';
import 'package:calendar/calendar.dart';

/// Adapter that allows convert events from `add_event` package to `calendar` package's events
class EventsListAdapterImpl implements EventsListAdapter {
  final EventsStorage eventsStorage;

  EventsListAdapterImpl({required this.eventsStorage});

  @override
  List<EventModelForActivity> get eventsList => _mapEvents(eventsStorage.eventsList);

  @override
  Stream<List<EventModelForActivity>> get eventsStream =>
      eventsStorage.eventsStream.map(_mapEvents);

  List<EventModelForActivity> _mapEvents(List<EventModel> events) {
    return events
        .map(
          (e) => EventModelForActivity(
            id: e.id,
            eventTitle: e.eventTitle,
            color: e.color,
            tasks: e.tasks
                .map((t) => EventTaskForActivity(id: t.id, plan: t.plan, taskName: t.taskName))
                .toList(),
          ),
        )
        .toList();
  }
}
