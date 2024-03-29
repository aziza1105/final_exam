import 'package:final_exam/features/calendar/parts/calendar_item.dart';
import 'package:flutter/material.dart';


class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Kalendar'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: const Column(
              children: [
                SizedBox(
                  height: 16,
                ),
                CalendarItem(
                  calendarNumber: 4,
                )
              ],
            ),
          ),
        ),
      );
}
