import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider with ChangeNotifier {
  // final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => FirebaseAuth.instance.currentUser;

  Stream<User?> get authStateChanges => FirebaseAuth.instance.authStateChanges();

  Future<String?> createUserWithEmailAndPassword({
    required BuildContext context,
    required String passedEmail,
    required String passedPassword,
    required String passedName,
  }) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: passedEmail,
            password: passedPassword,
          )
          .then(
            (response) => {
              currentUser!.updateDisplayName(passedName),
            },
          );
      debugPrint('Successfully created user: ${currentUser!.displayName}, ${currentUser!.uid}');
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Successfully created user',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          backgroundColor: const Color(0xff3d3d3d),
          closeIconColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      );
    } catch (error) {
      debugPrint('createUserWithEmailAndPassword error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            '$error',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          backgroundColor: const Color(0xff3d3d3d),
          closeIconColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      );
    }
    return currentUser!.uid;
  }

  Future<void> signInWithEmailAndPassword({
    required BuildContext context,
    required String passedEmail,
    required String passedPassword,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: passedEmail,
        password: passedPassword,
      );
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Successfully Signed In As: ${currentUser!.displayName}',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          backgroundColor: const Color(0xff3d3d3d),
          closeIconColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      );
    } catch (error) {
      debugPrint('signInWithEmailAndPassword error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            '$error',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          backgroundColor: const Color(0xff3d3d3d),
          closeIconColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      );
    }
  }

  Future<void> signOut({required BuildContext context}) async {
    try {
      await FirebaseAuth.instance.signOut();
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            'Successfully Signed Out',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          backgroundColor: const Color(0xff3d3d3d),
          closeIconColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      );
    } catch (error) {
      debugPrint('signOut error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          content: Text(
            '$error',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          backgroundColor: const Color(0xff3d3d3d),
          closeIconColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        ),
      );
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
