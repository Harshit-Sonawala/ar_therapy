import 'package:flutter/material.dart';

class CustomDivider extends StatefulWidget {
  const CustomDivider({super.key});

  @override
  State<CustomDivider> createState() => _CustomDividerState();
}

class _CustomDividerState extends State<CustomDivider> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 10,
      width: double.infinity,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Color(0xff4d4d4d),
            width: 1.4,
          ),
        ),
      ),
    );
  }
}
