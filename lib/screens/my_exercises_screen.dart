import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/exercise_list_provider.dart';

import 'exercise_details_screen.dart';

import '../widgets/custom_text_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_list_item.dart';

class MyExercisesScreen extends StatefulWidget {
  const MyExercisesScreen({super.key});

  @override
  State<MyExercisesScreen> createState() => _MyExercisesScreenState();
}

class _MyExercisesScreenState extends State<MyExercisesScreen> {
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
                  const SizedBox(width: 10),
                  Text(
                    'My Exercises',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Column(
                  children: [
                    CustomCard(
                      child: Text(
                        'Exercises you add to your list are displayed here:',
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
            ],
          ),
        ),
      ),
    );
  }
}
