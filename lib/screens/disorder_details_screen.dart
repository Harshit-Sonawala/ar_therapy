import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import '../models/disorder_item.dart';
import '../providers/disorder_list_provider.dart';

import '../widgets/custom_divider.dart';
import '../widgets/custom_elevated_button.dart';
import '../widgets/custom_text_button.dart';
import '../widgets/custom_card.dart';

import '../screens/photo_view_screen.dart';
import '../screens/webview_screen.dart';
// import 'package:photo_view/photo_view.dart';
// import 'package:photo_view/photo_view_gallery.dart';

class DisorderDetailsScreen extends StatefulWidget {
  final DisorderItem passedDisorderItem;

  const DisorderDetailsScreen({
    Key? key,
    required this.passedDisorderItem,
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
          child: Padding(
            padding: const EdgeInsets.all(20.0),
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
                    Text(
                      widget.passedDisorderItem.disItemTitle,
                      style: Theme.of(context).textTheme.displayLarge,
                    ),
                  ],
                ),
                Column(
                  children: [
                    const CustomDivider(),
                    const SizedBox(height: 10),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: const Color(0xff4d4d4d),
                        height: 250,
                        child: PageView.builder(
                          itemCount: widget.passedDisorderItem.disItemImagePaths.length,
                          itemBuilder: (context, pageViewIndex) => InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PhotoViewScreen(
                                    passedImageList: widget.passedDisorderItem.disItemImagePaths,
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
                                    widget.passedDisorderItem.disItemImagePaths[pageViewIndex],
                                  ),
                                  fit: BoxFit.cover,
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
                            widget.passedDisorderItem.disItemDescription,
                            style: Theme.of(context).textTheme.bodyMedium,
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
                          for (var eachCause in widget.passedDisorderItem.disItemCauses)
                            CustomCard(
                              color: const Color(0xff4d4d4d),
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '• ',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      eachCause,
                                      style: Theme.of(context).textTheme.bodyMedium,
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
                          for (var eachSymptom in widget.passedDisorderItem.disItemSymptoms)
                            CustomCard(
                              color: const Color(0xff4d4d4d),
                              padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0),
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '• ',
                                    style: Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  const SizedBox(width: 5),
                                  Expanded(
                                    child: Text(
                                      eachSymptom,
                                      style: Theme.of(context).textTheme.bodyMedium,
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
                    CustomElevatedButton(
                      onPressed: () => {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => WebviewScreen(
                              passedSearchQuery: widget.passedDisorderItem.disItemTitle,
                            ),
                          ),
                        )
                      },
                      // padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                      borderRadius: BorderRadius.circular(50.0),
                      child: Row(
                        children: [
                          const Icon(Icons.travel_explore),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Search the Web',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
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
      ),
    );
  }
}
