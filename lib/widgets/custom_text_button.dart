import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final Function onPressed;
  final EdgeInsets? padding;
  final double? fontSize;
  final double? iconSize;
  final double? borderRadius;
  final Widget? child;
  final String? title;
  final IconData? icon;
  final MainAxisAlignment mainAxisAlignment;
  const CustomTextButton({
    Key? key,
    required this.onPressed,
    this.padding = const EdgeInsets.all(16),
    this.fontSize = 20,
    this.iconSize = 26,
    this.borderRadius = 10,
    this.child,
    this.title,
    this.icon,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius!),
        ),
        padding: widget.padding!,
      ),
      onPressed: () => widget.onPressed,
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        children: [
          if (widget.icon != null)
            Icon(
              widget.icon,
              size: widget.iconSize,
              color: const Color(0xff00e5ff),
            ),
          if (widget.title != null) ...[
            const SizedBox(width: 10),
            Text(
              widget.title!,
              style: TextStyle(fontSize: widget.fontSize, color: Theme.of(context).primaryColor),
            ),
          ],
          // widget.title != null
          //     ? Text(
          //         widget.title!,
          //         style: TextStyle(fontSize: widget.fontSize, color: Theme.of(context).primaryColor),
          //       )
          //     : Container(),
          widget.child ?? Container(),
        ],
      ),
    );
  }
}
