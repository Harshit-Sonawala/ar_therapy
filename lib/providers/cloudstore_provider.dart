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
      Map<String, dynamic>? gotData = await getUserData(passedUserId);
      Map<String, dynamic> finalData = {
        ...gotData!,
        ...passedData,
      };
      await cloudFirestoreDB.collection('users').doc(passedUserId).set(finalData);
    } catch (error) {
      debugPrint('Cloud Firestore setUserDataById error: $error');
    }
  }

  void addToUserExListById(BuildContext context, String? passedUserId, String passedExItemId) async {
    try {
      List<dynamic> finalList;
      Map<String, dynamic> finalData;
      Map<String, dynamic>? gotData = await getUserData(passedUserId);
      bool exAlreadyExists = false;

      Map<String, dynamic> finalExercise = {
        "exListItemId": passedExItemId,
        "exListItemTimestamp": Timestamp.now(),
      };

      if (gotData!['exList'] != null && gotData['exList'].length > 0) {
        // List length > 0 so take existing and append new exercise
        gotData['exList']
            .map((eachExercise) => {
                  debugPrint('Specific: ${eachExercise['exListItemId']}'),
                  if (eachExercise['exListItemId'] == passedExItemId)
                    {
                      exAlreadyExists = true,
                    }
                })
            .toList();
        if (exAlreadyExists) {
          debugPrint('Reached Already Exists Code');
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(
                'Exercise already in your list',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              backgroundColor: const Color(0xff3d3d3d),
              closeIconColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          );
        } else {
          debugPrint('Reached Does Not Already Exist Code');
          finalList = gotData['exList'];
          finalList.add(finalExercise);
          finalData = {
            ...gotData,
            'exList': finalList,
          };
          await cloudFirestoreDB.collection('users').doc(passedUserId).set(finalData);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              content: Text(
                'Added exercise to your list',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              backgroundColor: const Color(0xff3d3d3d),
              closeIconColor: Theme.of(context).primaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
          );
        }
      } else {
        // List is null/empty so simply add the new exercise
        finalData = {
          ...gotData,
          'exList': [
            finalExercise,
          ],
        };
        await cloudFirestoreDB.collection('users').doc(passedUserId).set(finalData);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(
              'Added exercise to your list',
              style: Theme.of(context).textTheme.bodySmall,
            ),
            backgroundColor: const Color(0xff3d3d3d),
            closeIconColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          ),
        );
      }
    } catch (error) {
      debugPrint('Cloud Firestore addToUserExListById error: $error');
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
}
