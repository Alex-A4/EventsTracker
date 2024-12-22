import 'dart:ui';

import 'package:add_event/data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event_model_dto.g.dart';

@JsonSerializable()
class EventModelDto {
  final String id;
  final String eventTitle;
  // list of tasks that should be completed to complete event in general
  final List<EventTaskDto> tasks;

  /// Color is hex-decilam 32-bit int, for example 0xFFAABBCC
  @colorJsonConverter
  final Color color;

  const EventModelDto({
    required this.id,
    required this.eventTitle,
    required this.tasks,
    required this.color,
  });

  factory EventModelDto.fromJson(Map<String, dynamic> json) => _$EventModelDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EventModelDtoToJson(this);
}

@JsonSerializable()
class EventTaskDto {
  final String id;
  final String taskName;
  final int plan;

  const EventTaskDto({
    required this.id,
    required this.taskName,
    required this.plan,
  });

  factory EventTaskDto.fromJson(Map<String, dynamic> json) => _$EventTaskDtoFromJson(json);

  Map<String, dynamic> toJson() => _$EventTaskDtoToJson(this);
}
