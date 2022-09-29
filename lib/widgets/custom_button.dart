// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class CustomButton extends StatelessWidget {
//   const CustomButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Ink(
//       decoration: BoxDecoration(
//         // color: const Color(0xff3d3d3d),
//         gradient: const LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Colors.blue,
//             Color(0xff00e5ff),
//           ],
//         ),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       child: InkWell(
//         onTap: () => {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => const DemoScreen3D(
//                   // parameters to pass, example
//                   // passedNotice: NoticeModel(
//                   //   noticeId: 1,
//                   //   noticeTitle: 'Notice Title',
//                   //   noticeDate: DateTime.now(),
//                   //   noticePosterName: 'John Doe',
//                   //   noticePosterEmail: 'johndoe@mail.com',
//                   // ),
//                   ),
//             ),
//           )
//         },
//         customBorder: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(30.0),
//           child: Row(
//             children: const [
//               Icon(
//                 Icons.threed_rotation,
//                 size: 36,
//               ),
//               SizedBox(width: 20.0),
//               Text(
//                 'View 3D Demo',
//                 style: TextStyle(
//                   fontSize: 24,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     ),
//   }
// }