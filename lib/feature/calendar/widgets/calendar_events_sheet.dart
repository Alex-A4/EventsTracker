import 'package:events_tracker/data/data.dart';
import 'package:events_tracker/feature/calendar/calendar.dart';
import 'package:events_tracker/feature/widgets/widgets.dart';
import 'package:events_tracker/generated/generated.dart';
import 'package:flutter/material.dart';

final _eventDayFormatterOtherYear = DateFormat('dd MMM yyyy');
final _eventDayFormatterThatYear = DateFormat('dd MMM');

Future<void> showCalendarEventsSheet({
  required BuildContext context,
  required CalendarDayStatistics data,
}) {
  return showCommonBottomSheet<void>(
    context: context,
    title: LocaleKeys.activitiesFor.tr(args: [
      (data.date.year == DateTime.now().year
              ? _eventDayFormatterThatYear
              : _eventDayFormatterOtherYear)
          .format(data.date)
    ]),
    body: (context, scrollController) => CalendarEventsSheet(
      data: data,
      controller: scrollController,
    ),
  );
}

/// Sheet that allows look though activities in some day
class CalendarEventsSheet extends StatelessWidget {
  const CalendarEventsSheet({
    required this.data,
    required this.controller,
    super.key,
  });

  final CalendarDayStatistics data;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: data.allTasks.map(_taskItem).toList(),
      ),
    );
  }

  Widget _taskItem(CalendarDayTaskStatistics activity) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: EventColorWidget.medium(color: activity.eventColor),
      title: Text(activity.taskName),
      subtitle: Text(
        LocaleKeys.taskCompletedForDayWithCountAndPercent.tr(
          args: [
            activity.completedInDay.toString(),
            activity.completedForDayPercent.toString(),
          ],
        ),
      ),
    );
  }
}
