import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/disorder_list_provider.dart';

import '../widgets/custom_text_button.dart';
import '../widgets/custom_card.dart';

class DisorderDetailsScreen extends StatefulWidget {
  final int disorderIndex;

  const DisorderDetailsScreen({
    Key? key,
    required this.disorderIndex,
  }) : super(key: key);

  @override
  State<DisorderDetailsScreen> createState() => _DisorderDetailsScreenState();
}

class _DisorderDetailsScreenState extends State<DisorderDetailsScreen> {
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
                  const Text('Disorder Details'),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                Provider.of<DisorderList>(context, listen: false).globalDisorderList[widget.disorderIndex].disItemTitle,
                style: Theme.of(context).textTheme.headline1,
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
                        Provider.of<DisorderList>(context, listen: false)
                            .globalDisorderList[widget.disorderIndex]
                            .disItemDescription,
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CustomCard(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Symptoms',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    for (var eachSymptom in Provider.of<DisorderList>(context, listen: false)
                        .globalDisorderList[widget.disorderIndex]
                        .disItemSymptoms)
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text('- $eachSymptom', style: Theme.of(context).textTheme.bodyText1),
                      )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: Provider.of<DisorderList>(context, listen: false)
                      .globalDisorderList[widget.disorderIndex]
                      .disItemImagePaths
                      .length,
                  itemBuilder: (context, disorderImageIndex) => Container(
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          Provider.of<DisorderList>(context, listen: false)
                              .globalDisorderList[widget.disorderIndex]
                              .disItemImagePaths[disorderImageIndex],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
