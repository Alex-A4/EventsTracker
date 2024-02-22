import 'dart:math';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:events_tracker/app/services/services.dart';
import 'package:events_tracker/data/data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_event_state.dart';
part 'add_event_event.dart';
part 'add_event_bloc.freezed.dart';

class AddEventBloc extends Bloc<AddEventEvent, AddEventState> {
  AddEventBloc(this.service)
      : super(
          AddEventState(
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
          ),
        ) {
    _registerHandlers();
  }

  final CalendarService service;

  void _registerHandlers() {
    on<_CreateEvent>(
      (_, emit) async {
        emit(state.copyWith(isLoading: true));

        await service.createEvent(
          eventName: state.eventName,
          color: state.eventColor,
          tasks: state.tasks,
        );

        emit(state.copyWith(isLoading: false, created: true));
      },
    );

    on<_RenameEvent>(
      (event, emit) => emit(state.copyWith(eventName: event.name)),
    );
    on<_ChangeColor>(
      (event, emit) => emit(state.copyWith(eventColor: event.color)),
    );
    on<_AddNewTask>(
      (_, emit) => emit(
        state.copyWith(
          tasks: List.from([...state.tasks, EventTask.create(taskName: '', plan: 0)]),
        ),
      ),
    );
    on<_RenameTask>(
      (event, emit) => emit(
        state.copyWith(
          tasks: state.tasks
              .map((t) => t.id == event.id ? t.copyWith(taskName: event.name) : t)
              .toList(),
        ),
      ),
    );
    on<_ChangeTaskPlan>(
      (event, emit) => emit(
        state.copyWith(
          tasks:
              state.tasks.map((t) => t.id == event.id ? t.copyWith(plan: event.plan) : t).toList(),
        ),
      ),
    );
    on<_RemoveTask>(
      (event, emit) => emit(
        state.copyWith(tasks: state.tasks.where((t) => t.id != event.id).toList()),
      ),
    );
  }
}
