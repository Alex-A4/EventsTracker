import 'dart:convert';

import 'package:events_tracker/app/services/storage/storage.dart';
import 'package:events_tracker/data/data.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

const _eventsStorageKey = 'events_key';

/// Storage that stores information about events that used had created
@singleton
class EventsStorage {
  final SharedWrapper shared;

  EventsStorage({required this.shared});

  @PostConstruct()
  void init() {
    final events = shared.getString(_eventsStorageKey);

    if (events != null) {
      final jsonList =
          (jsonDecode(events) as List<dynamic>).cast<Map<String, dynamic>>();

      _eventsListSubject
          .add(jsonList.map((e) => EventModel.fromJson(e)).toList());
    } else {
      _eventsListSubject.add([]);
    }
  }

  final _eventsListSubject = BehaviorSubject<List<EventModel>>();

  /// Get stream for tracking current available events
  Stream<List<EventModel>> get eventsStream => _eventsListSubject;

  /// Get current available events
  List<EventModel> get eventsList => _eventsListSubject.value;

  /// Add new event to storage and update stream
  Future<void> addEvent(EventModel event) async {
    final events = eventsList;
    events.add(event);
    await saveEvents(events);
  }

  /// Remove event from the list.
  /// If there is no events after deletion, then clear storage by the key.
  Future<void> removeEvent(String id) async {
    final events = eventsList;
    events.removeWhere((e) => e.id == id);

    if (events.isEmpty) {
      await shared.remove(_eventsStorageKey);
      _eventsListSubject.add([]);
    } else {
      await saveEvents(events);
    }
  }

  /// Update event by its id
  Future<void> updateEvent(EventModel event) async {
    final events = eventsList;
    final index = events.indexWhere((e) => e.id == event.id);
    if (index != -1) {
      events[index] = event;
      await saveEvents(events);
    }
  }

  /// Save events to storage and update subject with new data
  Future<void> saveEvents(List<EventModel> events) async {
    await shared.setString(
      _eventsStorageKey,
      jsonEncode(events.map((e) => e.toJson()).toList()),
    );
    _eventsListSubject.add(events);
  }
}
