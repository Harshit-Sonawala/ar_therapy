import 'package:flutter/material.dart';

import 'package:model_viewer_plus/model_viewer_plus.dart';

import 'package:provider/provider.dart';

import '../providers/exercise_list_provider.dart';

import '../widgets/custom_text_button.dart';
import '../widgets/custom_card.dart';

class ExerciseDetailsScreen extends StatefulWidget {
  final int exerciseIndex;

  const ExerciseDetailsScreen({
    Key? key,
    required this.exerciseIndex,
  }) : super(key: key);

  @override
  State<ExerciseDetailsScreen> createState() => _ExerciseDetailsScreenState();
}

class _ExerciseDetailsScreenState extends State<ExerciseDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                  const SizedBox(width: 10),
                  const Text('Exercise Details'),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                Provider.of<ExerciseListProvider>(context, listen: false)
                    .globalExerciseList[widget.exerciseIndex]
                    .exItemTitle,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 20),
              CustomCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Text(
                        Provider.of<ExerciseListProvider>(context, listen: false)
                            .globalExerciseList[widget.exerciseIndex]
                            .exItemDescription,
                        style: Theme.of(context).textTheme.bodyLarge),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ModelViewer(
                  // src: 'https://modelviewer.dev/shared-assets/models/Astronaut.glb',
                  //src: 'assets/3Dmodels/final.glb', // Human with given skeleton
                  // src: 'assets/3D models/back_exercise.glb',
                  src: Provider.of<ExerciseListProvider>(context, listen: false)
                      .globalExerciseList[widget.exerciseIndex]
                      .exItemModelPath,
                  alt: "Animated 3D model of exercise",
                  ar: true,
                  autoRotate: true,
                  cameraControls: true,
                  enablePan: true,
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
              // CustomCard(
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       Text(
              //         'Procedure',
              //         style: TextStyle(
              //           color: Theme.of(context).primaryColor,
              //         ),
              //       ),
              //       for (var eachSymptom in Provider.of<ExerciseList>(context, listen: false)
              //           .globalExerciseList[widget.exerciseIndex]
              //           .exItemProcedure)
              //         Padding(
              //           padding: const EdgeInsets.all(4.0),
              //           child: Text('- $eachSymptom', style: Theme.of(context).textTheme.bodyLarge),
              //         )
              //     ],
              //   ),
              // ),
              // const SizedBox(height: 20),
              // Expanded(
              //   child: ListView.builder(
              //     itemCount: Provider.of<DisorderList>(context, listen: false)
              //         .globalDisorderList[widget.disorderIndex]
              //         .disItemImagePaths
              //         .length,
              //     itemBuilder: (context, disorderImageIndex) => Container(
              //       height: 200,
              //       decoration: BoxDecoration(
              //         image: DecorationImage(
              //           image: AssetImage(
              //             Provider.of<DisorderList>(context, listen: false)
              //                 .globalDisorderList[widget.disorderIndex]
              //                 .disItemImagePaths[disorderImageIndex],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
