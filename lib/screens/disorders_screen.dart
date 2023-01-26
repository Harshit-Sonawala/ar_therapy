import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../providers/disorder_list_provider.dart';

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
              const CustomCard(
                child: Text(
                  'Browse through various physical disorders and tap to learn more about them',
                  style: TextStyle(fontSize: 21.0),
                ),
              ),
              const SizedBox(height: 20.0),
              Expanded(
                  child: ListView.builder(
                itemCount: Provider.of<DisorderList>(context, listen: false).globalDisorderList.length,
                itemBuilder: (context, eachDisorder) => CustomListItem(
                  onPressed: () => {},
                  title:
                      Provider.of<DisorderList>(context, listen: false).globalDisorderList[eachDisorder].disItemTitle,
                  body: Provider.of<DisorderList>(context, listen: false)
                      .globalDisorderList[eachDisorder]
                      .disItemDescription,
                  images: Provider.of<DisorderList>(context, listen: false)
                      .globalDisorderList[eachDisorder]
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
