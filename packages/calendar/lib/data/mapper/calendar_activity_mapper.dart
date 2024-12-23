import 'package:calendar/data/data.dart';
import 'package:calendar/domain/domain.dart';

class CalendarActivityMapperToEntity {
  final CalendarDayActivitiesDto dto;

  CalendarActivityMapperToEntity(this.dto);

  CalendarDayActivities transform() => CalendarDayActivities(
        date: dto.date,
        tasks: dto.tasks.map((t) => DayActivityMapperToEntity(t).transform()).toList(),
      );
}

class DayActivityMapperToEntity {
  final DayActivityDto dto;

  DayActivityMapperToEntity(this.dto);

  DayActivity transform() => DayActivity(
        eventId: dto.eventId,
        taskId: dto.taskId,
        completedCount: dto.completedCount,
      );
}

class CalendarActivityMapperToDto {
  final CalendarDayActivities entity;

  CalendarActivityMapperToDto(this.entity);

  CalendarDayActivitiesDto transform() => CalendarDayActivitiesDto(
        date: entity.date,
        tasks: entity.tasks.map((t) => DayActivityMapperToDto(t).transform()).toList(),
      );
}

class DayActivityMapperToDto {
  final DayActivity entity;

  DayActivityMapperToDto(this.entity);

  DayActivityDto transform() => DayActivityDto(
        eventId: entity.eventId,
        taskId: entity.taskId,
        completedCount: entity.completedCount,
      );
}
