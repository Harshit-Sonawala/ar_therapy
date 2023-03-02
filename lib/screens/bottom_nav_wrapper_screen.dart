import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

import './home_screen.dart';
import './explore_screen.dart';
import './search_screen.dart';
// import './user_account_screen.dart';
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
    {"page": ExploreScreen()},
    {"page": SearchScreen()},
    {"page": WipScreen(screenName: 'My Exercises')},
  ];

  int _selectedScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true, // needed for transparent background of the bottomNavigationBar
      body: _screenData[_selectedScreenIndex]['page'] as Widget,
      bottomNavigationBar: CustomCard(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.symmetric(vertical: 4.0),
        child: BottomNavigationBar(
          items: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.explore),
              label: 'Explore',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            // if (context.watch<AuthProvider>().currentUser != null)
            if (Provider.of<AuthProvider>(context).currentUser != null)
              const BottomNavigationBarItem(
                icon: Icon(Icons.accessibility_new),
                label: 'My Exercises',
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
