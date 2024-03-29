import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';

import '../../../assets/colors.dart';
import '../../../assets/icons.dart';
import '../../../core/widgets/w_scale_animation.dart';
import '../../../core/widgets/my_functions.dart';
import '../bloc/calendar_cubit.dart';
import '../widgets/calendar_data.dart';


class CustomCalendar extends StatefulWidget {
  final List<int> dateTimeMonths;

  const CustomCalendar({
    required this.dateTimeMonths,
    super.key,
  });

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {

  Color textColor = white;

  late CalendarCubit calendarCubit;
  final PageController pageController = PageController();
  int currentIndex = 0;
  List<String> weekdays = [
    'пн',
    'вт',
    'ср',
    'чт',
    'пт',
    'сб',
    'вс',
   
  ];

  @override
  void initState() {
    calendarCubit = CalendarCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => BlocProvider.value(
        value: calendarCubit,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WScaleAnimation(
                    onTap: () {
                      calendarCubit.updateIndexPrevious();
                      pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: RotatedBox(
                      quarterTurns: 2,
                      child: SvgPicture.asset(
                        AppIcons.arrow,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  BlocBuilder<CalendarCubit, int>(
                    builder: (context, state) => Text(
                      MyFunctions.getMonthByIndex(widget.dateTimeMonths[state]),
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                  WScaleAnimation(
                    onTap: () {
                      calendarCubit.updateIndexNext();
                      pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear);
                    },
                    child: SvgPicture.asset(
                      AppIcons.arrow,
                      width: 24,
                      height: 24,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 17,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    weekdays.length,
                    (index) => Expanded(
                          flex: 1,
                          child: Text(
                            weekdays[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .headline2!
                                .copyWith(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        )),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 290,
                child: PageView(
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: List.generate(
                      widget.dateTimeMonths.length,
                      (index) => GestureDetector(
                   onTap: () {
                   setState(() {
                          textColor = Colors.black;
                        });
                  
                },

                        child: CalendarData(
                          month: Jiffy.now(),
                        )

                      )),
                ),
              )
            ],
          ),
        ),
      );
}
