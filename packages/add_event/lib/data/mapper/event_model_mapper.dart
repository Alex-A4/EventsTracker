import 'package:add_event/add_event.dart';

class EventModelMapperToEntity {
  final EventModelDto dto;

  EventModelMapperToEntity(this.dto);

  EventModel transform() => EventModel(
        id: dto.id,
        eventTitle: dto.eventTitle,
        tasks: dto.tasks.map((t) => EventTaskMapperToEntity(t).transform()).toList(),
        color: dto.color,
      );
}

class EventTaskMapperToEntity {
  final EventTaskDto dto;

  EventTaskMapperToEntity(this.dto);

  EventTask transform() => EventTask(
        id: dto.id,
        taskName: dto.taskName,
        plan: dto.plan,
      );
}

class EventModelMapperToDto {
  final EventModel entity;

  EventModelMapperToDto(this.entity);

  EventModelDto transform() => EventModelDto(
        id: entity.id,
        eventTitle: entity.eventTitle,
        tasks: entity.tasks.map((t) => EventTaskMapperToDto(t).transform()).toList(),
        color: entity.color,
      );
}

class EventTaskMapperToDto {
  final EventTask entity;

  EventTaskMapperToDto(this.entity);

  EventTaskDto transform() => EventTaskDto(
        id: entity.id,
        taskName: entity.taskName,
        plan: entity.plan,
      );
}
