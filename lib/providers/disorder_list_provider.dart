import 'package:flutter/material.dart';

import '../models/disorder_item.dart';

class DisorderListProvider with ChangeNotifier {
  final List<DisorderItem> _globalDisorderList = [
    DisorderItem(
      disItemId: 'disorderItem1',
      disItemTitle: 'Sciatica',
      disItemDescription:
          'Sciatica is a common type of pain affecting the sciatic nerve, a large nerve extending from your lower back down the back of each leg.',
      disItemSymptoms: [
        'Lower back pain',
        'Pain in the rear or leg that is worse when sitting',
        'Hip pain',
        'Burning or tingling down the leg',
        'Weakness, numbness, or a hard time moving the leg or foot',
        'A constant pain on one side of the rear'
      ],
      disItemExerciseList: [
        'exerciseItem1',
      ],
      disItemImagePaths: [
        'assets/images/sciatica1.jpeg',
        'assets/images/sciatica2.jpeg',
      ],
    ),
  ];

  List<DisorderItem> get globalDisorderList => _globalDisorderList;
}
