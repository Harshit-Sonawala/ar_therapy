import 'package:flutter/material.dart';

import 'custom_card.dart';

class CustomCircularLoader extends StatefulWidget {
  final String title;

  const CustomCircularLoader({
    super.key,
    required this.title,
  });

  @override
  State<CustomCircularLoader> createState() => _CustomCircularLoaderState();
}

class _CustomCircularLoaderState extends State<CustomCircularLoader> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: CustomCard(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
