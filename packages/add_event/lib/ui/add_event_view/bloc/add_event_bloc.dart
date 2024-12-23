import 'dart:math';
import 'dart:ui';

import 'package:add_event/data/data.dart';
import 'package:add_event/domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';

class AddEventBloc extends Bloc<AddEventEvent, AddEventState> {
  AddEventBloc(this.service, this.oldEvent)
      : super(
          oldEvent == null
              ? AddEventState(
                  eventName: '',
                  // generate random color from 35 to 225 (without corners)
                  eventColor: Color.fromARGB(
                    255,
                    Random().nextInt(190) + 35,
                    Random().nextInt(190) + 35,
                    Random().nextInt(190) + 35,
                  ),
                  tasks: [],
                  created: false,
                  isLoading: false,
                )
              : AddEventState(
                  eventName: oldEvent.eventTitle,
                  // generate random color from 35 to 225 (without corners)
                  eventColor: oldEvent.color,
                  tasks: oldEvent.tasks,
                  created: false,
                  isLoading: false,
                ),
        ) {
    _registerHandlers();
  }

  EventModel? oldEvent;
  final AddEventService service;

  void _registerHandlers() {
    on<CreateEvent>(
      (_, emit) async {
        emit(state.copyWith(isLoading: true));

        if (oldEvent != null) {
          await service.updateEvent(
            eventId: oldEvent!.id,
            eventName: state.eventName,
            color: state.eventColor,
            tasks: state.tasks,
          );
        } else {
          await service.createEvent(
            eventName: state.eventName,
            color: state.eventColor,
            tasks: state.tasks,
          );
        }

        emit(state.copyWith(isLoading: false, created: true));
      },
    );

    on<RenameEvent>(
      (event, emit) => emit(state.copyWith(eventName: event.name)),
    );
    on<ChangeColor>(
      (event, emit) => emit(state.copyWith(eventColor: event.color)),
    );
    on<AddNewTask>(
      (_, emit) => emit(
        state.copyWith(
          tasks: List.from([...state.tasks, EventTask.create(taskName: '', plan: 0)]),
        ),
      ),
    );
    on<RenameTask>(
      (event, emit) => emit(
        state.copyWith(
          tasks: state.tasks
              .map((t) => t.id == event.id ? t.copyWith(taskName: event.name) : t)
              .toList(),
        ),
      ),
    );
    on<ChangeTaskPlan>(
      (event, emit) => emit(
        state.copyWith(
          tasks:
              state.tasks.map((t) => t.id == event.id ? t.copyWith(plan: event.plan) : t).toList(),
        ),
      ),
    );
    on<RemoveTask>(
      (event, emit) => emit(
        state.copyWith(tasks: state.tasks.where((t) => t.id != event.id).toList()),
      ),
    );
  }
}
