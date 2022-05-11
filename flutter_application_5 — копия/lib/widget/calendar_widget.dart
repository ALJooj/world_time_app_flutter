import 'package:flutter/material.dart';
import 'package:flutter_application_5/model/event_data_source.dart';
import 'package:flutter_application_5/provider/event_provider.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;

    return SfCalendar(
      dataSource: EventDataSource(events),
      view: CalendarView.month,
      initialSelectedDate: DateTime.now(),
    );
  }
}
