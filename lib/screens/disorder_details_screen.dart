import 'package:ar_therapy/screens/photo_view_screen.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../providers/disorder_list_provider.dart';

import '../widgets/custom_divider.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_card.dart';

// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';

class DisorderDetailsScreen extends StatefulWidget {
  final int disorderIndex;

  const DisorderDetailsScreen({
    Key? key,
    required this.disorderIndex,
  }) : super(key: key);

  @override
  State<DisorderDetailsScreen> createState() => _DisorderDetailsScreenState();
}

class _DisorderDetailsScreenState extends State<DisorderDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  CustomTextButton(
                    onPressed: () => {
                      Navigator.pop(context),
                    },
                    padding: const EdgeInsets.all(6.0),
                    icon: Icons.arrow_back,
                    borderRadius: 50,
                  ),
                  const SizedBox(width: 10),
                  const Text('Disorder Details'),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      Provider.of<DisorderListProvider>(context, listen: false)
                          .globalDisorderList[widget.disorderIndex]
                          .disItemTitle,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                    const CustomDivider(),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: const Color(0xff4d4d4d),
                        height: 250,
                        child: PageView.builder(
                          itemCount: Provider.of<DisorderListProvider>(context, listen: false)
                              .globalDisorderList[widget.disorderIndex]
                              .disItemImagePaths
                              .length,
                          itemBuilder: (context, pageViewIndex) => InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhotoViewScreen(
                                    passedImageList: Provider.of<DisorderListProvider>(context, listen: false)
                                        .globalDisorderList[widget.disorderIndex]
                                        .disItemImagePaths,
                                    passedSelectedIndex: pageViewIndex),
                              ),
                            ),
                            child: Container(
                              height: 200,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(Radius.circular(10)),
                                image: DecorationImage(
                                  image: AssetImage(
                                    Provider.of<DisorderListProvider>(context, listen: false)
                                        .globalDisorderList[widget.disorderIndex]
                                        .disItemImagePaths[pageViewIndex],
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // CustomCard(
                    //   padding: const EdgeInsets.all(4.0),
                    //   child: SingleChildScrollView(
                    //     scrollDirection: Axis.horizontal,
                    //     child: Row(
                    //       children: Provider.of<DisorderListProvider>(context, listen: false)
                    //           .globalDisorderList[widget.disorderIndex]
                    //           .disItemImagePaths
                    //           .map<Widget>(
                    //             (eachDisorderItemImagePath) => Container(
                    //               height: 200,
                    //               width: 200,
                    //               margin: const EdgeInsets.all(4.0),
                    //               decoration: BoxDecoration(
                    //                 image: DecorationImage(
                    //                   image: AssetImage(
                    //                     eachDisorderItemImagePath,
                    //                     // Provider.of<DisorderList>(context, listen: false)
                    //                     //     .globalDisorderList[widget.disorderIndex]
                    //                     //     .disItemImagePaths[disorderImageIndex],
                    //                   ),
                    //                   fit: BoxFit.fitHeight,
                    //                 ),
                    //               ),
                    //             ),
                    //           )
                    //           .toList(),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(height: 20),
                    CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Summary',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const CustomDivider(),
                          Text(
                            Provider.of<DisorderListProvider>(context, listen: false)
                                .globalDisorderList[widget.disorderIndex]
                                .disItemDescription,
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Causes',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const CustomDivider(),
                          for (var eachCause in Provider.of<DisorderListProvider>(context, listen: false)
                              .globalDisorderList[widget.disorderIndex]
                              .disItemCauses)
                            CustomCard(
                              color: const Color(0xff4d4d4d),
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '• ',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      eachCause,
                                      style: Theme.of(context).textTheme.bodyLarge,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    CustomCard(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Symptoms',
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                          const CustomDivider(),
                          for (var eachSymptom in Provider.of<DisorderListProvider>(context, listen: false)
                              .globalDisorderList[widget.disorderIndex]
                              .disItemSymptoms)
                            CustomCard(
                              color: const Color(0xff4d4d4d),
                              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '• ',
                                    style: Theme.of(context).textTheme.bodyLarge,
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      eachSymptom,
                                      style: Theme.of(context).textTheme.bodyLarge,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Expanded(
              //   child: CustomCard(
              //     child: ListView.builder(
              //       itemCount: Provider.of<DisorderList>(context, listen: false)
              //           .globalDisorderList[widget.disorderIndex]
              //           .disItemImagePaths
              //           .length,
              //       itemBuilder: (context, disorderImageIndex) => Container(
              //         height: 200,
              //         decoration: BoxDecoration(
              //           image: DecorationImage(
              //             image: AssetImage(
              //               Provider.of<DisorderList>(context, listen: false)
              //                   .globalDisorderList[widget.disorderIndex]
              //                   .disItemImagePaths[disorderImageIndex],
              //             ),
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
