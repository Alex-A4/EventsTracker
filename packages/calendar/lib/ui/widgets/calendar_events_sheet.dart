import 'package:calendar/domain/domain.dart';
import 'package:intl/intl.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:flutter/material.dart';

abstract class CalendarEventsSheetTexts {
  /// Text for task that is completed for [completedDays] days and [completedPercent] percent
  String taskCompletedForDayWithCountAndPercent(String completedDays, String completedPercent);
}

final eventDayFormatterOtherYear = DateFormat('dd MMM yyyy');
final eventDayFormatterThatYear = DateFormat('dd MMM');

/// Sheet that allows look though activities in some day
class CalendarEventsSheet extends StatelessWidget {
  const CalendarEventsSheet({
    required this.data,
    required this.controller,
    required this.texts,
    super.key,
  });

  final CalendarDayStatistics data;
  final ScrollController controller;
  final CalendarEventsSheetTexts texts;

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
    return Builder(builder: (context) {
      return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: EventColorWidget.medium(color: activity.eventColor),
        title: Text(
          activity.taskName,
        ),
        subtitle: Text(
          texts.taskCompletedForDayWithCountAndPercent(
            activity.completedInDay.toString(),
            activity.completedForDayPercent.toString(),
          ),
        ),
      );
    });
  }
}
