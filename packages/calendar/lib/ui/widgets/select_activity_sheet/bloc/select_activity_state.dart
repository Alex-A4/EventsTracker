part of 'select_activity_bloc.dart';

@freezed
class SelectActivityState with _$SelectActivityState {
  const factory SelectActivityState.loading() = _Loading;

  const factory SelectActivityState.data({
    required List<EventModelWithStatistic> events,
    required bool created,
    EventModelWithStatistic? selectedEvent,
    EventTaskWithStatistic? selectedTask,
    int? selectedAmount,
  }) = _Data;
}
