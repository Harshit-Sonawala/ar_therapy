import 'package:ar_therapy/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

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
            ],
          ),
        ),
      ),
    );
  }
}
