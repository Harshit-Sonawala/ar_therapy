import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  // final void Function() onPressed;
  final EdgeInsets? padding;
  final double? fontSize;
  final double? iconSize;
  final Widget? child;
  final String? title;
  final IconData? icon;
  final MainAxisAlignment mainAxisAlignment;
  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    this.padding = const EdgeInsets.all(16),
    this.fontSize = 22,
    this.iconSize = 26,
    this.child,
    this.title,
    this.icon,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  State<CustomElevatedButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: BoxDecoration(
        // color: const Color(0xff3d3d3d),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.blue,
            Color(0xff00e5ff),
          ],
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: widget.onPressed,
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: widget.padding!,
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            children: [
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  size: widget.iconSize,
                  color: Colors.white,
                ),
              if (widget.icon != null && widget.title != null) const SizedBox(width: 10),
              if (widget.title != null)
                Text(
                  widget.title!,
                  style: TextStyle(
                    fontSize: widget.fontSize,
                    color: Colors.white,
                  ),
                ),
              // widget.title != null
              //     ? Text(
              //         widget.title!,
              //         style: TextStyle(
              //          fontSize: widget.fontSize,
              //          color: Theme.of(context).primaryColor,
              //         ),
              //       )
              //     : Container(),
              widget.child ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}
