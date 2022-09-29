import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';

class DemoScreen3D extends StatelessWidget {
  const DemoScreen3D({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Cube(
        onSceneCreated: (Scene scene) {
          scene.world.add(
            Object(
              fileName: 'assets/3D models/male_low_poly.obj',
            ),
          );
          scene.camera.zoom = 10;
        },
      ),
    );
  }
}
