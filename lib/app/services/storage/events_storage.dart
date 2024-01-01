import 'dart:convert';

import 'package:events_tracker/app/services/storage/storage.dart';
import 'package:events_tracker/data/models/models.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/subjects.dart';

const _eventsStorageKey = 'events_key';

final _defaultEvents = [
  EventModel.create(
    title: 'Тренировки',
    plan: 50,
    color: Colors.blue.value,
  ),
];

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
      _eventsListSubject.add(_defaultEvents);
    }
  }

  final _eventsListSubject = BehaviorSubject<List<EventModel>>();

  Stream<List<EventModel>> get eventsStream => _eventsListSubject;

  List<EventModel> get eventsList => _eventsListSubject.value;

  /// Add new event to storage and update stream
  Future<void> addEvent(EventModel event) async {
    eventsList.add(event);

    await shared.setString(
      _eventsStorageKey,
      jsonEncode(eventsList.map((e) => e.toJson()).toList()),
    );

    _eventsListSubject.add(eventsList);
  }

  /// Remove event from the list.
  /// If there is no events after deletion, then clear storage by the key.
  Future<void> removeEvent(String id) async {
    eventsList.removeWhere((e) => e.id == id);

    if (eventsList.isEmpty) {
      await shared.remove(_eventsStorageKey);
    } else {
      await shared.setString(
        _eventsStorageKey,
        jsonEncode(eventsList.map((e) => e.toJson()).toList()),
      );
    }

    _eventsListSubject.add(eventsList);
  }
}
