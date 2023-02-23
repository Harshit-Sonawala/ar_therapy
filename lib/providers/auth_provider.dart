import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

// import '../models/user_model.dart';

class AuthProvider with ChangeNotifier {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => FirebaseAuth.instance.currentUser;

  Stream<User?> get authStateChanges => FirebaseAuth.instance.authStateChanges();

  Future<void> createUserWithEmailAndPassword({
    required String passedEmail,
    required String passedPassword,
    required String passedName,
    int passedAge = 0,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: passedEmail,
        password: passedPassword,
      );
      notifyListeners();
    } catch (error) {
      debugPrint('Create User Error: $error');
    }
  }

  Future<void> signInWithEmailAndPassword({
    required String passedEmail,
    required String passedPassword,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: passedEmail,
        password: passedPassword,
      );
      notifyListeners();
    } catch (error) {
      debugPrint('Sign In User Error: $error');
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      notifyListeners();
    } catch (error) {
      debugPrint('Sign Out Error: $error');
    }
  }

  // UserModel? _userFromFirebase(auth.User? user) {
  //   if (user == null) {
  //     return null;
  //   } else {
  //     return UserModel(user.uid, user.email);
  //   }
  // }

  // Stream<UserModel?>? get user {
  //   return _firebaseAuth.authStateChanges().map(_userFromFirebase);
  // }

  // Future<UserModel?> createUserWithEmailAndPassword(String email, String password) async {
  //   final credential = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  //   return _userFromFirebase(credential.user);
  // }

  // Future<UserModel?> signInWithEmailAndPassword(String email, String password) async {
  //   final credential = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  //   return _userFromFirebase(credential.user);
  // }

  // Future<void> signOut() async {
  //   return await _firebaseAuth.signOut();
  // }
}
