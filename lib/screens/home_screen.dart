import 'package:flutter/material.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_card.dart';
import 'package:camera/camera.dart';
import '../ai/pushed_pageS.dart';

import 'login_screen.dart';
import 'model_viewer_screen.dart';
import 'disorders_screen.dart';
import 'exercises_screen.dart';
List<CameraDescription>? cameras;

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GlobalKey<ScaffoldState> homeScreenScaffoldKey = GlobalKey<ScaffoldState>(); // for opening the drawer
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeScreenScaffoldKey, // for opening the drawer
      drawer: const CustomDrawer(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {
      //     print(
      //       Provider.of<DisorderList>(context, listen: false),
      //       // context.watch<DisorderList>().globalDisorderList[0],
      //     ),
      //   },
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () => {
                            homeScreenScaffoldKey.currentState?.openDrawer(),
                          },
                          icon: const Icon(
                            Icons.menu,
                            size: 34,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'AR Therapy',
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(
                                // parameters to pass, example
                                // passedNotice: NoticeModel(
                                //   noticeId: 1,
                                //   noticeTitle: 'Notice Title',
                                // ),
                                ),
                          ),
                        )
                      },
                      icon: Icon(
                        Icons.account_circle,
                        color: Theme.of(context).primaryColor,
                        size: 34,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
                child: Column(
                  children: [
                    CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome to\nAR Therapy!',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            'The perfect personal companion app to support your physical therapy',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomCard(
                      child: Text(
                        'Solve all of your physiotherapy related problems using state of the art Augmented Reality Technology',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    // CustomElevatedButton(
                    //   onPressed: () => {
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //         builder: (context) => const DemoScreen3D(
                    //             // parameters to pass, example
                    //             // passedNotice: NoticeModel(
                    //             //   noticeId: 1,
                    //             //   noticeTitle: 'Notice Title',
                    //             //   noticeDate: DateTime.now(),
                    //             //   noticePosterName: 'John Doe',
                    //             //   noticePosterEmail: 'johndoe@mail.com',
                    //             // ),
                    //             ),
                    //       ),
                    //     )
                    //   },
                    //   icon: Icons.threed_rotation_rounded,
                    //   iconSize: 34,
                    //   title: 'View 3D Demo',
                    // ),
                    // const SizedBox(height: 20.0),
                    CustomElevatedButton(
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ModelViewerScreen(),
                          ),
                        )
                      },
                      icon: Icons.view_in_ar,
                      iconSize: 34,
                      title: 'Try 3D & AR Demo',
                    ),
                    const SizedBox(height: 20.0),
                    CustomElevatedButton(
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const DisordersScreen(),
                          ),
                        )
                      },
                      backgroundImage: 'assets/images/disorders.jpeg',
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                        child: Text('Browse Disorders'),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    CustomElevatedButton(
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const ExercisesScreen(),
                          ),
                        )
                      },
                      backgroundImage: 'assets/images/exercises.jpeg',
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                        child: Text('Browse Exercises'),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    CustomElevatedButton(
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => onSelectS(context: context, modelName: 'posenet'),
                          ),
                        )
                      },
                      backgroundImage: 'assets/images/aidetect.jpeg',
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
                        child: Text('Check Posture'),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    CustomElevatedButton(
                      onPressed: () => {},
                      trailingIcon: Icons.arrow_forward,
                      trailingIconSize: 34,
                      title: 'Continue Treatment',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
}

 onSelectS({required BuildContext context,required String modelName}) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => PushedPageS(
        cameras: cameras!,
        title: modelName,
      ),
    ),
  );
}