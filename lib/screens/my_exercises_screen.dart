import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../models/exercise_item.dart';
import '../providers/exercise_list_provider.dart';
import '../providers/auth_provider.dart';
import '../providers/cloudstore_provider.dart';

// import '../widgets/custom_text_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_list_item.dart';

import 'exercise_details_screen.dart';

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
              CustomCard(
                child: Text(
                  'Exercises added to your list are displayed here:',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: CloudstoreProvider().getUserData(Provider.of<AuthProvider>(context).currentUser!.uid),
                builder: (BuildContext context, AsyncSnapshot fetchedDataSnapshot) {
                  if (fetchedDataSnapshot.connectionState == ConnectionState.waiting) {
                    return CustomCard(
                      padding: const EdgeInsets.all(40.0),
                      child: CircularProgressIndicator(
                        color: Theme.of(context).primaryColor,
                      ),
                    );
                  } else {
                    List<String> filterExIdsList = List<String>.from(fetchedDataSnapshot.data['exList']
                        .map((eachExListItem) => '${eachExListItem['exListItemId']}')
                        .toList());
                    List<ExerciseItem> filteredExerciseList =
                        ExerciseListProvider().getFilteredExerciseList(filterExIdsList);
                    return Expanded(
                      child: ListView.builder(
                        itemCount: filteredExerciseList.length,
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
                            title: filteredExerciseList[exerciseIndex].exItemTitle,
                            body: filteredExerciseList[exerciseIndex].exItemDescription,
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
