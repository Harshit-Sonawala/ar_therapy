import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

import 'login_screen.dart';
import 'signup_screen.dart';
import 'user_account_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<AuthProvider>(context).currentUser == null) {
      return const LoginScreen();
    } else {
      return const UserAccountScreen();
    }
  }
}
