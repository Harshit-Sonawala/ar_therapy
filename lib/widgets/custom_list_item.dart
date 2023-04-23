import 'package:flutter/material.dart';

import './custom_divider.dart';

class CustomListItem extends StatefulWidget {
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final EdgeInsets padding;
  final Widget? child;
  final String? title;
  final String? body;
  final List<String>? images;
  final List<String>? chips;

  const CustomListItem({
    required this.onPressed,
    this.onLongPress,
    this.padding = const EdgeInsets.all(0.0),
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
    return Padding(
      padding: widget.padding,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xff3d3d3d),
        ),
        child: InkWell(
          onTap: widget.onPressed,
          onLongPress: widget.onLongPress,
          borderRadius: BorderRadius.circular(10),
          child: Column(
            children: [
              if (widget.images != null)
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        widget.images![0],
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[
                          Colors.black.withAlpha(0),
                          Colors.black38,
                        ],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        widget.title!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.images == null)
                      Text(
                        widget.title!,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    if (widget.images == null) const CustomDivider(),
                    Text(
                      '${widget.body!.substring(0, 71)}...',
                      style: Theme.of(context).textTheme.bodyMedium,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
