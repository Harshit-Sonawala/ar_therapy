import 'package:flutter/material.dart';

import '../widgets/custom_card.dart';

class CustomListItem extends StatefulWidget {
  final VoidCallback onPressed;
  final Widget? child;
  final String? title;
  final String? body;
  final List<String>? images;
  final List<String>? chips;

  const CustomListItem({
    required this.onPressed,
    this.child,
    this.title,
    this.body,
    this.images,
    this.chips,
    super.key,
  });

  @override
  State<CustomListItem> createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: CustomCard(
        child: Column(
          children: [
            Image.asset(widget.images![0]),
            const SizedBox(height: 10),
            Text(
              widget.title!,
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.body!,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}
