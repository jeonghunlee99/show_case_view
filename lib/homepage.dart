import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:table_calendar/table_calendar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey add = GlobalKey();
  final GlobalKey search = GlobalKey();
  final GlobalKey logout = GlobalKey();
  final GlobalKey calendar = GlobalKey();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      ShowCaseWidget.of(context).startShowCase([search, logout, add, calendar]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("감성 버튼 일기장", style: TextStyle(color: Colors.white)),
        centerTitle: false,
        backgroundColor: Colors.brown[400],
        actions: [
          IconButton(
            onPressed: () {},
            icon: Showcase(
              key: search,
              description: 'ex)원하시는 일기를 찾으시려면 검색해주세요',
              overlayOpacity: 0.5,
              targetShapeBorder: const CircleBorder(),
              targetPadding: const EdgeInsets.all(8),
              child: const Icon(Icons.search, color: Colors.white),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Showcase(
              key: logout,
              description: 'ex) 로그아웃 하려면 눌러주세요',
              overlayOpacity: 0.5,
              targetShapeBorder: const CircleBorder(),
              targetPadding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Showcase(
            key: calendar,
            description: 'ex) 캘린더를 사용하여 일기 날짜를 선택해보세요',
            overlayOpacity: 0.5,
            targetShapeBorder: const CircleBorder(),
            targetPadding: const EdgeInsets.all(8),
            child: TableCalendar(
              key: calendar,
              calendarFormat: _calendarFormat,
              focusedDay: _focusedDay,
              firstDay: DateTime(2000),
              lastDay: DateTime(2050),
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
              ),
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                });
              },
            ),
          ),
          SizedBox(height: 140),
          Showcase(
            key: add,
            description: 'ex) 일기장을 추가해주세요',
            overlayOpacity: 0.5,
            targetShapeBorder: const CircleBorder(),
            child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.emoji_emotions_rounded,
                color: Colors.white,
                size: 50,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}
