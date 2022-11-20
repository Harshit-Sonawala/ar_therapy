import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

// class TestScreen extends StatefulWidget {
//   const TestScreen({Key? key}) : super(key: key);

//   @override
//   State<TestScreen> createState() => _TestScreenState();
// }

// class _TestScreenState extends State<TestScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //body: Text("Testing"),
//       body: ModelViewer(
//         //src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
//         //src: 'assets/3Dmodels/final.glb', // Human with given skeleton
//         // src: 'assets/3D models/back_exercise.glb',
//         // alt: "Exercise 3D Model",
//         // ar: false,
//         // autoRotate: true,
//         // cameraControls: true,
//       ),
//     );
//   }
// }

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AR Therapy")),
      body: ModelViewer(
        // src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
        // src: 'assets/final.glb', // Human with given skeleton
        src: 'assets/final.glb',
        alt: "Exercise 3D Model",
        ar: true,
        autoRotate: true,
        cameraControls: true,
      ),
    );
  }
}
