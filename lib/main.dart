import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() => runApp(const ARTherapy());

class ARTherapy extends StatelessWidget {
  const ARTherapy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AR Therapy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        // primaryColor: Colors.cyan[300],
        primaryColor: const Color(0xff00e5ff),
        fontFamily: 'ProductSans',
        // textTheme: const TextTheme(
        //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        // ),
      ),
      home: const HomeScreen(),
    );
  }
}
