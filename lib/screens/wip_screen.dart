import 'package:flutter/material.dart';

class WipScreen extends StatefulWidget {
  final String screenName;

  const WipScreen({Key? key, required this.screenName}) : super(key: key);

  @override
  State<WipScreen> createState() => _WipScreenState();
}

class _WipScreenState extends State<WipScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.screenName,
                style: TextStyle(
                  fontSize: 32,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Work in progress...',
                style: TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
