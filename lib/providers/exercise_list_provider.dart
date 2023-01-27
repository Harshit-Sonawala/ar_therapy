import 'package:flutter/material.dart';

import '../models/exercise_item.dart';

class ExerciseList with ChangeNotifier {
  final List<ExerciseItem> _globalExerciseList = [
    ExerciseItem(
      exItemId: 'exerciseItem1',
      exItemTitle: 'Forward Flexion',
      exItemDescription:
          'Forward Flexion is an exercise to sometimes, low back extension exercises are warranted to treat your back pain. Extension of your spine occurs when you bend backward.',
      exItemProcedure: [
        'Stand Straight',
        'Keep your arms at your sides and straight as well',
        'Keep your back arched',
        'Slowly lift your arms so as to flex the back and shoulder muscles',
      ],
      exItemFocusAreas: [
        'Lower Back, Shoulders',
      ],
      exItemDisorderList: [
        'disorderItem1',
      ],
      exItemModelPath: 'assets/forward_flexion.glb',
    ),
    ExerciseItem(
      exItemId: 'exerciseItem2',
      exItemTitle: 'Scalpular Retractions.',
      exItemDescription:
          'Scapular retraction is the medical term for squeezing your shoulder blades together. The proper name for shoulder blades is scapulae (or scapula if referring to only one). And the actual motion of retraction is just that, retracting. Put together and you have scapular retraction.',
      exItemProcedure: [
        'Stand Straight',
        'Keep your arms at your sides and straight as well',
        'Keep your back arched',
        'Slowly lift your arms so as to flex the back and shoulder muscles',
      ],
      exItemFocusAreas: [
        'Lower Back, Shoulders',
      ],
      exItemDisorderList: [
        'disorderItem1',
      ],
      exItemModelPath: 'assets/forward_flexion.glb',
    ),
  ];

  List<ExerciseItem> get globalExerciseList => _globalExerciseList;
}
