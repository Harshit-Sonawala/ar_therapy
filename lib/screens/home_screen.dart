import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/disorder_list_provider.dart';
//import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/custom_elevated_button.dart';

// import 'demo_screen_3d.dart';
import 'login_screen.dart';
import 'model_viewer_screen.dart';
import 'disorders_screen.dart';
// import './wip_screen.dart';
// import 'demo_screen_ar.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // Text(
                            //   'Good Morning,',
                            //   style: TextStyle(
                            //     fontFamily: 'Montserrat',
                            //     fontSize: 28,
                            //   ),
                            // ),
                            Text(
                              'AR Therapy',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                          ],
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
                const SizedBox(height: 20.0),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xff3d3d3d),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome to\nAR Therapy!',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Where physiotherapy meets AR Technology',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color(0xff3d3d3d),
                    borderRadius: BorderRadius.circular(10),
                  ),
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
                  title: 'View 3D & AR Demo',
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
                  trailingIcon: Icons.arrow_forward,
                  trailingIconSize: 34,
                  title: 'Browse Disorders',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
