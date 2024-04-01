import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:calendar_event_app/views/me_data_source.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  DateTime minDate = DateTime.now();
  DateTime maxDate = DateTime.now().add(const Duration(days: 90));
  List<DateTime> generateBlackoutDates(List<DateTime> eventDates) {
    List<DateTime> allDates = [];
    List<DateTime> blackoutDates = [];

    DateTime startDate = DateTime(DateTime.now().year, 1, 1);
    DateTime endDate = DateTime(DateTime.now().year + 1, 1, 1);

    for (DateTime date = startDate;
        date.isBefore(endDate);
        date = date.add(const Duration(days: 1))) {
      allDates.add(date);
    }
    for (DateTime date in allDates) {
      
      if (!eventDates.contains(date)) {
        blackoutDates.add(date);
      }
    }

    return blackoutDates;
  }

  getMonthCellStyle(List<DateTime> eventDates) {
     List<DateTime> allDates = [];
   

    DateTime startDate = DateTime(DateTime.now().year, 1, 1);
    DateTime endDate = DateTime(DateTime.now().year + 1, 1, 1);

    for (DateTime date = startDate;
        date.isBefore(endDate);
        date = date.add(const Duration(days: 1))) {
      allDates.add(date);
    }
    for (DateTime date in allDates) {
       bool isEventDate = eventDates.contains(date);
   
       return  MonthCellStyle(
      backgroundColor:isEventDate ? Colors.blue :  Colors.transparent,
      
    );
      
    
    }

    
  }

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      minDate: minDate,
      maxDate: maxDate,
      headerHeight: 40,
      
      showNavigationArrow: true,
      initialSelectedDate: DateTime.now(),
      blackoutDatesTextStyle: const TextStyle(color: Colors.grey),
      dataSource: MeetingDataSource(getDataSource()),
      blackoutDates: generateBlackoutDates(event),
      
      appointmentTextStyle:
          const TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
      monthViewSettings:  MonthViewSettings(
        monthCellStyle: getMonthCellStyle(event),
          //  showAgenda: true,
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
          
          
    );
  }
}
