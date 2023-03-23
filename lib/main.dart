import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:provider/provider.dart';
import 'providers/disorder_list_provider.dart';
import 'providers/exercise_list_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/cloudstore_provider.dart';

import 'screens/bottom_nav_wrapper_screen.dart';

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    cameras = await availableCameras();
  } on CameraException catch (e) {
    debugPrint('Error: $e.code\nError Message: $e.message');
  }

  await Firebase.initializeApp();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<DisorderListProvider>(create: (context) => DisorderListProvider()),
        ChangeNotifierProvider<ExerciseListProvider>(create: (context) => ExerciseListProvider()),
        ChangeNotifierProvider<AuthProvider>(create: (context) => AuthProvider()),
        ChangeNotifierProvider<CloudstoreProvider>(create: (context) => CloudstoreProvider()),
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
          displayLarge: TextStyle(
            // fontFamily: 'Montserrat',
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
            color: Color(0xff00e5ff),
          ),
          displayMedium: TextStyle(
            fontSize: 28.0,
            color: Colors.white,
          ),
          displaySmall: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xff00e5ff),
          ),
          bodyLarge: TextStyle(fontSize: 18.0), // old: 22
          bodyMedium: TextStyle(fontSize: 20.0), // old: 26
          bodySmall: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Color(0xff1D1D1D),
          ),
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
      home: BottomNavWrapperScreen(cameras!),
    );
  }
}
