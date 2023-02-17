import 'package:flutter/material.dart';
import '../screens/wip_screen.dart';
import '../screens/user_account_screen.dart';
// import '../screens/test_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(
            height: 200,
            child: DrawerHeader(
              decoration: const BoxDecoration(
                // color: Theme.of(context).primaryColor,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff00e5ff),
                    Colors.blue,
                  ],
                ),
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AR Therapy',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Version 0.3.8',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            onTap: () => {},
            leading: const Icon(Icons.home, size: 24),
            title: Text(
              'Home',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          ListTile(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const UserAccountScreen(),
                ),
              ),
            },
            leading: const Icon(Icons.accessibility, size: 24.0),
            title: Text(
              'My Exercises',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          ListTile(
            onTap: () => {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const TestScreen(),
              //   ),
              // ),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WipScreen(
                    screenName: 'Settings Screen',
                  ),
                ),
              ),
            },
            leading: const Icon(Icons.settings, size: 24.0),
            title: Text(
              'Settings',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          ListTile(
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const WipScreen(
                    screenName: 'About Screen',
                  ),
                ),
              ),
            },
            leading: const Icon(Icons.info_outlined, size: 24.0),
            title: Text(
              'About',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
