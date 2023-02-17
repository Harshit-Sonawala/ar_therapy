import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

import 'login_screen.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController? _nameController;
  TextEditingController? _ageController;
  TextEditingController? _heightController;
  TextEditingController? _weightController;
  TextEditingController? _emailTextController;
  TextEditingController? _passwordTextController;
  TextEditingController? _confirmPasswordTextController;
  bool _passwordIsObscured = true;
  bool _confirmPasswordIsObscured = true;

  @override
  void dispose() {
    _nameController!.dispose();
    _ageController!.dispose();
    _heightController!.dispose();
    _weightController!.dispose();
    _emailTextController!.dispose();
    _passwordTextController!.dispose();
    _confirmPasswordTextController!.dispose();
    super.dispose();
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
                      'Sign Up',
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Enter your details and create an account:',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(height: 40),
                    TextField(
                      controller: _emailTextController,
                      keyboardType: TextInputType.emailAddress,
                      style: Theme.of(context).textTheme.bodyLarge,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        labelText: 'Email Address *',
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
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
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      obscureText: _passwordIsObscured,
                      controller: _passwordTextController,
                      style: Theme.of(context).textTheme.bodyLarge,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        labelText: 'Choose a Password *',
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Theme.of(context).primaryColor,
                          size: 24,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () => {
                            setState(() => _passwordIsObscured = !_passwordIsObscured),
                          },
                          icon: Icon(
                            _passwordIsObscured ? Icons.visibility : Icons.visibility_off,
                            color: Theme.of(context).primaryColor,
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
                    TextField(
                      obscureText: _confirmPasswordIsObscured,
                      controller: _confirmPasswordTextController,
                      style: Theme.of(context).textTheme.bodyLarge,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        labelText: 'Confirm Password *',
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        prefixIcon: Icon(
                          Icons.key,
                          color: Theme.of(context).primaryColor,
                          size: 24,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () => {
                            setState(() => _confirmPasswordIsObscured = !_confirmPasswordIsObscured),
                          },
                          icon: Icon(
                            _confirmPasswordIsObscured ? Icons.visibility : Icons.visibility_off,
                            color: Theme.of(context).primaryColor,
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
                    const SizedBox(height: 40),
                    CustomElevatedButton(
                      onPressed: () => {
                        debugPrint(
                          'Email: ${_emailTextController!.text.trim()}, Password: ${_passwordTextController!.text.trim()}',
                        ),
                      },
                      title: 'Submit',
                      mainAxisAlignment: MainAxisAlignment.center,
                    ),
                    const SizedBox(height: 40),
                    CustomTextButton(
                      onPressed: () => {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        ),
                      },
                      title: 'Already have an account? Login here',
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
