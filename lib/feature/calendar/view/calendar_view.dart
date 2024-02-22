import 'package:collection/collection.dart';
import 'package:events_tracker/data/data.dart';
import 'package:events_tracker/feature/calendar/calendar.dart';
import 'package:events_tracker/generated/generated.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

const _maxDisplayedEventColors = 3;

class CalendarView extends StatelessWidget {
  const CalendarView({
    required this.activities,
    super.key,
  });

  final Map<DateTime, CalendarDayStatistics> activities;

  @override
  Widget build(BuildContext context) {
    final todayDay = DateTime.now();

    return SingleChildScrollView(
      child: Column(
        children: [
          TableCalendar<CalendarDayTaskStatistics>(
            locale: context.locale.languageCode,
            onDaySelected: (selected, focused) {
              final data = activities[cropDate(selected)];
              if (data != null) {
                showCalendarEventsSheet(
                  context: context,
                  data: data,
                );
              } else {
                // TODO(alex-a4): oepn dialog to add activity for day
              }
            },
            holidayPredicate: (d) => d.weekday == 6 || d.weekday == 7,
            currentDay: todayDay,
            eventLoader: getEvents,
            startingDayOfWeek: StartingDayOfWeek.monday,
            availableCalendarFormats: const {CalendarFormat.month: ''},
            availableGestures: AvailableGestures.horizontalSwipe,
            headerStyle: const HeaderStyle(titleCentered: true),
            calendarBuilders: CalendarBuilders<CalendarDayTaskStatistics>(
              markerBuilder: markerBuilder,
            ),
            lastDay: todayDay.add(const Duration(days: 360)),
            firstDay: todayDay.subtract(const Duration(days: 360)),
            focusedDay: todayDay,
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              holidayTextStyle: const TextStyle(color: Colors.red),
              holidayDecoration: const BoxDecoration(shape: BoxShape.circle),
              todayTextStyle: const TextStyle(color: Colors.black),
              canMarkersOverflow: false,
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue[700]!, width: 3),
              ),
            ),
            selectedDayPredicate: (d) => false,
          ),
        ],
      ),
    );
  }

  List<CalendarDayTaskStatistics> getEvents(DateTime day) =>
      activities[cropDate(day)]?.allTasks ?? [];

  /// Builder of marker to display day with menstruation start
  Widget markerBuilder(
    BuildContext context,
    DateTime date,
    List<CalendarDayTaskStatistics> events,
  ) {
    if (events.isEmpty) {
      return const SizedBox.shrink();
    }

    final uniqueColors = events.map((e) => e.eventColor).toSet();

    if (uniqueColors.length > _maxDisplayedEventColors) {
      return _countDisplayedColors(uniqueColors.length);
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: uniqueColors
          .mapIndexed(
            (i, color) => _eventColorMarker(color, i < uniqueColors.length - 1),
          )
          .toList(),
    );
  }

  DateTime? cropDate(DateTime? date) =>
      date == null ? null : DateTime(date.year, date.month, date.day);

  Widget _eventColorMarker(Color color, bool hasNext) {
    return Padding(
      padding: EdgeInsets.only(right: hasNext ? 2 : 0),
      child: EventColorWidget.small(color: color),
    );
  }

  Widget _countDisplayedColors(int length) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Container(
        width: 20,
        height: 20,
        margin: const EdgeInsets.only(right: 4, bottom: 4),
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        child: Text(
          length.toString(),
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
