import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'event_model.freezed.dart';
part 'event_model.g.dart';

/// Planned event that will be displayed information about some event and requried actions to
/// complete it.
@freezed
class EventModel with _$EventModel {
  const factory EventModel({
    required String id,
    required String title,
    // how many times user should complete this event for the year
    required int plan,
    // color is hex-decilam 32-bit int, for example 0xFFAABBCC
    required int color,
  }) = _EventModel;

  factory EventModel.create({
    required String title,
    required int plan,
    required int color,
  }) =>
      EventModel(
        id: const Uuid().v4(),
        title: title,
        plan: plan,
        color: color,
      );

  factory EventModel.fromJson(Map<String, dynamic> json) =>
      _$EventModelFromJson(json);
}
