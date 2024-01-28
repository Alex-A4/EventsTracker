import 'dart:convert';
import 'dart:ui';

import 'package:events_tracker/app/services/storage/storage.dart';
import 'package:events_tracker/data/data.dart';
import 'package:flutter/material.dart';
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
    // final events = shared.getString(_eventsStorageKey);

    _eventsListSubject.add([
      const EventModel(
        id: '1',
        eventTitle: '1',
        tasks: [
          EventTask(id: '4', taskName: '4', plan: 10),
        ],
        color: Colors.blue,
      ),
      const EventModel(
        id: '2',
        eventTitle: '2',
        tasks: [
          EventTask(id: '5', taskName: '5', plan: 20),
        ],
        color: Colors.green,
      ),
      const EventModel(
        id: '3',
        eventTitle: '3',
        tasks: [
          EventTask(id: '6', taskName: '6', plan: 15),
        ],
        color: Colors.red,
      ),
    ]);

    // if (events != null) {
    //   final jsonList = (jsonDecode(events) as List<dynamic>).cast<Map<String, dynamic>>();

    //   _eventsListSubject.add(jsonList.map((e) => EventModel.fromJson(e)).toList());
    // } else {
    //   _eventsListSubject.add([]);
    // }
  }

  final _eventsListSubject = BehaviorSubject<List<EventModel>>();

  /// Get stream for tracking current available events
  Stream<List<EventModel>> get eventsStream => _eventsListSubject;

  /// Stream with mapped colors and event ids
  Stream<Map<String, Color>> get eventsColorsStream => eventsStream.map(convertEventsToIdColorMap);

  /// Get current available events
  List<EventModel> get eventsList => _eventsListSubject.value;

  /// Convert list of events to map id-color
  Map<String, Color> convertEventsToIdColorMap(List<EventModel> events) =>
      Map.fromEntries(events.map((e) => MapEntry(e.id, e.color)));

  /// Add new event to storage and update stream
  Future<void> addEvent(EventModel event) async {
    final events = List<EventModel>.from(eventsList);
    events.add(event);
    await saveEvents(events);
  }

  /// Remove event from the list.
  /// If there is no events after deletion, then clear storage by the key.
  Future<void> removeEvent(String id) async {
    final events = List<EventModel>.from(eventsList);
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
    final events = List<EventModel>.from(eventsList);
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
