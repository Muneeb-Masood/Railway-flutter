import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DateRangePickerSheet extends StatefulWidget {
  static DateTime initialStart = DateTime.now();
  static DateTime initialEnd = DateTime.now();

  const DateRangePickerSheet({super.key,});

  @override
  State<DateRangePickerSheet> createState() => _DateRangePickerSheetState();
}

class _DateRangePickerSheetState extends State<DateRangePickerSheet> {
  static DateTime? startDate;
  static DateTime? endDate;
  // onUpadte

  @override
  void initState() {
    super.initState();
    startDate = DateRangePickerSheet.initialStart;
    endDate = DateRangePickerSheet.initialEnd;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      if (startDate == null || (startDate != null && endDate != null)) {
        startDate = selectedDay;
        endDate = null;
      } else if (startDate != null && endDate == null) {
        if (selectedDay.isBefore(startDate!)) {
          endDate = startDate;
          startDate = selectedDay;
        } else {
          endDate = selectedDay;
        }
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Custom AppBar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
                const Expanded(
                  child: Text(
                    "Pick a Date",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                const SizedBox(width: 48), // To balance the back button
              ],
            ),
          ),
          // Calendar
          TableCalendar(
            firstDay: DateTime.utc(2019, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: startDate ?? DateTime.now(),
            selectedDayPredicate: (day) =>
                (startDate != null && isSameDay(day, startDate!)) ||
                (endDate != null && isSameDay(day, endDate!)),
            rangeStartDay: startDate,
            rangeEndDay: endDate,
            onDaySelected: _onDaySelected,
            rangeSelectionMode: RangeSelectionMode.toggledOn,
            calendarFormat: CalendarFormat.month,
            headerVisible: false,
            startingDayOfWeek: StartingDayOfWeek.monday,
            calendarStyle: CalendarStyle(
              rangeHighlightColor: Colors.blue[100]!,
              rangeStartDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              rangeEndDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
            ),
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekendStyle: TextStyle(color: Colors.black54),
              weekdayStyle: TextStyle(color: Colors.black54),
            ),
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1A73E8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: (startDate != null && endDate != null)
                    ? () {
                        Navigator.pop(context, {
                          'start': startDate,
                          'end': endDate,
                        });
                      }
                    : null,
                child: const Text("Done", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}