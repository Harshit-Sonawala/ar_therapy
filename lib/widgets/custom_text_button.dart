import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final VoidCallback onPressed;
  final EdgeInsets? padding;
  final EdgeInsets? childPadding;
  final double? fontSize;
  final double? iconSize;
  final BorderSide? border;
  final double? borderRadius;
  final Widget? child;
  final String? title;
  final IconData? icon;
  final MainAxisAlignment mainAxisAlignment;
  const CustomTextButton({
    Key? key,
    required this.onPressed,
    this.padding = const EdgeInsets.all(12),
    this.childPadding = const EdgeInsets.symmetric(vertical: 12),
    this.fontSize = 18,
    this.iconSize = 28,
    this.border = const BorderSide(color: Colors.transparent),
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
        side: widget.border!,
        padding: widget.padding!,
      ),
      onPressed: widget.onPressed,
      child: Padding(
        padding: widget.childPadding!,
        child: Row(
          mainAxisAlignment: widget.mainAxisAlignment,
          children: [
            if (widget.icon != null)
              Icon(
                widget.icon,
                size: widget.iconSize,
                color: const Color(0xff00e5ff),
              ),
            if (widget.icon != null && widget.title != null) const SizedBox(width: 10),
            if (widget.title != null)
              Text(
                widget.title!,
                style: TextStyle(
                  fontSize: widget.fontSize,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            // if (widget.title != null) ...[
            //   const SizedBox(width: 10),
            //   Text(
            //     widget.title!,
            //     style: TextStyle(fontSize: widget.fontSize, color: Theme.of(context).primaryColor),
            //   ),
            // ],
            // widget.title != null
            //     ? Text(
            //         widget.title!,
            //         style: TextStyle(fontSize: widget.fontSize, color: Theme.of(context).primaryColor),
            //       )
            //     : Container(),
            widget.child ?? Container(),
          ],
        ),
      ),
    );
  }
}
