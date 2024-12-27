import 'package:calendar/calendar.dart';
import 'package:events_tracker/app/router/router.dart';
import 'package:events_tracker/di/di.dart';
import 'package:events_tracker/feature/feature.dart';
import 'package:events_tracker/generated/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

class CalendarNavigationAdapterImpl implements CalendarNavigationAdapter {
  const CalendarNavigationAdapterImpl();

  @override
  Future<void> showCalendarSelectActivitySheet({
    required BuildContext context,
    required DateTime date,
  }) {
    return showCommonBottomSheet<void>(
      context: context,
      title: LocaleKeys.selectActivityAtDate.tr(args: [
        _formatTitleForDate(date),
      ]),
      body: (context, scrollController) => BlocProvider<SelectActivityCubit>(
        create: (context) => SelectActivityCubit(inject(), date),
        child: CalendarActivitySelectSheet(
          controller: scrollController,
          texts: CalendarActivitySelectSheetTextsImpl(),
          navigationAdapter: this,
        ),
      ),
    );
  }

  /// Helper function to display [CalendarEventsSheet]
  @override
  Future<void> showCalendarEventsSheet({
    required BuildContext context,
    required CalendarDayStatistics data,
  }) {
    return showCommonBottomSheet<void>(
      context: context,
      title: LocaleKeys.activitiesFor.tr(args: [_formatTitleForDate(data.date)]),
      titleAction: Builder(
        builder: (context) {
          return PrimaryIconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pop();
              showCalendarSelectActivitySheet(context: context, date: data.date);
            },
          );
        },
      ),
      body: (context, scrollController) => CalendarEventsSheet(
        data: data,
        controller: scrollController,
        texts: const CalendarEventsSheetTextsImpl(),
      ),
    );
  }

  @override
  Future<void> goToAddEventFromSelectActivitySheet(BuildContext context) async {
    Navigator.of(context).pop();
    AddEventRoute().go(context);
  }

  String _formatTitleForDate(DateTime date) =>
      (date.year == DateTime.now().year ? eventDayFormatterThatYear : eventDayFormatterOtherYear)
          .format(date);
}
