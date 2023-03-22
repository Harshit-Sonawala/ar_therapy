import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class CloudstoreProvider with ChangeNotifier {
  get cloudFirestoreDB => FirebaseFirestore.instance;

  Future<void> setUserData({
    required String passedId,
    required String passedName,
    required String passedEmail,
    required int passedAge,
  }) async {
    debugPrint('Cloud Firestore setUserData passedCurrentUser: $passedId');
    try {
      await cloudFirestoreDB.collection('users').doc(passedId).set(
        {
          "userName": passedName,
          "userEmail": passedEmail,
          "userAge": passedAge,
        },
      ).then(
        (DocumentReference docRef) => {
          debugPrint('User doc created with ID: $docRef'),
          notifyListeners(),
        },
      );
    } catch (error) {
      debugPrint('Cloud Firestore setUserData error: $error');
    }
  }

  // get currentUserDoc async {
  //   var gotCurrentUserDoc = await getUserData();
  //   return gotCurrentUserDoc;
  // }

  Future<Map<String, dynamic>?> getUserData(String? passedUserId) async {
    Map<String, dynamic>? gotData;
    try {
      await cloudFirestoreDB.collection('users').doc(passedUserId).get().then(
        (docSnap) {
          gotData = docSnap.data() as Map<String, dynamic>?;
          debugPrint('Cloud Firestore getUserData got: $gotData');
        },
      );
      // final Map<String, dynamic> gotData;
      // await cloudFirestoreDB.collection('users').doc(passedCurrentUser!.uid).get().data().then(
      // ) as Map<String, dynamic>;
      // return gotData;
    } catch (error) {
      debugPrint('Cloud Firestore getUserData error: $error');
    }
    return gotData;
  }

  void setUserDataById(String? passedUserId, Map<String, dynamic> passedData) async {
    try {
      await cloudFirestoreDB.collection('users').doc(passedUserId).set(passedData);
    } catch (error) {
      debugPrint('Cloud Firestore getUserById error: $error');
    }
  }
}
