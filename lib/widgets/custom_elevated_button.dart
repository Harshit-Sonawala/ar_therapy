import 'package:flutter/material.dart';

class CustomElevatedButton extends StatefulWidget {
  final VoidCallback onPressed;
  // final void Function() onPressed;
  final EdgeInsets? padding;
  final Widget? child;
  final String backgroundImage;
  final String? title;
  final double? fontSize;
  final IconData? icon;
  final double? iconSize;
  final IconData? trailingIcon;
  final double? trailingIconSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const CustomElevatedButton({
    //Key? key,
    required this.onPressed,
    this.padding = const EdgeInsets.all(16),
    this.child,
    this.backgroundImage = '',
    this.title,
    this.fontSize = 18,
    this.icon,
    this.iconSize = 28,
    this.trailingIcon,
    this.trailingIconSize = 28,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    super.key,
  }); // : super(key: key);

  @override
  State<CustomElevatedButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return Ink(
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
              // color: const Color(0xff3d3d3d),
              borderRadius: BorderRadius.circular(10),
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.blue,
                  Color(0xff00e5ff),
                ],
              ),
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
            crossAxisAlignment: widget.crossAxisAlignment,
            children: [
              if (widget.icon != null)
                Icon(
                  widget.icon,
                  size: widget.iconSize,
                  color: Colors.white,
                ),
              if (widget.icon != null && widget.title != null)
                const SizedBox(
                  width: 10,
                ),
              if (widget.title != null)
                Text(
                  widget.title!,
                  style: TextStyle(
                    fontSize: widget.fontSize,
                    color: Colors.white,
                  ),
                ),
              if (widget.trailingIcon != null && widget.title != null)
                const SizedBox(
                  width: 10,
                ),
              if (widget.trailingIcon != null)
                Icon(
                  widget.trailingIcon,
                  size: widget.trailingIconSize,
                  color: Colors.white,
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
