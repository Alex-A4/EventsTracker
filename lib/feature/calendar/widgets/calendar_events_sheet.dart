import 'package:events_tracker/data/data.dart';
import 'package:events_tracker/feature/calendar/calendar.dart';
import 'package:events_tracker/feature/widgets/widgets.dart';
import 'package:events_tracker/generated/generated.dart';
import 'package:flutter/material.dart';

final _eventDayFormatterOtherYear = DateFormat('dd MMM yyyy');
final _eventDayFormatterThatYear = DateFormat('dd MMM');

Future<void> showCalendarEventsSheet({
  required BuildContext context,
  required CalendarDayActivities data,
  required Map<String, Color> colors,
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
      colors: colors,
      controller: scrollController,
    ),
  );
}

/// Sheet that allows look though activities in some day
class CalendarEventsSheet extends StatelessWidget {
  const CalendarEventsSheet({
    required this.data,
    required this.colors,
    required this.controller,
    super.key,
  });

  final CalendarDayActivities data;
  final Map<String, Color> colors;
  final ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: controller,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: data.tasks.map(_taskItem).toList(),
      ),
    );
  }

  Widget _taskItem(DayActivity activity) {
    return ListTile(
      leading: EventColorWidget.medium(color: colors[activity.eventId]!),
      title: Text(activity.completedCount.toString()),
    );
  }
}
