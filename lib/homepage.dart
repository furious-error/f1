import 'package:f1_stats/pages/constructor_standings_page.dart';
import 'package:f1_stats/pages/driver_standings_page.dart';
// import 'package:f1_stats/pages/profile_page.dart';
import 'package:f1_stats/pages/race_schedule_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    const RaceSchedulePage(),
    const ConstructorStandingsPage(),
    const DriverStandingsPage(),
    // const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month_outlined,
              color: Colors.grey[700],
              size: 26,
            ),
            activeIcon: const Icon(
              Icons.calendar_month_sharp,
              color: Color.fromRGBO(225, 6, 0, 1),
              size: 30,
            ),
            label: 'Home',
            backgroundColor:const Color(0xFFFF1801),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pie_chart_outline_rounded,
              color: Colors.grey[700],
              size: 26,
            ),
            activeIcon: const Icon(
              Icons.pie_chart_rounded,
              color: Color.fromRGBO(225, 6, 0, 1),
              size: 30,
            ),
            label: 'Constructor',
            backgroundColor: const Color(0xFFFF1801),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.assessment_outlined,
              color: Colors.grey[700],
              size: 26,
            ),
            activeIcon: const Icon(
              Icons.bar_chart_outlined,
              color: Color.fromRGBO(225, 6, 0, 1),
              size: 30,
            ),
            label: 'Insights',
            backgroundColor: const Color(0xFFFF1801),
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(
          //     Icons.account_circle_outlined,
          //     color: Colors.black,
          //     size: 26,
          //   ),
          //   activeIcon: Icon(
          //     Icons.account_circle_rounded,
          //     color: Colors.black,
          //     size: 30,
          //   ),
          //   label: 'Profile',
          //   backgroundColor: Colors.white,
          // ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}