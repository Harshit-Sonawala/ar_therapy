import 'package:ar_therapy/widgets/custom_elevated_button.dart';
import 'package:ar_therapy/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<LoginScreen> {
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
                    padding: const EdgeInsets.all(5),
                    icon: Icons.arrow_back,
                    borderRadius: 50,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back',
                      style: Theme.of(context).textTheme.headline1,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Login here,',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Theme.of(context).primaryColor,
                          size: 24,
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
                        hintText: 'Email Address',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.key,
                          color: Theme.of(context).primaryColor,
                          size: 24,
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
                        hintText: 'Password',
                      ),
                    ),
                    const SizedBox(height: 40),
                    CustomElevatedButton(
                      onPressed: () => {},
                      title: 'Submit',
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    const SizedBox(height: 40),
                    CustomTextButton(
                      onPressed: () => {},
                      title: 'Not You? Create an Account',
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
