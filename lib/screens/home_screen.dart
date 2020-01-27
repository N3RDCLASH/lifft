import 'package:flutter/material.dart';
import './meals_screen.dart';
import './schedule/schedule_screen.dart';
import './account_screen.dart';
import '../style/theme.dart';
import 'workout/workout_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Schedule(),
    Meals(),
    Workout(),
    Account(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      backgroundColor: const Color(0xff24324b),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff3edfc2),
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: black_color),
            title: Text('Schedule', style: TextStyle(color: black_color)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood, color: black_color),
            title: Text('Meals', style: TextStyle(color: black_color)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center, color: black_color),
            title: Text('workout', style: TextStyle(color: black_color)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: black_color),
            title: Text('Account', style: TextStyle(color: black_color)),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
