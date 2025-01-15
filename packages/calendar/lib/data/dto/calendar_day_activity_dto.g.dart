// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_day_activity_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CalendarDayActivitiesDto _$CalendarDayActivitiesDtoFromJson(
        Map<String, dynamic> json) =>
    CalendarDayActivitiesDto(
      date: dateTimeJsonConverter.fromJson((json['date'] as num).toInt()),
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => DayActivityDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CalendarDayActivitiesDtoToJson(
        CalendarDayActivitiesDto instance) =>
    <String, dynamic>{
      'date': dateTimeJsonConverter.toJson(instance.date),
      'tasks': instance.tasks,
    };

DayActivityDto _$DayActivityDtoFromJson(Map<String, dynamic> json) =>
    DayActivityDto(
      eventId: json['eventId'] as String,
      taskId: json['taskId'] as String,
      completedCount: (json['completedCount'] as num).toInt(),
    );

Map<String, dynamic> _$DayActivityDtoToJson(DayActivityDto instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'taskId': instance.taskId,
      'completedCount': instance.completedCount,
    };
