import 'package:flutter/material.dart';

// import './wip_screen.dart';
import './webview_screen.dart';

import '../widgets/custom_card.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_circular_loader.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

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
                      child: Text(
                        'Search the Web',
                        style: Theme.of(context).textTheme.bodyMedium,
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
                      onPressed: () => {debugPrint('Search Query: ${_searchController.text}')},
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
                const SizedBox(height: 20.0),
                _searchController.text.trim() != ''
                    ? const CustomCircularLoader(title: 'Loading Search Results...')
                    : Center(
                        child: CustomCard(
                          padding: const EdgeInsets.symmetric(
                            vertical: 60.0,
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
                              const SizedBox(height: 20),
                              Text(
                                'Please enter a search query',
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
