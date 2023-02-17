import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/disorder_list_provider.dart';

import 'disorder_details_screen.dart';

import '../widgets/custom_text_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/custom_list_item.dart';

class DisordersScreen extends StatefulWidget {
  const DisordersScreen({super.key});

  @override
  State<DisordersScreen> createState() => _DisordersScreenState();
}

class _DisordersScreenState extends State<DisordersScreen> {
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
                  CustomTextButton(
                    onPressed: () => {
                      Navigator.pop(context),
                    },
                    padding: const EdgeInsets.all(5),
                    icon: Icons.arrow_back,
                    borderRadius: 50,
                  ),
                  const SizedBox(width: 10),
                  const Text('Disorders'),
                ],
              ),
              const SizedBox(height: 20.0),
              CustomCard(
                child: Text(
                  'Browse through various physical disorders and tap to learn more about them',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                  child: ListView.builder(
                itemCount: Provider.of<DisorderListProvider>(context, listen: false).globalDisorderList.length,
                itemBuilder: (context, disorderIndex) => CustomListItem(
                  onPressed: () => {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => DisorderDetailsScreen(
                          disorderIndex: disorderIndex,
                        ),
                      ),
                    ),
                  },
                  title: Provider.of<DisorderListProvider>(context, listen: false)
                      .globalDisorderList[disorderIndex]
                      .disItemTitle,
                  body: Provider.of<DisorderListProvider>(context, listen: false)
                      .globalDisorderList[disorderIndex]
                      .disItemDescription,
                  images: Provider.of<DisorderListProvider>(context, listen: false)
                      .globalDisorderList[disorderIndex]
                      .disItemImagePaths,
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
