import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final EdgeInsets? padding;
  final Widget? child;
  final String backgroundImage;
  final Color? color;

  const CustomCard({
    this.padding = const EdgeInsets.all(16),
    this.child,
    this.backgroundImage = '',
    this.color = const Color(0xff3d3d3d),
    super.key,
  });

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.padding,
      decoration: widget.backgroundImage != ''
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(
                  widget.backgroundImage,
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.2),
                  BlendMode.darken,
                ),
              ),
            )
          : BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(10),
            ),
      child: widget.child,
    );
  }
}
