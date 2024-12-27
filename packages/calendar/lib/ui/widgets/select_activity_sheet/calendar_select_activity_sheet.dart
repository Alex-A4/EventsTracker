import 'package:calendar/calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

abstract class CalendarActivitySelectSheetTexts {
  AddEventButtonTexts get addEventButtonTexts;

  /// Title for dropdown that asks user to select event for activity
  String get selectActivityEvent;

  /// Title for dropdown that asks user to select task for activity
  String get selectActivityTask;

  /// Title for buttons +/- that asks user to choose amount of activity
  String get selectActivityAmount;

  /// Text for button to choose activity and complete flow
  String get chooseWord;
}

/// Bottom sheet that allows select some activity for specified day
class CalendarActivitySelectSheet extends StatefulWidget {
  const CalendarActivitySelectSheet({
    required this.controller,
    required this.texts,
    required this.navigationAdapter,
    super.key,
  });

  final ScrollController controller;
  final CalendarActivitySelectSheetTexts texts;
  final CalendarNavigationAdapter navigationAdapter;

  @override
  State<CalendarActivitySelectSheet> createState() => _CalendarActivitySelectSheetState();
}

class _CalendarActivitySelectSheetState extends State<CalendarActivitySelectSheet> {
  final _amountFocus = FocusNode();
  final _amountController = TextEditingController();
  bool _amountLastFocusValue = false;

  @override
  void initState() {
    _amountFocus.addListener(() {
      // focus removed when it was
      if (_amountLastFocusValue && !_amountFocus.hasFocus) {
        context.read<SelectActivityCubit>().updateActivityAmount(
              int.tryParse(_amountController.text) ?? 0,
            );
      }

      _amountLastFocusValue = _amountFocus.hasFocus;
    });
    super.initState();
  }

  @override
  void dispose() {
    _amountFocus.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SingleChildScrollView(
        controller: widget.controller,
        child: BlocConsumer<SelectActivityCubit, SelectActivityState>(
          listener: (context, state) {
            state.whenOrNull(
              data: (_, created, __, ___, selectedAmount) {
                if (selectedAmount != null && selectedAmount.toString() != _amountController.text) {
                  _amountController.text = selectedAmount.toString();
                }

                if (created) {
                  Navigator.of(context).pop();
                }
              },
            );
          },
          builder: (context, state) {
            return state.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (events, _, selectedEvent, selectedTask, selectedAmount) {
                if (events.isEmpty) {
                  return AddEventButton(
                    callbackAction: (ctx) =>
                        widget.navigationAdapter.goToAddEventFromSelectActivitySheet(ctx),
                    texts: widget.texts.addEventButtonTexts,
                  );
                }

                return Column(
                  children: [
                    SelectDropdown(
                      titleText: widget.texts.selectActivityEvent,
                      sheetTitle: widget.texts.selectActivityTask,
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
                    const SizedBox(height: 12),
                    AnimatedCollapse(
                      show: selectedEvent != null,
                      child: Builder(
                        builder: (context) {
                          if (selectedEvent == null) return const SizedBox.shrink();

                          return SelectDropdown<EventTaskWithStatistic>(
                            titleText: widget.texts.selectActivityTask,
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
                    const SizedBox(height: 12),
                    AnimatedCollapse(
                      show: selectedEvent != null,
                      child: Builder(
                        builder: (context) {
                          if (selectedEvent == null) return const SizedBox.shrink();

                          return AmountInputWidget(
                            controller: _amountController,
                            hintText: '0',
                            title: widget.texts.selectActivityAmount,
                            focus: _amountFocus,
                            increaseCallback:
                                context.read<SelectActivityCubit>().increaseActivityAmount,
                            decreaseCallback:
                                context.read<SelectActivityCubit>().decreaseActivityAmount,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 24),
                    AnimatedCollapse(
                      show: selectedTask != null && selectedEvent != null && selectedAmount != null,
                      child: PrimaryButton(
                        text: widget.texts.chooseWord,
                        onPressed: context.read<SelectActivityCubit>().createActivity,
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}
