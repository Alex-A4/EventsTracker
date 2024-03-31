import 'dart:async';

import 'package:events_tracker/app/services/services.dart';
import 'package:events_tracker/data/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'select_activity_state.dart';
part 'select_activity_bloc.freezed.dart';

class SelectActivityCubit extends Cubit<SelectActivityState> {
  SelectActivityCubit(this.service, this.date) : super(const SelectActivityState.loading()) {
    sub = service.eventsStream.listen(
      (events) => emit(
        SelectActivityState.data(
          events: events,
          selectedEvent: events.isEmpty ? null : events.first,
          selectedTask: events.isEmpty ? null : events.first.tasks.first,
          created: false,
        ),
      ),
    );
  }

  final DateTime date;
  final CalendarService service;

  late StreamSubscription<dynamic> sub;

  void selectEvent(EventModel event) {
    final s = state;
    if (s is _Data) {
      // do not use copyWith to drop selectedTask field
      emit(SelectActivityState.data(
        events: s.events,
        created: false,
        selectedEvent: event,
        selectedTask: event.tasks.first,
      ));
    }
  }

  void selectTask(EventTask task) {
    final s = state;
    if (s is _Data && s.selectedEvent != null) {
      emit(s.copyWith(selectedTask: task));
    }
  }

  void createActivity() async {
    final s = state;

    if (s is _Data && s.selectedEvent != null && s.selectedTask != null) {
      service.increaseDayActivity(
        date: date,
        eventId: s.selectedEvent!.id,
        taskId: s.selectedTask!.id,
      );

      emit(s.copyWith(created: true));
    }
  }

  @override
  Future<void> close() {
    sub.cancel();

    return super.close();
  }
}
