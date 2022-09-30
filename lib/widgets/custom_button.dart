import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final Function onPressed;
  final Widget? child;
  final String? title;
  final IconData? icon;
  final MainAxisAlignment mainAxisAlignment;
  const CustomButton({
    Key? key,
    required this.onPressed,
    this.child,
    this.title,
    this.icon,
    this.mainAxisAlignment = MainAxisAlignment.center,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
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
        onTap: () => widget.onPressed,
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const DemoScreen3D(
        //         // parameters to pass, example
        //         // passedNotice: NoticeModel(
        //         //   noticeId: 1,
        //         //   noticeTitle: 'Notice Title',
        //         //   noticeDate: DateTime.now(),
        //         //   noticePosterName: 'John Doe',
        //         //   noticePosterEmail: 'johndoe@mail.com',
        //         // ),
        //         ),
        //   ),
        // )
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: widget.mainAxisAlignment,
            children: [
              if (widget.icon != null) ...[
                Icon(
                  widget.icon,
                  size: 26,
                ),
                const SizedBox(width: 10.0),
              ],
              widget.title != null
                  ? Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30.0),
                        child: Text(
                          widget.title!,
                        ),
                      ),
                    )
                  : Container(),
              widget.child ?? Container(),
            ],
          ),
        ),
      ),
    );
  }
}
