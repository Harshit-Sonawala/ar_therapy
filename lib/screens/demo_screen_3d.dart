import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

import '../widgets/custom_text_button.dart';

class DemoScreen3D extends StatelessWidget {
  const DemoScreen3D({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomTextButton(
                  onPressed: () => {
                    Navigator.pop(context),
                  },
                  padding: const EdgeInsets.all(5),
                  icon: Icons.arrow_back,
                  borderRadius: 50,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '3D Demo',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    'Swipe around to see the full view...',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Cube(
                onSceneCreated: (Scene scene) {
                  scene.world.add(
                    Object(
                      fileName: 'assets/3D models/male_low_poly.obj',
                      // fileName: 'assets/3D models/snow_v04.obj',
                    ),
                  );
                  scene.camera.zoom = 10;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
