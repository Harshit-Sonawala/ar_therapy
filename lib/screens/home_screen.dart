import 'package:ar_therapy/ai/pushed_pageS.dart';
import 'package:ar_therapy/screens/model_viewer_screen.dart';
import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import 'package:provider/provider.dart';
import '../main.dart';
import '../providers/auth_provider.dart';

import '../widgets/custom_drawer.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_text_button.dart';
import 'account_screen.dart';
import 't-pose.dart';
// import 'model_viewer_screen.dart';
// import 'disorders_screen.dart';
// import 'exercises_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(cameras, {Key? key}) : super(key: key);

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
                            builder: (context) => const AccountScreen(),
                          ),
                        ),
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
                const SizedBox(height: 20),
                SizedBox(
                  height: 400,
                  child: CustomCard(
                    child: Stack(
                      children: [
                        ModelViewer(
                          src: 'assets/3d_models/tpose.glb',
                          autoRotate: false,
                          cameraControls: true,
                          disableZoom: true,
                          disablePan: true,
                          ar: false,
                        ),
                        Positioned(
                          top: 0,
                          left: 0,
                          child: CustomTextButton(
                            onPressed: () => {},
                            childPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                            title: 'Neck',
                          ),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: CustomTextButton(
                            onPressed: () => {},
                            childPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                            title: 'Shoulder',
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: CustomTextButton(
                            onPressed: () => {},
                            childPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                            title: 'Back',
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: CustomTextButton(
                            onPressed: () => {},
                            childPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 4),
                            title: 'Hamstring',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
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
                CustomElevatedButton(
                  onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PushedPageS(
                          cameras: cameras!,
                          title: 'posenet',
                        ),
                      ),
                    )
                  },
                  icon: Icons.auto_awesome,
                  title: 'Try AI Mapping',
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
