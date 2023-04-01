import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/cloudstore_provider.dart';

import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_button.dart';

class UserAccountScreen extends StatefulWidget {
  final String? passedUserId;
  const UserAccountScreen({this.passedUserId, Key? key}) : super(key: key);

  @override
  State<UserAccountScreen> createState() => _UserAccountScreenState();
}

class _UserAccountScreenState extends State<UserAccountScreen> {
  Map<String, dynamic>? _currentUserDoc;
  @override
  initState() {
    CloudstoreProvider().getUserData(widget.passedUserId).then((gotData) {
      setState(() {
        _currentUserDoc = gotData;
      });
    });
    super.initState();
  }

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
                    padding: const EdgeInsets.all(6.0),
                    icon: Icons.arrow_back,
                    borderRadius: 50,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    'My Account',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 20),
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
              // FutureBuilder(
              //   future: CloudstoreProvider().getUserData(widget.passedUserId),
              //   builder: (BuildContext context, AsyncSnapshot fetchedDataSnapshot) {
              //     if (fetchedDataSnapshot.connectionState == ConnectionState.waiting) {
              //       return CircularProgressIndicator(color: Theme.of(context).primaryColor);
              //     } else {
              //       return Text('${fetchedDataSnapshot.data['userName']}');
              //     }
              //   },
              // ),
              Text(
                Provider.of<AuthProvider>(context).currentUser != null
                    ? '${Provider.of<AuthProvider>(context).currentUser!.displayName}'
                    : 'User Name',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(Icons.email),
                    const SizedBox(width: 10),
                    Text(
                      Provider.of<AuthProvider>(context).currentUser != null
                          ? '${Provider.of<AuthProvider>(context).currentUser!.email}'
                          : 'example@email.com',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_currentUserDoc != null)
                    Text(
                      'Age: ${_currentUserDoc?['userAge']}',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  const SizedBox(width: 20),
                  Text(
                    'Gender: Male',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height: 5 ft, 6 in',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'Weight: 75Kg',
                    style: Theme.of(context).textTheme.bodyMedium,
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
                      Provider.of<AuthProvider>(context, listen: false).signOut(context: context),
                      Navigator.pop(context),
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
