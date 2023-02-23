import 'package:ar_therapy/screens/login_screen.dart';
import 'package:ar_therapy/screens/user_account_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<AuthProvider>(context, listen: true).currentUser != null) {
      return const UserAccountScreen();
    } else {
      return const LoginScreen();
    }
  }
}
