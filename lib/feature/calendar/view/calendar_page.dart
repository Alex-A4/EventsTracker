import 'package:events_tracker/di/di.dart';
import 'package:events_tracker/feature/calendar/calendar.dart';
import 'package:events_tracker/generated/generated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CalendarBloc>(
      create: (_) => CalendarBloc(
        activitiesStorage: inject(),
        eventsStorage: inject(),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(LocaleKeys.calendarTitle.tr()),
        ),
        body: BlocBuilder<CalendarBloc, CalendarBlocState>(
          builder: (context, state) {
            return CalendarView(
              activities: state.activities,
              eventColors: state.eventColors,
            );
          },
        ),
      ),
    );
  }
}