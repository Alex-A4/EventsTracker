import 'dart:ui';

import 'package:add_event/data/data.dart';
import 'package:add_event/domain/domain.dart';
import 'package:collection/collection.dart';

class AddEventService {
  final EventsStorage eventsStorage;

  AddEventService({
    required this.eventsStorage,
  });

  /// Proxy for getting current available events
  Stream<List<EventModel>> get eventsStream => eventsStorage.eventsStream;

  /// Proxy method to remove event by its id
  Future<void> removeEvent(String id) => eventsStorage.removeEvent(id);

  /// Get event by id or null if there is no such one
  EventModel? getEventById(String eventId) =>
      eventsStorage.eventsList.firstWhereOrNull((e) => e.id == eventId);

  /// Create new event
  Future<void> createEvent({
    required String eventName,
    required Color color,
    required List<EventTask> tasks,
  }) async {
    await eventsStorage.addEvent(
      EventModel.create(eventTitle: eventName, tasks: tasks, color: color),
    );
  }

  /// Update old event in storage with new data
  Future<void> updateEvent({
    required String eventId,
    required String eventName,
    required Color color,
    required List<EventTask> tasks,
  }) async {
    await eventsStorage.updateEvent(
      EventModel(
        id: eventId,
        eventTitle: eventName,
        tasks: tasks,
        color: color,
      ),
    );
  }
}
