import 'package:flutter/material.dart';

import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_button.dart';

class UserAccountScreen extends StatefulWidget {
  const UserAccountScreen({Key? key}) : super(key: key);

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  CustomTextButton(
                    onPressed: () => {
                      Navigator.pop(context),
                    },
                    icon: Icons.arrow_back,
                    borderRadius: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundColor: Color(0xff3d3d3d),
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: 80,
                    color: Color.fromARGB(255, 107, 107, 107),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Center(
                child: Text(
                  'Harshit Sonawala',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Age: 21',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Gender: Male',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height: 5 ft, 6 in',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Weight: 75Kg',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomElevatedButton(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    onPressed: () => {
                      debugPrint('Logout Pressed'),
                    },
                    icon: Icons.logout,
                    iconSize: 20,
                    title: 'Logout',
                    fontSize: 18,
                  ),
                  CustomElevatedButton(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 16,
                    ),
                    onPressed: () => {
                      debugPrint('Edit Details Pressed'),
                    },
                    icon: Icons.edit,
                    iconSize: 20,
                    title: 'Edit Details',
                    fontSize: 18,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
