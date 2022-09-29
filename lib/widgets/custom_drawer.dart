import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(
            height: 200,
            child: DrawerHeader(
              decoration: BoxDecoration(
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
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'AR Therapy',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 38,
                    ),
                  ),
                ),
              ),
            ),
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'Home',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'My Exercises',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            onTap: () => {},
          ),
          ListTile(
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: const Text(
                'About',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
