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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                children: [
                  CustomTextButton(
                    onPressed: () => {
                      Navigator.pop(context),
                    },
                    padding: const EdgeInsets.all(5),
                    icon: Icons.arrow_back,
                    // title: 'Forward Flexion',
                    borderRadius: 50,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Forward Flexion',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              // const Text('Model Viewer Screen'),
              Expanded(
                child: ModelViewer(
                  // src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
                  //src: 'assets/3Dmodels/final.glb', // Human with given skeleton
                  // src: 'assets/3D models/back_exercise.glb',
                  src: 'assets/forward_flexion.glb',
                  alt: "Animated 3D model of exercise",
                  ar: true,
                  autoRotate: true,
                  cameraControls: true,
                  enablePan: true,
                  autoPlay: true,
                ),
              ),
            ],
          ),
        ),
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
