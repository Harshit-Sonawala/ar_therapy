import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_card.dart';

import 'account_screen.dart';
import 'model_viewer_screen.dart';
import 'disorders_screen.dart';
import 'exercises_screen.dart';

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
      //       Provider.of<DisorderList>(context, listen: false).globalDisorderList[0],
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
                        Text(
                          'AR Therapy',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const AccountScreen(
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
                const SizedBox(height: 20),
                CustomCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        Provider.of<AuthProvider>(context).currentUser != null
                            ? 'Welcome to AR Therapy,\n${Provider.of<AuthProvider>(context).currentUser!.displayName}!'
                            : 'Welcome to AR Therapy!',
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'The perfect personal companion app to support your physical therapy',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                CustomCard(
                  child: Text(
                    'Solve all of your physiotherapy related problems using state of the art Augmented Reality Technology',
                    style: Theme.of(context).textTheme.bodyLarge,
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
                //   iconSize: 28,
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
                  title: 'Try 3D & AR Demo',
                ),
                const SizedBox(height: 20.0),
                Provider.of<AuthProvider>(context).currentUser != null
                    ? CustomElevatedButton(
                        onPressed: () => {},
                        trailingIcon: Icons.arrow_forward,
                        title: 'Continue Treatment',
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
