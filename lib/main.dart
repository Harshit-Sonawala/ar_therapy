import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:provider/provider.dart';
import 'providers/disorder_list_provider.dart';
import 'providers/exercise_list_provider.dart';

import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DisorderList>(create: (context) => DisorderList()),
        ChangeNotifierProvider<ExerciseList>(create: (context) => ExerciseList()),
      ],
      child: const ARTherapy(),
    ),
  );
}

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
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Color(0xff00e5ff),
          ),
          headline2: TextStyle(
            fontSize: 28.0,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xff00e5ff),
          ),
          bodyText1: TextStyle(fontSize: 18.0), // old: 22
          bodyText2: TextStyle(fontSize: 20.0), // old: 26
        ),
        iconTheme: const IconThemeData(
          size: 28,
          color: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(22.0),
          ),
        ),
      ),
      // builder: (context, child) {
      //   return MediaQuery(
      //       data: MediaQuery.of(context).copyWith(
      //         textScaleFactor: 1.0,
      //       ),
      //       child: const HomeScreen());
      // }
      home: const HomeScreen(),
    );
  }
}
