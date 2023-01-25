import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'screens/home_screen.dart';
import 'providers/disorder_list_provider.dart';
import 'providers/exercise_list_provider.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<DisorderList>(create: (context) => DisorderList()),
          // ChangeNotifierProvider(create: create)
        ],
        child: const ARTherapy(),
      ),
    );

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
        textTheme: const TextTheme(
          headline1: TextStyle(
            // fontFamily: 'Montserrat',
            fontSize: 36.0,
            fontWeight: FontWeight.bold,
            color: Color(0xff00e5ff),
          ),
          headline2: TextStyle(
            fontSize: 36.0,
            color: Colors.white,
          ),
          bodyText1: TextStyle(fontSize: 22.0),
          bodyText2: TextStyle(fontSize: 26.0),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(22.0),
          ),

          // ButtonStyle(backgroundColor: const LinearGradient(
          //               begin: Alignment.topLeft,
          //               end: Alignment.bottomRight,
          //               colors: [
          //                 Colors.blue,
          //                 Color(0xff00e5ff),
          //               ],
          //             ),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
