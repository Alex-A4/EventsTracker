import 'package:events_tracker/data/data.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

const _maxDisplayedEventColors = 3;

class CalendarView extends StatelessWidget {
  const CalendarView({
    required this.activities,
    required this.eventColors,
    super.key,
  });

  final Map<DateTime, CalendarDayActivities> activities;
  final Map<String, Color> eventColors;

  @override
  Widget build(BuildContext context) {
    final todayDay = DateTime.now();

    return SingleChildScrollView(
      child: Column(
        children: [
          TableCalendar<DayActivity>(
            onDaySelected: (selected, focused) {},
            holidayPredicate: (d) => d.weekday == 6 || d.weekday == 7,
            currentDay: todayDay,
            eventLoader: getEvents,
            startingDayOfWeek: StartingDayOfWeek.monday,
            availableCalendarFormats: const {CalendarFormat.month: ''},
            availableGestures: AvailableGestures.horizontalSwipe,
            headerStyle: const HeaderStyle(titleCentered: true),
            calendarBuilders: CalendarBuilders<DayActivity>(
              markerBuilder: markerBuilder,
            ),
            lastDay: todayDay.add(const Duration(days: 360)),
            firstDay: todayDay.subtract(const Duration(days: 360)),
            focusedDay: todayDay,
            calendarStyle: CalendarStyle(
              isTodayHighlighted: true,
              holidayTextStyle: const TextStyle(color: Colors.red),
              holidayDecoration: const BoxDecoration(shape: BoxShape.circle),
              todayTextStyle: TextStyle(color: Colors.grey[400]),
              todayDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue[700],
              ),
            ),
            selectedDayPredicate: (d) => false, //cropDate(d) == cropDate(selectedDate),
          ),
        ],
      ),
    );
  }

  List<DayActivity> getEvents(DateTime day) => activities[cropDate(day)]?.tasks ?? [];

  /// Builder of marker to display day with menstruation start
  Widget markerBuilder(
    BuildContext context,
    DateTime date,
    List<DayActivity> events,
  ) {
    if (events.isEmpty) {
      return const SizedBox.shrink();
    }

    final uniqueIds = events.map((e) => e.eventId).toSet();
    final uniqueColors = uniqueIds.map((id) => eventColors[id]!).take(_maxDisplayedEventColors);

    return Row(
      children: uniqueColors.map(_eventColorMarker).toList(),
    );
  }

  DateTime? cropDate(DateTime? date) =>
      date == null ? null : DateTime(date.year, date.month, date.day);

  Widget _eventColorMarker(Color color) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
