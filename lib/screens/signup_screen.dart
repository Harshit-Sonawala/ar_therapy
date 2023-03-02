import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/cloudstore_provider.dart';

import 'login_screen.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _passwordIsObscured = true;
  bool _confirmPasswordIsObscured = true;

  String? _newUserId;

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                      controller: _nameController,
                      keyboardType: TextInputType.name,
                      style: Theme.of(context).textTheme.bodyLarge,
                      cursorColor: Theme.of(context).primaryColor,
                      decoration: InputDecoration(
                        labelText: 'Your Name *',
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          color: Colors.grey,
                        ),
                        floatingLabelStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        prefixIcon: Icon(
                          Icons.person,
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
                      controller: _emailController,
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
                      controller: _passwordController,
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
                      controller: _confirmPasswordController,
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
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _ageController,
                            keyboardType: TextInputType.number,
                            style: Theme.of(context).textTheme.bodyLarge,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                              labelText: 'Your Age',
                              labelStyle: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                              floatingLabelStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
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
                        ),
                        const SizedBox(width: 10),
                        CustomTextButton(
                          onPressed: () => {
                            setState(() {
                              if (_ageController.text != '' && int.parse(_ageController.text) < 200) {
                                _ageController.text = (int.parse(_ageController.text) + 1).toString();
                              }
                            }),
                          },
                          padding: const EdgeInsets.all(5),
                          icon: Icons.keyboard_arrow_up,
                          border: const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: 10,
                        ),
                        const SizedBox(width: 10),
                        CustomTextButton(
                          onPressed: () => {
                            setState(() {
                              if (_ageController.text != '' && int.parse(_ageController.text) > 0) {
                                _ageController.text = (int.parse(_ageController.text) - 1).toString();
                              }
                            }),
                          },
                          padding: const EdgeInsets.all(5),
                          icon: Icons.keyboard_arrow_down,
                          border: const BorderSide(width: 1, color: Colors.grey),
                          borderRadius: 10,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    CustomElevatedButton(
                      onPressed: () async {
                        debugPrint(
                          'Email: ${_emailController.text.trim()}, Password: ${_passwordController.text.trim()}',
                        );
                        _newUserId =
                            await Provider.of<AuthProvider>(context, listen: false).createUserWithEmailAndPassword(
                          passedName: _nameController.text.trim(),
                          passedEmail: _emailController.text.trim(),
                          passedPassword: _passwordController.text.trim(),
                        );
                        setState(() {});
                        if (_newUserId != null) {
                          Provider.of<CloudstoreProvider>(context, listen: false).setUserData(
                            passedId: _newUserId!,
                            passedName: _nameController.text.trim(),
                            passedEmail: _emailController.text.trim(),
                            passedAge: int.parse(_ageController.text.trim()),
                          );
                        }
                        Navigator.pop(context);
                      },
                      title: 'Create Account',
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
