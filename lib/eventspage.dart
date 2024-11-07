import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  _EventsPageState createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  late Map<DateTime, List<String>> _events;
  late List<String> _selectedEvents;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _events = {};
    _selectedEvents = [];
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
      _selectedEvents = _getEventsForDay(selectedDay);
    });
  }

  bool isSameMonth(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month;
  }

  Color _getTextColor(DateTime day) {
    return isSameMonth(day, _focusedDay) ? Colors.white : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 7, 112, 198),
      ),
      backgroundColor: const Color.fromARGB(31, 66, 63, 63),
      body: Column(
        children: [
          TableCalendar<String>(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: _onDaySelected,
            eventLoader: _getEventsForDay,
            calendarStyle: const CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              outsideDaysVisible: false,
              defaultTextStyle: TextStyle(
                  color: Colors.transparent), // Hide default text color
            ),
            daysOfWeekStyle: const DaysOfWeekStyle(
              weekdayStyle:
                  TextStyle(color: Colors.white), // Weekday text color
              weekendStyle:
                  TextStyle(color: Colors.white), // Weekend text color
            ),
            headerStyle: const HeaderStyle(
              titleTextStyle:
                  TextStyle(color: Colors.grey), // Change month name color
              leftChevronIcon: Icon(Icons.chevron_left,
                  color: Colors.grey), // Left arrow color
              rightChevronIcon: Icon(Icons.chevron_right,
                  color: Colors.grey), // Right arrow color
            ),
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                return Center(
                  child: Text(
                    '${day.day}',
                    style: TextStyle(
                        color: _getTextColor(day)), // Set color based on month
                  ),
                );
              },
              selectedBuilder: (context, day, focusedDay) {
                return Center(
                  child: Text(
                    '${day.day}',
                    style: const TextStyle(
                        color: Colors.white), // Selected day color
                  ),
                );
              },
              todayBuilder: (context, day, focusedDay) {
                return Center(
                  child: Text(
                    '${day.day}',
                    style: const TextStyle(
                        color: Colors.white), // Today's date color
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView.builder(
              itemCount: _selectedEvents.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(_selectedEvents[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
