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
                    id: "hotspot-camera-view-demo",
                    src: 'assets/3d_models/sceneview.glb',
                    alt: "Animated 3D model of exercise",
                    ar: true,
                    autoRotate: true,
                    cameraControls: true,
                    disablePan: false,
                    autoPlay: true,
                    innerModelViewerHtml:
                        """ <button class="button-34" slot="hotspot-0" data-position="-0.0569m 0.0969m -0.1398m" data-normal="-0.5829775m 0.2863482m -0.7603565m" data-orbit="-50.94862deg 84.56856deg 0.06545582m" data-target="-0.04384604m 0.07348397m -0.1213202m">
    Neck
  </button>
  <button class="view-button" slot="hotspot-2" data-position="2m -4m -17m" data-normal="0.2040984m 0.7985359m -0.56629m" data-orbit="42.72974deg 84.74043deg 0.07104211m" data-target="2m -4m -17m">
    Hamstring
  </button>      
  <button class="view-button" slot="hotspot-4" data-position="-12m -5m -10m" data-normal="-0.008245394m 0.6207898m 0.7839338m" data-orbit="-118.8446deg 98.83521deg 0.06m" data-target="-12m -5m -10m">
    Back
  </button>     
  <script type="module">
  const modelViewer2 = document.querySelector("#hotspot-camera-view-demo");
  const annotationClicked = (annotation) => {
    let dataset = annotation.dataset;
    modelViewer2.cameraTarget = dataset.target;
    modelViewer2.cameraOrbit = dataset.orbit;
    modelViewer2.fieldOfView = '45deg';
  }

  modelViewer2.querySelectorAll('button').forEach((hotspot) => {
    hotspot.addEventListener('click', () => annotationClicked(hotspot));
  });
</script>
  
   """,
                    relatedCss: """  
<style type="text/css">
  .view-button {
      background: #00e5ff;
      border-radius: 4px;
      border: none;
      box-sizing: border-box;
      box-shadow: 0 2px 4px rgba(0, 0, 0, 0.25);
      color: rgba(0, 0, 0, 0.8);
      display: block;
      font-family: Futura, Helvetica Neue, sans-serif;
      font-size: 12px;
      font-weight: 700;
      max-width: 128px;
      overflow-wrap: break-word;
      padding: 0.5em 1em;
      position: absolute;
      width: max-content;
      height: max-content;
      transform: translate3d(-50%, -50%, 0);
    }
  .button {
  background-color: #00e5ff;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 12px;
  font-weight: 700;
  max-width: 128px;
  overflow-wrap: break-word;
  padding: 0.5em 1em;
  position: absolute;
  width: max-content;
  height: max-content;
}

.button-34 {
  background: #00e5ff;
  border-radius: 400px;
  box-shadow: #5E5DF0 0 10px 20px -10px;
  box-sizing: border-box;
  color: #FFFFFF;
  cursor: pointer;
  font-family: Inter,Helvetica,"Apple Color Emoji","Segoe UI Emoji",NotoColorEmoji,"Noto Color Emoji","Segoe UI Symbol","Android Emoji",EmojiSymbols,-apple-system,system-ui,"Segoe UI",Roboto,"Helvetica Neue","Noto Sans",sans-serif;
  font-size: 16px;
  font-weight: 700;
  line-height: 24px;
  opacity: 1;
  outline: 0 solid transparent;
  padding: 8px 18px;
  user-select: none;
  -webkit-user-select: none;
  touch-action: manipulation;
  width: fit-content;
  word-break: break-word;
  border: 0;
}
</style>""",
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
