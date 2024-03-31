import 'package:events_tracker/di/di.dart';
import 'package:events_tracker/feature/calendar/calendar.dart';
import 'package:events_tracker/feature/calendar/widgets/select_activity_sheet/bloc/select_activity_bloc.dart';
import 'package:events_tracker/feature/settings/settings.dart';
import 'package:events_tracker/feature/widgets/widgets.dart';
import 'package:events_tracker/generated/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Helper function to display [CalendarActivitySelectSheet]
Future<void> showCalendarSelectActivitySheet({
  required BuildContext context,
  required DateTime date,
}) {
  return showCommonBottomSheet<void>(
    context: context,
    title: LocaleKeys.selectActivityAtDate.tr(args: [
      formatTitleForDate(date),
    ]),
    body: (context, scrollController) => BlocProvider<SelectActivityCubit>(
      create: (context) => SelectActivityCubit(inject(), date),
      child: CalendarActivitySelectSheet(
        controller: scrollController,
      ),
    ),
  );
}

class CalendarActivitySelectSheet extends StatelessWidget {
  const CalendarActivitySelectSheet({
    required this.controller,
    super.key,
  });

  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: BlocConsumer<SelectActivityCubit, SelectActivityState>(
        listener: (context, state) {
          state.whenOrNull(
            data: (_, created, __, ___) {
              if (created) {
                Navigator.of(context).pop();
              }
            },
          );
        },
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            data: (events, _, selectedEvent, selectedTask) {
              if (events.isEmpty) {
                return AddEventButton(
                  callbackAction: (ctx) => Navigator.of(ctx).pop(),
                );
              }

              return Column(
                children: [
                  SelectDropdown(
                    titleText: LocaleKeys.selectActivityEvent.tr(),
                    sheetTitle: LocaleKeys.selectActivityTask.tr(),
                    currentValue: selectedEvent,
                    values: events
                        .map(
                          (e) => SheetDropdownItem(
                            value: e,
                            title: e.eventTitle,
                            icon: EventColorWidget.big(color: e.color),
                          ),
                        )
                        .toList(),
                    onChanged: context.read<SelectActivityCubit>().selectEvent,
                  ),
                  AnimatedCollapse(
                    show: selectedEvent != null,
                    child: Builder(
                      builder: (context) {
                        if (selectedEvent == null) return const SizedBox.shrink();

                        return SelectDropdown(
                          titleText: LocaleKeys.selectActivityTask.tr(),
                          currentValue: selectedTask,
                          values: selectedEvent.tasks
                              .map(
                                (e) => SheetDropdownItem(
                                  value: e,
                                  title: e.taskName,
                                ),
                              )
                              .toList(),
                          onChanged: context.read<SelectActivityCubit>().selectTask,
                        );
                      },
                    ),
                  ),
                  AnimatedCollapse(
                    show: selectedTask != null && selectedEvent != null,
                    child: PrimaryButton(
                      text: LocaleKeys.chooseWord.tr(),
                      onPressed: context.read<SelectActivityCubit>().createActivity,
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
