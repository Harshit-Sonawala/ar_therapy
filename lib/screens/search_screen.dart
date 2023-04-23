import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

import '../models/disorder_item.dart';
import '../models/exercise_item.dart';
import '../providers/disorder_list_provider.dart';
import '../providers/exercise_list_provider.dart';

import '../widgets/custom_card.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_divider.dart';
import '../widgets/custom_list_item.dart';

import './webview_screen.dart';
import './disorder_details_screen.dart';
import './exercise_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  String finalSearchQuery = '';
  List<DisorderItem> disorderItemSearchResults = [];
  List<ExerciseItem> exerciseItemSearchResults = [];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton.extended(
      //   backgroundColor: Theme.of(context).primaryColor,
      //   label: const Text('Search the Web'),
      //   onPressed: () => {},
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const SizedBox(width: 10),
                        Text(
                          'Search',
                          style: Theme.of(context).textTheme.displayLarge,
                        ),
                      ],
                    ),
                    CustomElevatedButton(
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const WebviewScreen(),
                          ),
                        )
                      },
                      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      borderRadius: BorderRadius.circular(50.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.travel_explore,
                            size: 24,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            'Web Search',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomCard(
                  child: Text(
                    'Search for any disorders or exercises you wish to learn more about',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  onChanged: (newString) => setState(() {}),
                  controller: _searchController,
                  style: Theme.of(context).textTheme.bodyMedium,
                  cursorColor: Theme.of(context).primaryColor,
                  decoration: InputDecoration(
                    labelText: 'Enter Search Query...',
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                    floatingLabelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => {
                        finalSearchQuery = _searchController.text,
                        debugPrint('Search Query: $finalSearchQuery'),
                        setState(() {
                          disorderItemSearchResults = DisorderListProvider().searchDisorderList(
                            finalSearchQuery,
                          );
                          exerciseItemSearchResults = ExerciseListProvider().searchExerciseList(
                            finalSearchQuery,
                          );
                          debugPrint(
                              'DisorderItems: $disorderItemSearchResults, ExerciseItems: $exerciseItemSearchResults');
                        }),
                      },
                      icon: Icon(
                        Icons.search,
                        color: Theme.of(context).primaryColor,
                        size: 24,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                        color: Theme.of(context).primaryColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                disorderItemSearchResults.isEmpty && exerciseItemSearchResults.isEmpty
                    ? CustomCard(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40.0,
                          horizontal: 40.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Icon(
                              Icons.manage_search,
                              size: 60.0,
                              color: Colors.grey,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'No Results.',
                              style: Theme.of(context).textTheme.displayLarge,
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Please enter a search query and submit',
                              style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                    : Column(
                        children: [
                          Column(
                            children: disorderItemSearchResults
                                .mapIndexed(
                                  (disorderIndex, eachDisorderResult) => CustomListItem(
                                    padding: const EdgeInsets.only(bottom: 20.0),
                                    onPressed: () => {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => DisorderDetailsScreen(
                                            passedDisorderItem: eachDisorderResult,
                                          ),
                                        ),
                                      ),
                                    },
                                    title: eachDisorderResult.disItemTitle,
                                    body: eachDisorderResult.disItemDescription,
                                    images: eachDisorderResult.disItemImagePaths,
                                  ),
                                )
                                .toList(),
                          ),
                          Column(
                            children: exerciseItemSearchResults
                                .mapIndexed(
                                  (exerciseIndex, eachExerciseResult) => CustomListItem(
                                    padding: const EdgeInsets.only(bottom: 20.0),
                                    onPressed: () => {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => ExerciseDetailsScreen(
                                            passedExerciseItem: eachExerciseResult,
                                          ),
                                        ),
                                      ),
                                    },
                                    title: eachExerciseResult.exItemTitle,
                                    body: eachExerciseResult.exItemDescription,
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                // : const CustomCircularLoader(title: 'Loading Search Results...')
                if (_searchController.text.trim() != '')
                  CustomTextButton(
                    onPressed: () => {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => WebviewScreen(
                            passedSearchQuery: _searchController.text.trim(),
                          ),
                        ),
                      )
                    },
                    title: 'Search the Web for \'${_searchController.text.trim()}\'',
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
