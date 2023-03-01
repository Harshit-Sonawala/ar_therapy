import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudstoreProvider with ChangeNotifier {
  get cloudFirestoreDB => FirebaseFirestore.instance;

  void setUserData(User? passedCurrentUser, int passedCurrentAge) async {
    debugPrint('Cloud Firestore setUserData passedCurrentUser: $passedCurrentUser');
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

  Future getUserData(User? passedCurrentUser) async {
    try {
      await cloudFirestoreDB.collection('users').doc(passedCurrentUser!.uid).get().then(
        (DocumentSnapshot gotDoc) {
          final gotData = gotDoc.data() as Map<String, dynamic>;
          return gotData;
        },
      );
    } catch (error) {
      debugPrint('Cloud Firestore getUserData error: $error');
    }
  }
}
