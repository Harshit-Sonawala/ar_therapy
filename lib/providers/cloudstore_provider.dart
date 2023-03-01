import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudstoreProvider with ChangeNotifier {
  get cloudFirestoreDB => FirebaseFirestore.instance;

  void setUserData(User? passedCurrentUser, int passedCurrentAge) async {
    try {
      await cloudFirestoreDB.collection('users').doc(passedCurrentUser!.uid).set(
        {
          "userName": passedCurrentUser.displayName,
          "userEmail": passedCurrentUser.email,
          "userAge": passedCurrentAge,
        },
      ).then(
        (DocumentReference docRef) => debugPrint('User doc created with ID: ${docRef.id}'),
      );
    } catch (error) {
      debugPrint('Cloud Firestore setUserData error: $error');
    }
  }
}
