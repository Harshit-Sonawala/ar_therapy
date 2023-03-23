import 'package:flutter/material.dart';

import '../widgets/custom_text_button.dart';
import '../widgets/custom_card.dart';

import 'package:photo_view/photo_view_gallery.dart';

class PhotoViewScreen extends StatefulWidget {
  final List<String> passedImageList;
  final int passedSelectedIndex;
  const PhotoViewScreen({required this.passedImageList, required this.passedSelectedIndex, super.key});

  @override
  State<PhotoViewScreen> createState() => _PhotoViewScreenState();
}

class _PhotoViewScreenState extends State<PhotoViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PhotoViewGallery.builder(
              scrollPhysics: const BouncingScrollPhysics(),
              itemCount: widget.passedImageList.length,
              builder: (BuildContext context, int photoViewGalleryIndex) => PhotoViewGalleryPageOptions(
                imageProvider: AssetImage(
                  widget.passedImageList[photoViewGalleryIndex],
                ),
                // initialScale: PhotoViewComputedScale.contained * 0.8,
                // heroAttributes: PhotoViewHeroAttributes(tag: widget.passedSelectedIndex),
              ),
              loadingBuilder: (context, event) => Center(
                child: CustomCard(
                  padding: const EdgeInsets.all(40.0),
                  child: CircularProgressIndicator(
                    value: event == null ? 0 : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              backgroundDecoration: const BoxDecoration(color: Color(0xff3d3d3d)),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: CustomTextButton(
                onPressed: () => {
                  Navigator.pop(context),
                },
                padding: const EdgeInsets.all(6.0),
                icon: Icons.arrow_back,
                borderRadius: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
