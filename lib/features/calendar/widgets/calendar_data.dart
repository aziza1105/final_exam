import 'package:flutter/material.dart'
    '';
import 'package:jiffy/jiffy.dart';


import '../../../core/widgets/my_functions.dart';
import 'calendar_day_box.dart';

class CalendarData extends StatefulWidget {
  final Jiffy month;

  const CalendarData({
    required this.month,
    Key? key,
  }) : super(key: key);

  @override
  State<CalendarData> createState() => _CalendarDataState();
}

class _CalendarDataState extends State<CalendarData> {
  Color textColor = Colors.white;



  @override
  Widget build(BuildContext context) => Container(
    width: MediaQuery.of(context).size.width,
    margin: const EdgeInsets.only(left: 8),
    child: Wrap(runSpacing: 8, spacing: 8, children: [
      ...List.generate(
          widget.month.dateTime.weekday > 1 ? widget.month.dateTime.weekday - 1 : 0,
              (index) => const SizedBox(
            height: 42,
            width: 42,
          )),
      ...List.generate(
        widget.month.daysInMonth,
            (index) => CalendarDayBox(
            day: index + 1,
            weekDayId: MyFunctions.calculateWeekday(
                widget.month.dateTime.weekday + index)),
      ),
    ]),
  );
}
