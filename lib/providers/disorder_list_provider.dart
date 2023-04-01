import 'package:flutter/material.dart';

import '../models/disorder_item.dart';

class DisorderListProvider with ChangeNotifier {
  final List<DisorderItem> _globalDisorderList = [
    DisorderItem(
      disItemId: 'disorderItem1',
      disItemTitle: 'Sciatica',
      disItemDescription:
          'Sciatica is a common type of pain affecting the sciatic nerve, a large nerve extending from your lower back down the back of each leg. Sciatica most often occurs when a herniated disk or an overgrowth of bone puts pressure on part of the nerve.',
      disItemCauses: [
        'Sciatica is a condition that is often caused by pressure put on the sciatic nerve',
        'This pressure usually occurs due to herniation of a disc in the spine or the overgrowth of a bone which are often also called as bones spurs',
        'Being overweight is a very common cause of Sciatica',
      ],
      disItemSymptoms: [
        'Lower back pain',
        'Pain in the rear or leg that is worse when sitting',
        'Hip pain',
        'Burning or tingling down the leg',
        'Weakness, numbness, or a hard time moving the leg or foot',
        'A constant pain on one side of the rear',
        'A shooting pain that makes it hard to stand up',
      ],
      disItemExerciseList: [
        'exerciseItem3',
      ],
      disItemImagePaths: [
        'assets/images/disorders/disorderItem1_1.jpeg',
        'assets/images/disorders/disorderItem1_2.jpeg',
        'assets/images/disorders/disorderItem1_3.jpeg',
      ],
    ),
    DisorderItem(
      disItemId: 'disorderItem2',
      disItemTitle: 'Scapular Dyskinesis',
      disItemDescription:
          'Scapular Dyskinesis is an alteration or deviation in the normal resting or active position of the Scaplua during shoulder movement. Scapular rotation is important for proper shoulder function and it can move in abnormal ways due to repetitive use of the shoulder. The Scapula (shoulder blade) also serves as a stable base for rotator cuff activation and functioning. Any bony or soft tissue injury around the shoulder can alter the roles of the scapula in motion or at rest.',
      disItemCauses: [
        'Weakness, imbalance,tightness or detachment of the muscles that control the scapula',
        'Injuries to the nerves in close proximity to the muscle',
        'Injuries to the bones that support the scapula or injuries within the shoulder joint',
      ],
      disItemSymptoms: [
        'Limited range of motion',
        'Crunching sound with shoulder movement',
        'Weakness in affected arms (often feels dead)',
        'Noticeable protrusion or "winging" of scapula',
        'A forward tilted posture on affected side',
        'Tenderness around the scapula, especially at the top or medial border along with fatigue of repetitive injuries, especially overhead movements.'
      ],
      disItemExerciseList: [
        'exerciseItem2',
      ],
      disItemImagePaths: [
        'assets/images/disorders/disorderItem2_1.jpg',
        'assets/images/disorders/disorderItem2_2.jpeg',
        'assets/images/disorders/disorderItem2_3.jpeg',
      ],
    ),
    DisorderItem(
      disItemId: 'disorderItem3',
      disItemTitle: 'Cervical Spondilytis',
      disItemDescription:
          'It is a term that encompasses a wide range of progressive degenerative changes that affect all the components of the cervical spine. It is a natural process of aging around 40 years',
      disItemCauses: [
        'Age progression is the most common reason',
        'Occupations involving physical labour or similar activities have an increased risk of developing this in patients',
        'Genetic factors play a certain role in this',
        'Other factors such as Dehydrated disc, Bone Spurs, Stiff ligaments and Herniated discs',
      ],
      disItemSymptoms: [
        'Neck pain and neck stiffness usually by compression of neural structures',
        'Pain is generally in the upper limbs and the neck usually shoulders and chest or breasts',
        'Degenerative changes around surrounding structures such as joints or ligaments',
        'Tingling, numbness and weakness in the arms and feet',
        'Loss of bladder or bowel control',
      ],
      disItemExerciseList: [
        'exerciseItem10',
      ],
      disItemImagePaths: [
        'assets/images/disorders/disorderItem3_1.jpeg',
        'assets/images/disorders/disorderItem3_2.jpeg',
        'assets/images/disorders/disorderItem3_3.jpeg',
      ],
    ),
    DisorderItem(
      disItemId: 'disorderItem4',
      disItemTitle: 'Frozen Shoulder',
      disItemDescription:
          'Also called as Adhesive capsulitis, Frozen Shoulder involves stiffness and pain in the shoulder joint. It Mainly occurs for a long time over a period of 6 months to 3 years. There are 3 stages :- Freezing , Frozen and Thawing. It affects the entire shoulder capsule in one arm and the pain level management usually requires corticosteroids injection and ice/heat therapy.',
      disItemCauses: [
        'Lack of treatment after tendinitis',
        'Tightening of the capsule around the rotator cuff',
        'Arm fractures that did not get proper physical therapy post healing',
        'Age(Degenerative tissue causes tightness around shoulder sockets)',
        'Actions like rowing a boat without stretching',
        'Diabetes , Hyperthyroidism, Hypothyroidism, Parkinson\'s Disease',
        'Brain strokes that cause paralysis',
      ],
      disItemSymptoms: [
        'Symptoms varies with the stages itself as in the Freezing stage shoulder\'s range of motion decreases as a stiffness sets in',
        'Frozen stage shoulder is completely mobilized and cannot move much with a high level of pain setting in. In this stage , it becomes increasingly difficult to sleep or do normal exercises/tasks',
        'Thawing stage is where the pain reduces after a long time and stiffness reduces and range of motion is restored making it easier to do normal tasks',
      ],
      disItemExerciseList: [
        'exerciseItem10',
      ],
      disItemImagePaths: [
        'assets/images/disorders/disorderItem4_1.jpeg',
        'assets/images/disorders/disorderItem4_2.png',
        'assets/images/disorders/disorderItem4_3.jpeg',
        'assets/images/disorders/disorderItem4_4.jpeg',
      ],
    ),
    DisorderItem(
      disItemId: 'disorderItem5',
      disItemTitle: 'Piriformis Syndrome',
      disItemDescription:
          'This disorder is generally confused with sciatica and has to be diagnosed clinically after a series of physical therapy tests. This occurs generally when the piriformis muscle presses on the sciatic nerve causing a shooting pain in the regions of the hip,upper leg and butt.',
      disItemCauses: [
        'Muscle Spasms',
        'Inflammation of the piriformis or the tissues around it',
        'Injuring the hip,buttock or leg during any accident',
        'Overexercising or not warming up properly before long distance running and not stretching after',
      ],
      disItemSymptoms: [
        'Pain, Numbness and Tingling in the buttocks -Inflammation or swelling of the muscles',
        'Pain after sitting for long periods of time',
        'Worse pain while climbing stairs/running',
        'Shooting pain down the leg originating from the buttocks usually causes aches that also can be felt as a burning pain sensation',
      ],
      disItemExerciseList: [
        'exerciseItem10',
      ],
      disItemImagePaths: [
        'assets/images/disorders/disorderItem5_1.jpg',
        'assets/images/disorders/disorderItem5_2.jpg',
        'assets/images/disorders/disorderItem5_3.jpg',
        'assets/images/disorders/disorderItem5_4.jpg',
        'assets/images/disorders/disorderItem5_5.jpg',
      ],
    ),
    DisorderItem(
      disItemId: 'disorderItem6',
      disItemTitle: 'Huntington\'s Disease',
      disItemDescription:
          'Also called as Huntington\'s Chorea. It is an inherited condition in which nerve cells in the brain break down over time. It typically starts at around 30s or 40s. It has a wide impact on one\'s motor functions and usually results in movement, cognitive and psychiatric disorders.',
      disItemCauses: [
        'Huntington\'s disease is a progressive brain disorder caused by a single defective gene on chromosome 4 - one of the 23 human chromosomes',
        'This defect is "dominant," meaning that anyone who inherits it from a parent with Huntington\'s will eventually develop the disease',
      ],
      disItemSymptoms: [
        'Movement disorders such as involuntary jerking or writhing movements',
        'Muscle problems such as rigidity or muscle contracture (dystonia)',
        'Impaired Gait, posture and balance',
        'Difficulty with speech or swallowing',
        'Cognitive disorders such as difficulty prioritising or focusing on tasks',
        'Lack of flexibility or the tendency to get stuck on a thought or behaviour or action',
        'Insomnia, social withdrawal, fatigue, thoughts of death and suicide, depression'
      ],
      disItemExerciseList: [
        'exerciseItem10',
      ],
      disItemImagePaths: [
        'assets/images/disorders/disorderItem6_1.jpg',
        'assets/images/disorders/disorderItem6_2.jpg',
        'assets/images/disorders/disorderItem6_3.jpg',
        'assets/images/disorders/disorderItem6_4.jpg',
      ],
    ),
    DisorderItem(
      disItemId: 'disorderItem7',
      disItemTitle: 'Arthritis',
      disItemDescription:
          'Arthritis is a disease that affects the joints connecting the bones. It can manifest in both acute and chronic forms and is associated with inflammation of the joints. Generally a role of a PT in treating arthritis involves the improvement of the mobility and re-establishment of the functioning of the affected joints by employing various therapies. These can be over many different forms some being degenerative, post traumatic, spondyloarthritis.',
      disItemCauses: [
        'Osteoarthritis is generally caused by the wear-and-tear damage to a joint\'s cartilage - the hard, slick coating on the ends of bones where they form a joint. If cartilage is damaged it causes the joint lining to become inflamed and swollen',
        'Rheumatoid Arthritis is where the body\'s immune system attacks the lining of the joint capsule, a tough membrane that encloses all the joint parts which makes it inflamed and swollen',
        'Factors such as family history, age, gender, obesity and previous joint injuries can enhance causes of arthritis',
      ],
      disItemSymptoms: [
        'Pain, swelling, redness, warmth in a joint, pain that lasts for more than 3 days and is also frequently occurring which causes difficulty in moving of a joint',
        'Stiffness or reduced movement of a joint usually in the morning or after exercising',
        'Certain types of arthritis can have symptoms such as fatigue, scaly itchy skin, rashes, fever, weight loss and even hair loss in spots',
      ],
      disItemExerciseList: [
        'exerciseItem10',
      ],
      disItemImagePaths: [
        'assets/images/disorders/disorderItem7_1.jpg',
        'assets/images/disorders/disorderItem7_2.jpg',
        'assets/images/disorders/disorderItem7_3.jpg',
        'assets/images/disorders/disorderItem7_4.jpg',
        'assets/images/disorders/disorderItem7_5.jpg',
        'assets/images/disorders/disorderItem7_6.jpg',
      ],
    ),
    DisorderItem(
      disItemId: 'disorderItem10',
      disItemTitle: 'Carpal Tunnel Syndrome',
      disItemDescription:
          'An entrapment neuropathy caused by the compression of the median nerve as it travels through the wrist\'s carpal tunnel.',
      disItemCauses: [
        'Generally caused by irritated carpal tunnel ligaments causing them to be inflamed and it compresses the median nerve making it painful',
        'Fluid retention during pregnancy',
        'Any repetitive stressful exercise, wrist injuries, diabetes, hyperthyroidism, age and smoking are some of the causes increasing the risk of Carpal Tunnel Syndrome in early phases',
      ],
      disItemSymptoms: [
        'Pain, numbness and paresthesias is felt over the first 3 fingers',
        'Pain radiates generally up the affected arm, with further progression, hand weakness, decreased fine motor coordination, clumsiness, reduced performance in holding capabilities of any fingers',
        'Pain at night increases due to additional problem of lower resting blood pressure',
      ],
      disItemExerciseList: [
        'exerciseItem10',
      ],
      disItemImagePaths: [
        'assets/images/disorders/disorderItem10_1.jpg',
        'assets/images/disorders/disorderItem10_2.jpg',
        'assets/images/disorders/disorderItem10_3.jpg',
        'assets/images/disorders/disorderItem10_4.jpg',
        'assets/images/disorders/disorderItem10_5.jpg',
        'assets/images/disorders/disorderItem10_6.jpg',
        'assets/images/disorders/disorderItem10_7.jpg',
        'assets/images/disorders/disorderItem10_8.jpg',
        'assets/images/disorders/disorderItem10_9.jpg',
      ],
    ),
  ];

  // Encapsulation for safety
  List<DisorderItem> get globalDisorderList => _globalDisorderList;
}
