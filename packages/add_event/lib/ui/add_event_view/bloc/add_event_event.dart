import 'dart:ui';

sealed class AddEventEvent {
  const AddEventEvent();
}

class CreateEvent extends AddEventEvent {
  const CreateEvent();
}

class RenameEvent extends AddEventEvent {
  final String name;

  const RenameEvent({required this.name});
}

class ChangeColor extends AddEventEvent {
  final Color color;
  const ChangeColor({required this.color});
}

class AddNewTask extends AddEventEvent {
  const AddNewTask();
}

class RenameTask extends AddEventEvent {
  final String id;
  final String name;

  const RenameTask({required this.id, required this.name});
}

class ChangeTaskPlan extends AddEventEvent {
  final String id;
  final int plan;

  const ChangeTaskPlan({required this.id, required this.plan});
}

class RemoveTask extends AddEventEvent {
  final String id;

  const RemoveTask({required this.id});
}
