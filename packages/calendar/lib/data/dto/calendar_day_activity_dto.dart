import 'package:calendar/data/data.dart';
import 'package:json_annotation/json_annotation.dart';

part 'calendar_day_activity_dto.g.dart';

@JsonSerializable()
class CalendarDayActivitiesDto {
  @dateTimeJsonConverter
  final DateTime date;
  final List<DayActivityDto> tasks;

  const CalendarDayActivitiesDto({
    required this.date,
    required this.tasks,
  });
  factory CalendarDayActivitiesDto.fromJson(Map<String, dynamic> json) =>
      _$CalendarDayActivitiesDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CalendarDayActivitiesDtoToJson(this);
}

@JsonSerializable()
class DayActivityDto {
  final String eventId;
  final String taskId;
  final int completedCount;

  DayActivityDto({
    required this.eventId,
    required this.taskId,
    required this.completedCount,
  });

  factory DayActivityDto.fromJson(Map<String, dynamic> json) => _$DayActivityDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DayActivityDtoToJson(this);
}
