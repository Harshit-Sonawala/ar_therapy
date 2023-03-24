import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/exercise_list_provider.dart';

import 'exercise_details_screen.dart';

import '../widgets/custom_text_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_list_item.dart';

class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                CustomTextButton(
                  onPressed: () => {
                    Navigator.pop(context),
                  },
                  padding: const EdgeInsets.all(6.0),
                  icon: Icons.arrow_back,
                  borderRadius: 50,
                ),
                const SizedBox(width: 10),
                const Text('Exercises'),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CustomCard(
                      child: Text(
                        'Browse through various exercises and tap to view their 3D and AR View',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Expanded(
                        child: ListView.builder(
                      itemCount: Provider.of<ExerciseListProvider>(context, listen: false).globalExerciseList.length,
                      itemBuilder: (context, exerciseIndex) => Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: CustomListItem(
                          onPressed: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ExerciseDetailsScreen(
                                  exerciseIndex: exerciseIndex,
                                ),
                              ),
                            ),
                          },

                          title: Provider.of<ExerciseListProvider>(context, listen: false)
                              .globalExerciseList[exerciseIndex]
                              .exItemTitle,
                          body: Provider.of<ExerciseListProvider>(context, listen: false)
                              .globalExerciseList[exerciseIndex]
                              .exItemDescription,
                          // modelPath: Provider.of<ExerciseList>(context, listen: false)
                          //     .globalExerciseList[disorderIndex]
                          //     .exItemModelPath,
                        ),
                      ),
                    )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
