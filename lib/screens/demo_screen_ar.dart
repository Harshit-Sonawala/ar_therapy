// import 'package:flutter/material.dart';
// import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
// import 'package:vector_math/vector_math_64.dart' as vector;

// class DemoScreenAR extends StatefulWidget {
//   const DemoScreenAR({Key? key}) : super(key: key);

//   @override
//   State<DemoScreenAR> createState() => _DemoScreenARState();
// }

// class _DemoScreenARState extends State<DemoScreenAR> {
//   ArCoreController arCoreController;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ArCoreView(
//         onArCoreViewCreated: _onArCoreViewCreated,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     arCoreController?.dispose();
//     super.dispose();
//   }

//   void _onArCoreViewCreated(ArCoreController controller) {
//     arCoreController = controller;
//     final material = ArCoreMaterial(
//       color: const Color(0xff00e5ff),
//       metallic: 1.0,
//     );
//     final cube = ArCoreCube(
//       materials: [material],
//       size: vector.Vector3(0.5, 0.5, 0.5),
//     );
//     final node = ArCoreNode(
//       shape: cube,
//       position: vector.Vector3(-0.5, 0.5, -3.5),
//     );
//     controller.addArCoreNode(node);
//   }
// }
