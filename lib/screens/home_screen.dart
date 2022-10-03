import 'package:flutter/material.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/custom_elevated_button.dart';
import 'demo_screen_3d.dart';
import 'login_screen.dart';
import './wip_screen.dart';
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
                    'Solve all of your physio problems using state of the art AR Technology',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                const SizedBox(height: 20.0),
                // Ink(
                //   decoration: BoxDecoration(
                //     // color: const Color(0xff3d3d3d),
                //     borderRadius: BorderRadius.circular(10),
                //     gradient: const LinearGradient(
                //       begin: Alignment.topLeft,
                //       end: Alignment.bottomRight,
                //       colors: [
                //         Colors.blue,
                //         Color(0xff00e5ff),
                //       ],
                //     ),
                //   ),
                //   child: InkWell(
                //     customBorder: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.all(20.0),
                //       child: Row(
                //         children: [
                //           const Icon(
                //             Icons.threed_rotation,
                //             size: 36,
                //           ),
                //           const SizedBox(width: 20.0),
                //           Text(
                //             'View 3D Demo',
                //             style: Theme.of(context).textTheme.bodyText2,
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                CustomElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DemoScreen3D(
                            // parameters to pass, example
                            // passedNotice: NoticeModel(
                            //   noticeId: 1,
                            //   noticeTitle: 'Notice Title',
                            //   noticeDate: DateTime.now(),
                            //   noticePosterName: 'John Doe',
                            //   noticePosterEmail: 'johndoe@mail.com',
                            // ),
                            ),
                      ),
                    )
                  },
                  icon: Icons.threed_rotation_rounded,
                  iconSize: 34,
                  title: 'View 3D Demo',
                ),
                const SizedBox(height: 20.0),
                CustomElevatedButton(
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WipScreen(
                          screenName: 'AR Demo Screen',
                        ),
                      ),
                    )
                  },
                  icon: Icons.view_in_ar,
                  iconSize: 34,
                  title: 'View AR Demo',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
