import 'package:flutter/material.dart';
import 'package:calendar_event_app/views/calendar_widget.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calendar Event App'),
        centerTitle: true,
      ),
      body:const CalendarWidget(),
      
    );
  }
}