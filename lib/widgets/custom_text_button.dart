import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final Function onPressed;
  final EdgeInsets? padding;
  final double? fontSize;
  final double? iconSize;
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
      style: TextButton.styleFrom(padding: widget.padding!),
      onPressed: () => widget.onPressed,
      child: Row(
        mainAxisAlignment: widget.mainAxisAlignment,
        children: [
          if (widget.icon != null) ...[
            Icon(
              widget.icon,
              size: widget.iconSize,
            ),
            const SizedBox(width: 10),
          ],
          widget.title != null
              ? Text(
                  widget.title!,
                  style: TextStyle(fontSize: widget.fontSize, color: Theme.of(context).primaryColor),
                )
              : Container(),
          widget.child ?? Container(),
        ],
      ),
    );
  }
}
