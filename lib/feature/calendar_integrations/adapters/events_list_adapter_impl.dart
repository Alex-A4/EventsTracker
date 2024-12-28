import 'package:add_event/add_event.dart';
import 'package:calendar/calendar.dart';

/// Adapter that allows convert events from `add_event` package to `calendar` package's events
class EventsListAdapterImpl implements EventsListAdapter {
  final AddEventService eventsService;

  EventsListAdapterImpl({required this.eventsService});

  @override
  List<EventModelForActivity> get eventsList => _mapEvents(eventsService.eventsList);

  @override
  Stream<List<EventModelForActivity>> get eventsStream =>
      eventsService.eventsStream.map(_mapEvents);

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
