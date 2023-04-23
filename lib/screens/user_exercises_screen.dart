import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../models/exercise_item.dart';
import '../providers/exercise_list_provider.dart';
import '../providers/auth_provider.dart';
import '../providers/cloudstore_provider.dart';

// import '../widgets/custom_text_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_list_item.dart';
import '../widgets/custom_circular_loader.dart';

import 'exercise_details_screen.dart';

class UserExercisesScreen extends StatefulWidget {
  const UserExercisesScreen({super.key});

  @override
  State<UserExercisesScreen> createState() => _UserExercisesScreenState();
}

class _UserExercisesScreenState extends State<UserExercisesScreen> {
  int finalIndex = 0;

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
                  'Exercises added to your list:',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 20),
              FutureBuilder(
                future: CloudstoreProvider().getUserData(Provider.of<AuthProvider>(context).currentUser!.uid),
                builder: (BuildContext context, AsyncSnapshot fetchedDataSnapshot) {
                  if (fetchedDataSnapshot.connectionState == ConnectionState.waiting) {
                    return const CustomCircularLoader(title: 'Loading Exercises...');
                  } else {
                    List<String> filterExIdsList = List<String>.from(fetchedDataSnapshot.data['exList']
                        .map((eachExListItem) => '${eachExListItem['exListItemId']}')
                        .toList());
                    List<ExerciseItem> filteredExerciseList =
                        ExerciseListProvider().getFilteredExerciseList(filterExIdsList);
                    if (filteredExerciseList.isEmpty) {
                      // list is empty
                      return CustomCard(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40.0,
                          horizontal: 40.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Icon(
                              Icons.search_off,
                              size: 60.0,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Empty.',
                              style: Theme.of(context).textTheme.displayLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Please add exercises to your list by browsing for them',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      );
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: filteredExerciseList.length,
                          itemBuilder: (context, exerciseIndex) => Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: CustomListItem(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => ExerciseDetailsScreen(
                                      exerciseId: filteredExerciseList[exerciseIndex].exItemId,
                                    ),
                                  ),
                                );
                              },
                              // onLongPress: setState(() {

                              // }),
                              onLongPress: () => {
                                debugPrint(
                                  'Remove exercise $exerciseIndex from Firestore List of ${Provider.of<AuthProvider>(context, listen: false).currentUser?.displayName}',
                                ),
                                setState(() => {
                                      Provider.of<CloudstoreProvider>(context, listen: false).removeFromUserExListById(
                                        context,
                                        Provider.of<AuthProvider>(context, listen: false).currentUser?.uid,
                                        filteredExerciseList[exerciseIndex].exItemId,
                                      ),
                                    }),
                              },
                              title: filteredExerciseList[exerciseIndex].exItemTitle,
                              body: filteredExerciseList[exerciseIndex].exItemDescription,
                            ),
                          ),
                        ),
                      );
                    }
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
