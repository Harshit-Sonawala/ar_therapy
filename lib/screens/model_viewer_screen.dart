import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../widgets/custom_text_button.dart';
import '../widgets/custom_card.dart';

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
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextButton(
                    onPressed: () => {
                      Navigator.pop(context),
                    },
                    padding: const EdgeInsets.all(6.0),
                    icon: Icons.arrow_back,
                    // title: 'Forward Flexion',
                    borderRadius: 50,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'Chin to Chest',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              // const Text('Model Viewer Screen'),
              Expanded(
                child: CustomCard(
                  child: ModelViewer(
                    // src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
                    //src: 'assets/3Dmodels/final.glb', // Human with given skeleton
                    // src: 'assets/3D models/back_exercise.glb',
                    src: 'assets/chin_chest.glb',
                    alt: "Animated 3D model of exercise",
                    ar: true,
                    autoRotate: true,
                    cameraControls: true,
                    disablePan: false,
                    autoPlay: true,
                    innerModelViewerHtml: """
                  <button class="hotspot" slot="hotspot-hand" data-position="0 1.93 -0.5" data-normal="-5.73 0.05 0.69">
                    <div class="annotation">Back Area is affected</div>
                  </button>
                    """,
                    relatedCss: """
                      .hotspot{
                    display: block;
                    width: 20px;
                    height: 20px;
                    border-radius: 10px;
                    border: none;
                    background-color: blue;
                    box-sizing: border-box;
                    pointer-events: none;
                  }
                
                  .hotspot[slot="hotspot-hand"]{
                    --min-hotspot-opacity: 0;
                    background-color: red;
                  }
                
                  .hotspot[slot="hotspot-foot"]:not([data-visible]) {
                    background-color: transparent;
                    border: 3px solid blue;
                  }
                
                  .annotation{
                    background-color: #fff;
                    position: absolute;
                    transform: translate(10px, 10px);
                    border-radius: 10px;
                    padding: 10px;
                  }
                  /* This keeps child nodes hidden while the element loads */
                  :not(:defined) > * {
                    display: none;
                  }
                    """,
                  ),
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
