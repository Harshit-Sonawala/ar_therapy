import 'package:flutter/material.dart';

import './home_screen.dart';
import './account_screen.dart';
import './wip_screen.dart';

class BottomNavWrapperScreen extends StatefulWidget {
  const BottomNavWrapperScreen({super.key});
  @override
  State<BottomNavWrapperScreen> createState() => _BottomNavWrapperScreenState();
}

class _BottomNavWrapperScreenState extends State<BottomNavWrapperScreen> {
  final List<Map<String, Object>> _screenData = const [
    {"page": HomeScreen()},
    {"page": WipScreen(screenName: 'Browse')},
    {"page": WipScreen(screenName: 'Explore')},
    {"page": AccountScreen()},
  ];

  int _selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenData[_selectedScreenIndex]['page'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedScreenIndex,
        onTap: (int newIndex) => {
          setState(() {
            _selectedScreenIndex = newIndex;
          }),
        },
        backgroundColor: const Color(0xff2d2d2d),
        showUnselectedLabels: true,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Browse'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
        ],
      ),
    );
  }
}
