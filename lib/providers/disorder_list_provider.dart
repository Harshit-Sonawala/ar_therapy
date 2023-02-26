import 'package:flutter/material.dart';

import '../models/disorder_item.dart';

class DisorderListProvider with ChangeNotifier {
  final List<DisorderItem> _globalDisorderList = [
    DisorderItem(
      disItemId: 'disorderItem1',
      disItemTitle: 'Sciatica',
      disItemDescription:
          'Sciatica is a common type of pain affecting the sciatic nerve, a large nerve extending from your lower back down the back of each leg. Sciatica most often occurs when a herniated disk or an overgrowth of bone puts pressure on part of the nerve.',
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
        'assets/images/disorders/sciatica1.jpeg',
        'assets/images/disorders/sciatica2.jpeg',
      ],
    ),
    DisorderItem(
      disItemId: 'disorderItem2',
      disItemTitle: 'Scapular Dyskinesis',
      disItemDescription:
          'Scapular Dyskinesis is an alteration or deviation in the normal resting or active position of the Scaplua during shoulder movement. Scapular rotation is important for proper shoulder function and it can move in abnormal ways due to repetitive use of the shoulder. The Scapula (shoulder blade) also serves as a stable base for rotator cuff activation and functioning. Any bony or soft tissue injury around the shoulder can alter the roles of the scapula in motion or at rest.',
      disItemSymptoms: [
        'Limited range of motion',
        'Crunching sound with shoulder movement',
        'Weakness in affected arms (often feels dead)',
        'Noticeable protrusion or "winging" of scapula',
        'A forward tilted posture on affected side',
        'Tenderness around the scapula, especially at the top or medial border along with fatigue of repetitive injuries, especially overhead movements.'
      ],
      disItemExerciseList: [
        'exerciseItem1',
      ],
      disItemImagePaths: [
        'assets/images/disorders/sciatica1.jpeg',
        'assets/images/disorders/sciatica2.jpeg',
      ],
    ),
  ];

  // Encapsulation for safety
  List<DisorderItem> get globalDisorderList => _globalDisorderList;
}
