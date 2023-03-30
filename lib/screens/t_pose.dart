import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Stack(
      children: [
        Transform(
          transform: Matrix4.translationValues(0.0, 0.0, 4.0),
          child: ModelViewer(
            src: 'assets/3d_models/tpose.glb',
            autoRotate: false,
            cameraControls: true,
            disableZoom: true,
            disablePan: false,
          ),
        ),
        Positioned(
          top: 130,
          left: 10,
          child: Container(
            height: 44.0,
            decoration: const BoxDecoration(
                gradient:
                    LinearGradient(colors: [Color.fromARGB(255, 70, 70, 70), Color.fromARGB(255, 255, 255, 255)])),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent),
              child: const Text('Arms'),
            ),
          ),
        ),
        Positioned(
          top: 130,
          right: 10,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
            child: const Text("Back"),
          ),
        ),
        Positioned(
          bottom: 130,
          right: 10,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
            child: const Text("Knees"),
          ),
        ),
        Positioned(
          bottom: 130,
          left: 10,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.grey,
            ),
            child: const Text("Hamstring"),
          ),
        ),
      ],
    ));
  }
}
