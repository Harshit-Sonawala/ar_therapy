import 'package:flutter/material.dart';

import '../models/exercise_item.dart';

class ExerciseListProvider with ChangeNotifier {
  final List<ExerciseItem> _globalExerciseList = [
    ExerciseItem(
      exItemId: 'exerciseItem1',
      exItemTitle: 'Forward Flexion',
      exItemDescription:
          'Forward Flexion is an exercise to help loosen the lower back and shoulder muscles. Sometimes, low back extension exercises are warranted to treat your back pain. Extension of your spine occurs when you bend backward.',
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
      exItemModelPath: 'assets/3d_models/forward_flexion.glb',
    ),
    ExerciseItem(
      exItemId: 'exerciseItem2',
      exItemTitle: 'Scapular Retractions',
      exItemDescription:
          'Scapular retraction is the medical term for squeezing your shoulder blades together. The proper name for shoulder blades is scapulae (or scapula if referring to only one). And the actual motion of retraction is just that, retracting. Put together and you have scapular retraction.',
      exItemProcedure: [
        'Stand Straight',
        'Put your hands behind your head',
        'Join both of your hands',
        'Slowly move arms from the left, to the center and then to the right',
      ],
      exItemFocusAreas: [
        'Upper Back, Scapular',
      ],
      exItemDisorderList: [
        'disorderItem1',
      ],
      exItemModelPath: 'assets/3d_models/scapular.glb',
    ),
    ExerciseItem(
      exItemId: 'exerciseItem3',
      exItemTitle: 'Knees Stretch',
      exItemDescription:
          'This exercise is for facilitating better movement of the leg and the movement of the knees. You slowly lift your legs so as to gradually bend at the knees',
      exItemProcedure: [
        'Stand Straight',
        'Put your hands behind your head',
        'Slowly lift your leg up, gradually bending at the knees and then down again.',
        'Repeat with the other leg and continue onwards',
      ],
      exItemFocusAreas: [
        'Knees',
      ],
      exItemDisorderList: [
        'disorderItem1',
      ],
      exItemModelPath: 'assets/3d_models/knees_stretch.glb',
    ),
    ExerciseItem(
      exItemId: 'exerciseItem4',
      exItemTitle: 'Seated Leg Raises',
      exItemDescription:
          'This exercise is for lower back pain. It is usually for helping with disorders such as Piriformis Syndrome and Sciatica. It helps to alleviate tight hamstrings and in turn also relieve tight nerves.',
      exItemProcedure: [
        'Sit on any surface with a back support',
        'Put your hands on your knees',
        'Slowly lift your leg up, raise it to you knee level till the entire leg is straightened.',
        'Repeat with the other leg and continue onwards',
      ],
      exItemFocusAreas: [
        'Lower Back',
        'Hamstrings',
      ],
      exItemDisorderList: [
        'disorderItem1',
      ],
      exItemModelPath: 'assets/3d_models/leg_raise.glb',
    ),
    ExerciseItem(
      exItemId: 'exerciseItem5',
      exItemTitle: 'Chin to Chest',
      exItemDescription:
          'This exercise is primarily for Cervical Spondilitis, relieving nerves in the neck region supporting movements. ',
      exItemProcedure: [
        'Stand Straight with the back against the wall',
        'Look Straight and slowly rest your neck such that it touches the wall',
        'As per your pain level, raise your chin and then gradually lower it till your chin touches your chest',
        'Repeat 5 to 10 times as per your pain level',
      ],
      exItemFocusAreas: [
        'Neck',
      ],
      exItemDisorderList: [
        'disorderItem1',
      ],
      exItemModelPath: 'assets/3d_models/chin_chest.glb',
    ),
  ];

  List<ExerciseItem> get globalExerciseList => _globalExerciseList;

  // Pass a list of exItemIds like: ['exerciseItem3', 'exerciseItem1'] and get the filtered List<ExerciseItems>
  List<ExerciseItem> getFilteredExerciseList(List<String> passedExItemIdsList) =>
      globalExerciseList.where((eachExercise) => passedExItemIdsList.contains(eachExercise.exItemId)).toList();

  List<ExerciseItem> searchExerciseList(String searchQuery) {
    List<String> finalSearchKeywordList = searchQuery.trim().toLowerCase().split(" ");

    return globalExerciseList
        .where(
          (eachDisorder) => finalSearchKeywordList.any(
            (eachKeyword) => eachDisorder.exItemTitle.trim().toLowerCase().split(" ").contains(eachKeyword),
          ),
        )
        .toList();

    // return globalExerciseList
    //     .where(
    //       (eachExercise) => searchWords.contains(
    //         eachExercise.exItemTitle.toLowerCase(),
    //       ),
    //     )
    //     .toList();
  }
}
