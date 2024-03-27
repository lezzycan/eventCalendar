import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

List<Meeting> getDataSource() {
  final List<Meeting> meetings = <Meeting>[];

  
   
  final DateTime startime1 = DateTime(2024, 03, 21, );
    final DateTime startime2= DateTime(2024, 03, 23);
      final DateTime startime3 = DateTime(2024, 05, 03);
        final DateTime startime4 = DateTime(2024, 06, 05);
  final List<Meeting> events = [
     Meeting('', startime1, startime1, Colors.green, false),
    Meeting(
      '', startime2, startime2, const Color(0xFF0F8644), false),
       Meeting(
      '', startime3, startime3, const Color(0xFF0F8644), false),
       Meeting(
      '', startime4, startime4, const Color(0xFF0F8644), false),
  ];

   meetings.addAll(events);
  
  return meetings;
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

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
