import 'package:flutter/material.dart';
import 'package:home_space/core/utils/colors.dart';
import 'package:home_space/core/utils/styles.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  const CustomCalendar({super.key});

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  DateTime today = DateTime.now();

  void _onDaySelected(DateTime day, _) {
    setState(() {
      today = day;
    });
  }

  bool _isSameWeek(DateTime day1, DateTime day2) {
    DateTime weekStart(DateTime d) {
      return d.subtract(Duration(days: d.weekday % 7));
    }

    final start1 = weekStart(day1);
    final start2 = weekStart(day2);

    return isSameDay(start1, start2);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsData.kBorderColor, // border color
          width: 2, // border width
        ),
        borderRadius: BorderRadius.circular(8), // optional rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: DateTime.now(),
              headerVisible: false,
              startingDayOfWeek: StartingDayOfWeek.sunday,
              rowHeight: 2, // height of weekday header
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  List<String> letters = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
                  return Center(
                    child: Text(
                      letters[day.weekday % 7],
                      style: AppStyles.bold14.copyWith(
                        color: ColorsData.kMediumPrimaryColor,
                      ),
                    ),
                  );
                },
                defaultBuilder: (context, day, focusedDay) {
                  return const SizedBox.shrink(); // hide all day cells
                },
                todayBuilder: (context, day, focusedDay) {
                  return const SizedBox.shrink(); // hide today
                },
                selectedBuilder: (context, day, focusedDay) {
                  return const SizedBox.shrink(); // hide selected day
                },
              ),
              calendarStyle: const CalendarStyle(
                outsideDaysVisible: false,
                defaultTextStyle: TextStyle(color: Colors.transparent),
                todayTextStyle: TextStyle(color: Colors.transparent),
                selectedTextStyle: TextStyle(color: Colors.transparent),
              ),
            ),
            const Divider(),
            TableCalendar(
              startingDayOfWeek: StartingDayOfWeek.sunday,
              selectedDayPredicate: (day) => isSameDay(day, today),
              availableGestures: AvailableGestures.none,
              headerVisible: false,
              daysOfWeekVisible: false,
              focusedDay: today,
              firstDay: DateTime.now(),
              lastDay: DateTime.utc(2026),
              onDaySelected: _onDaySelected,
              calendarStyle: buildCalendarStyle(),
              calendarBuilders: buildCalendarBuilders(),
            ),
          ],
        ),
      ),
    );
  }

  CalendarBuilders<dynamic> buildCalendarBuilders() {
    return CalendarBuilders(
      dowBuilder: (context, day) {
        List<String> letters = ['S', 'M', 'T', 'W', 'T', 'F', 'S'];
        return Center(
          child: Text(
            letters[day.weekday % 7],
            style: AppStyles.bold16.copyWith(
              color: ColorsData.kMediumPrimaryColor,
            ),
          ),
        );
      },

      defaultBuilder: (context, day, focusedDay) {
        if (_isSameWeek(day, today) && !isSameDay(day, today)) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              '${day.day}',
              style: AppStyles.regular16.copyWith(
                color: ColorsData.kMediumPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        }

        return null;
      },

      todayBuilder: (context, day, _) {
        return Container(
          decoration: BoxDecoration(
            color: ColorsData.kBorderColor,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '${day.day}',
            style: AppStyles.medium16.copyWith(
              color: ColorsData.kMediumPrimaryColor,
            ),
          ),
        );
      },

      selectedBuilder: (context, day, focusedDay) {
        return Container(
          decoration: BoxDecoration(
            color: ColorsData.kMediumPrimaryColor,
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          child: Text(
            '${day.day}',
            style: AppStyles.medium16.copyWith(color: Colors.white),
          ),
        );
      },
    );
  }

  CalendarStyle buildCalendarStyle() {
    return CalendarStyle(
      outsideDaysVisible: false,
      selectedTextStyle: AppStyles.medium16.copyWith(color: Colors.white),
      disabledTextStyle: AppStyles.regular16.copyWith(
        color: ColorsData.kFontSecondaryColor,
      ),
      defaultTextStyle: AppStyles.regular16.copyWith(
        color: ColorsData.kFontSecondaryColor,
      ),
      todayTextStyle: AppStyles.medium16.copyWith(color: Colors.white),
    );
  }
}
