

import 'package:flutter/material.dart';

import '../../../core/widgets/my_functions.dart';
import '../../../core/widgets/w_button.dart';

import 'calendar.dart';

class CalendarItem extends StatefulWidget {
  final int calendarNumber;

  const CalendarItem({
    required this.calendarNumber,
    super.key,
  });

  @override
  State<CalendarItem> createState() => _CalendarItemState();
}

class _CalendarItemState extends State<CalendarItem> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text(
                'Coming soon',
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              content: Text(
                'These features are coming soon...',
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              actions: [
                WButton(
                  onTap: () {
                    Navigator.pop(_);
                  },
                  text: 'Close',
                )
              ],
            ),
          );
        },
        child: Column(
          children: [
      
            const SizedBox(
              height: 16,
            ),
            CustomCalendar(
                dateTimeMonths:
                    MyFunctions.getMonthIndexes(widget.calendarNumber)),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      );
}
