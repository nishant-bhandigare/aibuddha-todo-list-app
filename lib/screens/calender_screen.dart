import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:todolist_frontend/constants/colours.dart';

import '../components/custom_appbar.dart';

//create calender screen
class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColour,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: CustomAppBar(
          leftIcon: Icons.arrow_back,
          title: "Calender",
          rightIcon: null,
          onLeftIconPressed: (){
            Navigator.of(context).pop();
          },
          onRightIconPressed: (){},
        ),
      ),
      body: SfCalendar(
        view: CalendarView.day,
        dataSource: MeetingDataSource(_getDataSource()),
        allowAppointmentResize: false,
        allowDragAndDrop: false,
        headerStyle: CalendarHeaderStyle(
          textAlign: TextAlign.center,
          backgroundColor: backgroundColour,
        ),
        timeSlotViewSettings: const TimeSlotViewSettings(
          timeIntervalHeight: 70,
          startHour: 8,
          endHour: 18,
        ),
        appointmentBuilder: appointmentBuilder,
      ),
    );
  }

  Widget appointmentBuilder(BuildContext context, CalendarAppointmentDetails details) {
    final Meeting meeting = details.appointments.first;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: BoxDecoration(
        color: meeting.background,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              meeting.eventName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              '${meeting.from.hour}:${meeting.from.minute.toString().padLeft(2, '0')} - '
                  '${meeting.to.hour}:${meeting.to.minute.toString().padLeft(2, '0')}',
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 10, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(Meeting('Amanda at Ruth\'s', startTime, endTime, Colors.red, false));
    meetings.add(Meeting('Read online reviews', startTime.add(const Duration(hours: 2, minutes: 30)), endTime.add(const Duration(hours: 3, minutes: 30)), Colors.green, false));
    meetings.add(Meeting('Walk with dog', startTime.add(const Duration(hours: 5)), endTime.add(const Duration(hours: 6)), Colors.blue, false));
    return meetings;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  final String eventName;
  final DateTime from;
  final DateTime to;
  final Color background;
  final bool isAllDay;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}
