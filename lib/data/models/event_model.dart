import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

/// Planned event that will be displayed information about some event and requried actions to
/// complete it.
/// This event is just a description on general plans. To specify tasks inside this plan, see
/// [EventTask].
@freezed
class EventModel with _$EventModel {
  const factory EventModel({
    required String id,
    required String eventTitle,
    // list of tasks that should be completed to complete event in general
    required List<EventTask> tasks,
    // color is hex-decilam 32-bit int, for example 0xFFAABBCC
    required int color,
  }) = _EventModel;

  factory EventModel.create({
    required String eventTitle,
    required List<EventTask> tasks,
    required int color,
  }) =>
      EventModel(
        id: const Uuid().v4(),
        eventTitle: eventTitle,
        tasks: tasks,
        color: color,
      );

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}

/// One task from [EventModel] that allows specify different types of
/// tasks inside some plan.
/// While [EventModel] is a general plan, for example, `Boxing`.
/// [EventTask] is a sub-task of `Boxing`, for example:
/// `Visit 50 trainings` or `Make 10000 push-ups`
@freezed
class EventTask with _$EventTask {
  const factory EventTask({
    required String id,
    required String taskName,
    // how many times user should complete this task for your plan
    required int plan,
  }) = _EventTask;

  factory EventTask.create({
    required String taskName,
    required int plan,
  }) =>
      EventTask(
        id: const Uuid().v4(),
        taskName: taskName,
        plan: plan,
      );

  factory EventTask.fromJson(Map<String, dynamic> json) =>
      _$EventTaskFromJson(json);
}
