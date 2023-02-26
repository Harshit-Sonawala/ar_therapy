import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudstoreProvider with ChangeNotifier {
  get cloudFirestoreDB => FirebaseFirestore.instance;

  void setUserData(User? passedCurrentUser, int passedCurrentAge) {
    cloudFirestoreDB.collection('users').doc(passedCurrentUser!.uid).set(
      {
        "userName": passedCurrentUser.displayName,
        "userEmail": passedCurrentUser.email,
        "userAge": passedCurrentAge,
      },
    );
  }
}
