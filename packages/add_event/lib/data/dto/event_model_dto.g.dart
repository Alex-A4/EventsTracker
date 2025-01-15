// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModelDto _$EventModelDtoFromJson(Map<String, dynamic> json) =>
    EventModelDto(
      id: json['id'] as String,
      eventTitle: json['eventTitle'] as String,
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => EventTaskDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      color: colorJsonConverter.fromJson((json['color'] as num).toInt()),
    );

Map<String, dynamic> _$EventModelDtoToJson(EventModelDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'eventTitle': instance.eventTitle,
      'tasks': instance.tasks,
      'color': colorJsonConverter.toJson(instance.color),
    };

EventTaskDto _$EventTaskDtoFromJson(Map<String, dynamic> json) => EventTaskDto(
      id: json['id'] as String,
      taskName: json['taskName'] as String,
      plan: (json['plan'] as num).toInt(),
    );

Map<String, dynamic> _$EventTaskDtoToJson(EventTaskDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'taskName': instance.taskName,
      'plan': instance.plan,
    };
