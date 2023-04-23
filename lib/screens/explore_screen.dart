import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import './disorders_screen.dart';
import './exercises_screen.dart';

import '../widgets/custom_card.dart';
import '../widgets/custom_elevated_button.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      'Explore',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                CustomCard(
                  child: Text(
                    'Browse from numerous disorders and exercises and get their detailed information',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const DisordersScreen(),
                      ),
                    )
                  },
                  backgroundImage: 'assets/images/disorders.jpeg',
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
                    child: Text(
                      'Browse Disorders',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                CustomElevatedButton(
                  onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ExercisesScreen(),
                      ),
                    )
                  },
                  backgroundImage: 'assets/images/exercises.jpeg',
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
                    child: Text(
                      'Browse Exercises',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  onPressed: () async {
                    final encodedQuery = Uri.encodeQueryComponent("Physiotherapist near me");
                    final Uri url = Uri.parse("https://www.google.com/maps/search/?api=1&query=$encodedQuery");
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Physiotherapists Near Me',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
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
