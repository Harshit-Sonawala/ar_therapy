import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../widgets/custom_text_button.dart';

class ModelViewerScreen extends StatefulWidget {
  const ModelViewerScreen({Key? key}) : super(key: key);

  @override
  State<ModelViewerScreen> createState() => _ModelViewerScreenState();
}

class _ModelViewerScreenState extends State<ModelViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          CustomTextButton(
            onPressed: () => {
              Navigator.pop(context),
            },
            padding: const EdgeInsets.all(5),
            icon: Icons.arrow_back,
            title: 'Exercise Demo',
            borderRadius: 50,
          ),
        ],
      ),
      // body: ModelViewer(
      //   src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
      //   //src: 'assets/3Dmodels/final.glb', // Human with given skeleton
      //   // src: 'assets/3D models/back_exercise.glb',
      //   alt: "Exercise 3D Model",
      //   ar: false,
      //   autoRotate: true,
      //   cameraControls: true,
      // ),
    );
  }
}
