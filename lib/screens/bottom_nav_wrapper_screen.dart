import 'package:flutter/material.dart';

import './home_screen.dart';
import './login_screen.dart';
// import './account_screen.dart';
import './wip_screen.dart';
import '../widgets/custom_card.dart';

class BottomNavWrapperScreen extends StatefulWidget {
  const BottomNavWrapperScreen({super.key});
  @override
  State<BottomNavWrapperScreen> createState() => _BottomNavWrapperScreenState();
}

class _BottomNavWrapperScreenState extends State<BottomNavWrapperScreen> {
  final List<Map<String, Object>> _screenData = const [
    {"page": HomeScreen()},
    {"page": WipScreen(screenName: 'Explore')},
    {"page": WipScreen(screenName: 'Search')},
    {"page": LoginScreen()},
  ];

  int _selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screenData[_selectedScreenIndex]['page'] as Widget,
      bottomNavigationBar: CustomCard(
        margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        padding: const EdgeInsets.all(6),
        child: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Account',
            ),
          ],
          currentIndex: _selectedScreenIndex,
          onTap: (int newIndex) => {
            setState(() {
              _selectedScreenIndex = newIndex;
            }),
          },
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
