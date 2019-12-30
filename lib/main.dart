// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:flutter/material.dart';
import 'package:lifft/theme.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'LIFFT';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Schedule',
      style: optionStyle,
    ),
    Text(
      'Index 1: Food',
      style: optionStyle,
    ),
    Text(
      'Index 3: Workout',
      style: optionStyle,
    ),
    Text(
      'Index 4: Account',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // const BottomNavigationBarType(1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('LIFFT'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      backgroundColor: const Color(0xff24324b),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff3edfc2),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today, color: colos),
            title: Text('Schedule', style: TextStyle(color: colos)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fastfood, color: colos),
            title: Text('Food', style: TextStyle(color: colos)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility_new, color: colos),
            title: Text('workout', style: TextStyle(color: colos)),

            // backgroundcolor: colos,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: colos),
            title: Text('Account', style: TextStyle(color: colos)),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff384962),
        onTap: _onItemTapped,
      ),
    );
  }
}
